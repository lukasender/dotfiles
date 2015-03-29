# export all installed formulas to file $1
# e.g. ./export_formulas.sh formulas
FORMULAS=$1
if [[ -z "$FORMULAS" ]]
then
    echo '-z'
    FORMULAS=~/sandbox.playground/dotfiles/brew/formulas
fi
echo 'nope'
brew list | sed -e 's/(.*)/(.*)/' > "$FORMULAS"
brew cask list | sed -e 's/(.*)/(.*)/' > "$FORMULAS-cask"
