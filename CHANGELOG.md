# Changelog

## [2.0.0](https://github.com/lettertwo/laserwave.nvim/compare/v1.0.0...v2.0.0) (2026-01-22)


### ⚠ BREAKING CHANGES

* remove neovim transform
* **config:** add syntax_mode option
* **spec:** remove majority of semantic highlights
* **spec:** link lsp type keyword to keyword
* **spec:** swap keyword and operator colors
* remove lsp plugin
* **spec:** improve lsp type highlights
* **spec:** add missing treesitter groups
* **template:** input palette instead of specs
* **spec:** hoist all color mixing out of spec
* **spec:** use palette rather than introspecting other specs
* **spec:** set plugins before semantic highlights
* **config:** flatten and validate options
* **transform:** implement terminal colors
* **config:** remove unused dev option
* **transform:** inject all specs at once
* :Laserwave <subcommand>
* namespace types
* update nvim builtin highlight groups
* remove lush.nvim dependency

### Features

* add background attribute to flavor ([64f8005](https://github.com/lettertwo/laserwave.nvim/commit/64f8005ee16d748f17644cc769007cfa229d8ece))
* **command:** add toggle subcommand ([ddc462a](https://github.com/lettertwo/laserwave.nvim/commit/ddc462ace5fb3599717b48f0ae43ac0aee7b9236))
* **config:** (re-)set colorscheme on setup ([c4ea728](https://github.com/lettertwo/laserwave.nvim/commit/c4ea728e3df9bce1606c9593ebaa1ff0287a7d8c))
* **spec:** add missing treesitter groups ([8f1c678](https://github.com/lettertwo/laserwave.nvim/commit/8f1c67894d1b076f0104ca4c774ec19c8fe0605e))
* **spec:** improve lsp type highlights ([62ebf58](https://github.com/lettertwo/laserwave.nvim/commit/62ebf583ca75c70ec8bfb0a0d6b6391926fdf8ee))
* **spec:** swap keyword and operator colors ([839c06c](https://github.com/lettertwo/laserwave.nvim/commit/839c06c62adff055e23f2c2bd86f4480c599b939))
* **transform:** add ghostty transform ([991d433](https://github.com/lettertwo/laserwave.nvim/commit/991d4333227cd9fe989713867cafb7421b301579))
* update nvim builtin highlight groups ([1e419bb](https://github.com/lettertwo/laserwave.nvim/commit/1e419bb5faa4ebb9715707d9685e49dece78b4c2))


### Bug Fixes

* **config:** add syntax_mode option ([513c8ef](https://github.com/lettertwo/laserwave.nvim/commit/513c8ef92b3c429285e51410423c9520ae24b5dd))
* **config:** deepcopy current config ([45226d3](https://github.com/lettertwo/laserwave.nvim/commit/45226d38ce120bd38389f28b2578aa53a27a05f5))
* **config:** remove unused dev option ([c457d98](https://github.com/lettertwo/laserwave.nvim/commit/c457d984533063c6d547346f15e71b6b45b07b9b))
* reset semantic highlights on colorscheme load ([c6dfe7e](https://github.com/lettertwo/laserwave.nvim/commit/c6dfe7e3a8e5ced74b57930ea2195168acf6de7e))
* **spec:** add specs index ([0d73936](https://github.com/lettertwo/laserwave.nvim/commit/0d73936590f720374872775114e36486eb4a99c6))
* **spec:** link lsp type keyword to keyword ([71d84fd](https://github.com/lettertwo/laserwave.nvim/commit/71d84fd26f72e5eabac3c0250c366bc1a060120a))
* **spec:** make StatusLine fg less prominent ([e406efa](https://github.com/lettertwo/laserwave.nvim/commit/e406efab9beb2dfc857145498ddcb5a3d330a1dc))
* **spec:** remove majority of semantic highlights ([5eca270](https://github.com/lettertwo/laserwave.nvim/commit/5eca270bf54d5e9a3fc005d2610cd3f6dcfbdcf4))
* **spec:** set plugins before semantic highlights ([367357d](https://github.com/lettertwo/laserwave.nvim/commit/367357d511abbdebce39c34613cfefd9bfd1efaa))
* **spec:** use palette rather than introspecting other specs ([c6b456b](https://github.com/lettertwo/laserwave.nvim/commit/c6b456bc202705ec575048bcbcb63e2651acd715))
* **transform:** implement terminal colors ([8d5e536](https://github.com/lettertwo/laserwave.nvim/commit/8d5e53604202810d4f4a7f68b596ffedabf787d6))


### Code Refactoring

* :Laserwave &lt;subcommand&gt; ([21270ea](https://github.com/lettertwo/laserwave.nvim/commit/21270ea748edbfd215082a45c469bdedd72bb68f))
* **config:** flatten and validate options ([76fe0e7](https://github.com/lettertwo/laserwave.nvim/commit/76fe0e750885289bdd99d29ab91587ba7a40f7f7))
* **dev:** merge dev and dist builds ([66dc3cb](https://github.com/lettertwo/laserwave.nvim/commit/66dc3cb6dfd2de1e0d8ee762fa7f95f349366bee))
* **groups:** rename specs to groups ([0b2da86](https://github.com/lettertwo/laserwave.nvim/commit/0b2da86073c12f25a2d515ce54a2c1d2a89e4104))
* move flavor and palette next to transformer ([4e07311](https://github.com/lettertwo/laserwave.nvim/commit/4e07311aec46a196d99fde951ac23968ec95f375))
* move template next to transformer ([19a4927](https://github.com/lettertwo/laserwave.nvim/commit/19a49274bf154336011487510b85192c72fd7ea9))
* namespace types ([8767edc](https://github.com/lettertwo/laserwave.nvim/commit/8767edc342d6088be0246e42626c1bc0b6fc57e4))
* remove compiler ([9df951e](https://github.com/lettertwo/laserwave.nvim/commit/9df951e84c81a57a89bec516a68d6b61094db3b4))
* remove lsp plugin ([31aa3c7](https://github.com/lettertwo/laserwave.nvim/commit/31aa3c74b96146df8a923084f89846889f679fce))
* remove lush.nvim dependency ([00a634c](https://github.com/lettertwo/laserwave.nvim/commit/00a634cc286a97ed7e18fcf2b641a4eb4c04bfb7))
* remove neovim transform ([82f2540](https://github.com/lettertwo/laserwave.nvim/commit/82f25408a37ec42b5d7f2cabf79f5b5d10047235))
* **spec:** hoist all color mixing out of spec ([ab8d59c](https://github.com/lettertwo/laserwave.nvim/commit/ab8d59ceaf0ffb08774ca7742a0148cf196ad0c4))
* **template:** input palette instead of specs ([9985326](https://github.com/lettertwo/laserwave.nvim/commit/99853260a5184870bc6a12a994efbab24fecc0e7))
* **transform:** inject all specs at once ([b0ceb6d](https://github.com/lettertwo/laserwave.nvim/commit/b0ceb6db4b75c27b5be788bd8468744d5dd67b44))

## [1.0.0](https://github.com/lettertwo/laserwave.nvim/compare/v0.1.0...v1.0.0) (2026-01-12)


### Bug Fixes

* italic_keywords option ([6c9a033](https://github.com/lettertwo/laserwave.nvim/commit/6c9a0333d02f0c9e381dfd7104211798a52c21b4))


### Documentation

* update ([7dccd19](https://github.com/lettertwo/laserwave.nvim/commit/7dccd19d8575b4645a5956c8ba5a443410a72cee))
