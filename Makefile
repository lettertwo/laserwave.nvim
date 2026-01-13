PROJECT_NAME := laserwave
NVIM_VERSION := 0.10.0
LUA_PATH := './lua_modules/share/lua/5.1/?.lua;./lua_modules/share/lua/5.1/?/init.lua;./vendor/shipwright.nvim/lua/?.lua;./vendor/shipwright.nvim/lua/?/init.lua;./lua/?.lua;./lua/?/init.lua;;'
LUA_CPATH := './lua_modules/lib/lua/5.1/?.so;;'

# Allow passing arguments after target name
%:
	@:

./lua_modules/bin/%:
	@mkdir -p $(@D)
	@mkdir -p .luarocks
	@luarocks config --scope project lua_version 5.1
	@luarocks install $*

./lua_modules/share/lua/5.1/%.lua:
	@mkdir -p $(@D)
	@mkdir -p .luarocks
	@luarocks config --scope project lua_version 5.1
	@luarocks install $*

./vendor/shipwright.nvim:
	@mkdir -p $@
	@git clone git@github.com:rktjmp/shipwright.nvim.git $@

./vendor/panvimdoc/panvimdoc.sh:
	@mkdir -p $(@D)
	@git clone git@github.com:kdheepak/panvimdoc.git $(@D)

./doc/%.txt: ./vendor/panvimdoc/panvimdoc.sh README.md Makefile
	@mkdir -p $(@D)
	@$< --project-name "$*" --input-file "$(word 2,$^)" --vim-version "NVIM >= $(NVIM_VERSION)"

./doc/tags: README.md Makefile
	@mkdir -p $(@D)
	@printf "%s\n" "Generating help tags in $(@D)"
	@printf "%s\n" "nvim --headless -c 'helptags $(@D)' -c q"
	@nvim --headless -c "helptags $(@D)" -c q

.PHONY: doc
doc: ./doc/$(PROJECT_NAME).txt ./doc/tags

.PHONY: build
build: ./lua_modules/bin/nlua ./vendor/shipwright.nvim ./lua_modules/share/lua/5.1/hsluv.lua
	@LUA_PATH=$(LUA_PATH) LUA_CPATH=$(LUA_CPATH) $< -e 'require("shipwright").build()'

.PHONY: test
test: ./lua_modules/bin/busted ./lua_modules/bin/nlua ./lua_modules/share/lua/5.1/hsluv.lua
	@LUA_PATH=$(LUA_PATH) LUA_CPATH=$(LUA_CPATH) $< --lua $(word 2,$^) $(or $(filter-out $@,$(MAKECMDGOALS)),lua/)

.PHONY: install-hooks
install-hooks:
	@./git-hooks/install.sh

.PHONY: install-rocks
install-rocks: ./lua_modules/bin/busted ./lua_modules/bin/nlua ./lua_modules/share/lua/5.1/hsluv.lua

.PHONY: install-vendor
install-vendor: ./vendor/shipwright.nvim ./vendor/panvimdoc/panvimdoc.sh

.PHONY: install
install: install-rocks install-vendor install-hooks
