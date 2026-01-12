#!/bin/sh
#
# Install git hooks for local development
#
# This script copies hooks from git-hooks/ to .git/hooks/
# and makes them executable.
#

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "${GREEN}Installing git hooks...${NC}"
echo ""

# Ensure we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
  echo "Error: Not in a git repository"
  exit 1
fi

# Get the git directory (handles both .git and worktrees)
GIT_DIR=$(git rev-parse --git-dir)
HOOKS_DIR="$GIT_DIR/hooks"

# Create hooks directory if it doesn't exist
mkdir -p "$HOOKS_DIR"

# Install commit-msg hook
if [ -f git-hooks/commit-msg ]; then
  cp git-hooks/commit-msg "$HOOKS_DIR/commit-msg"
  chmod +x "$HOOKS_DIR/commit-msg"
  echo "✓ Installed commit-msg hook to $HOOKS_DIR"
else
  echo "Warning: git-hooks/commit-msg not found"
  exit 1
fi

# Install pre-push hook
if [ -f git-hooks/pre-push ]; then
  cp git-hooks/pre-push "$HOOKS_DIR/pre-push"
  chmod +x "$HOOKS_DIR/pre-push"
  echo "✓ Installed pre-push hook to $HOOKS_DIR"
else
  echo "Warning: git-hooks/pre-push not found"
fi

# Check if a global hooks path is configured
GLOBAL_HOOKS_PATH=$(git config --global --get core.hooksPath || echo "")

if [ -n "$GLOBAL_HOOKS_PATH" ]; then
  echo ""
  echo "${YELLOW}Note: Global core.hooksPath is set to: $GLOBAL_HOOKS_PATH${NC}"
  echo "Setting local core.hooksPath to use repo-specific hooks."
  echo "The local hook will chain to your global hook automatically."
  echo ""

  # Set local hooksPath to override global setting for this repo
  git config --local core.hooksPath "$HOOKS_DIR"
  echo "✓ Configured local core.hooksPath = $HOOKS_DIR"
fi

echo ""
echo "${GREEN}Git hooks installed successfully!${NC}"
echo ""
echo "Installed hooks:"
echo "  • commit-msg: Validates Conventional Commits format"
echo "  • pre-push: Prevents pushing fixup/squash/amend commits"
echo ""
echo "To configure the commit message template:"
echo "  ${YELLOW}git config commit.template .gitmessage${NC}"
echo ""
echo "To bypass pre-push check (for WIP branches):"
echo "  ${YELLOW}git push --no-verify${NC}"
echo ""
