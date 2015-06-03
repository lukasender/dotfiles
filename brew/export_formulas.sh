# export all installed formulas to file $1
# e.g. ./export_formulas.sh formulas
FORMULAS=$1
if [[ -z "$FORMULAS" ]]
then
    echo 'you did not specify a file to export to.'
    FORMULAS=~/sandbox.playground/dotfiles/brew/formulas
    echo 'I chose' $FORMULAS
fi
brew list | sed -e 's/(.*)/(.*)/' > "$FORMULAS"
brew cask list | sed -e 's/(.*)/(.*)/' > "$FORMULAS-cask"
