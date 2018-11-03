set -ex

echo 'collect'
cp ~/.gitconfig dotfiles
cp ~/.zshrc dotfiles
cp /usr/local/bin/git-safe-reset bin
cp /usr/local/bin/git-new-branch bin
cp /usr/local/bin/git-new-branch-last bin
