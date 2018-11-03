set -ex

echo 'install'
cp dotfiles/.gitconfig ~/
cp dotfiles/.zshrc ~/
cp bin/git-safe-reset bin /usr/local/bin/
cp bin/git-new-branch bin /usr/local/bin/
cp bin/git-new-branch-last /usr/local/bin/

