# export all installed formulas to file $1
# e.g. ./export_formulas.sh formulas
brew list | sed -e 's/(.*)/(.*)/' > ~/sandbox.playground/dotfiles/brew/$1
