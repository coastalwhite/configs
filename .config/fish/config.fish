# Initiate the starship prompt
starship init fish | source

source $HOME/.config/shell/aliases
alias resource="source $HOME/.config/fish/config.fish"

# Remove the fish greeting
set --erase fish_greeting

################################################################################
# Path exports
################################################################################
set -x PATH $HOME/bin /usr/local/bin $PATH

# Deno
set -x PATH $HOME/.deno/bin $PATH
# Cargo
set -x PATH $HOME/.cargo/bin $PATH
################################################################################


################################################################################
# Abbreviations
################################################################################
################################################################################


################################################################################
# Other environment variables
################################################################################
set -x SHELL fish

# Set editor to neovim
set -x EDITOR nvim

# Starship config (XDG)
set -x STARSHIP_CONFIG $HOME/.config/starship/config.toml
################################################################################


################################################################################
# Color Scheme
################################################################################
source $HOME/.config/fish/colors/*
base16-materia
################################################################################

################################################################################
# Functions
################################################################################
## Fetches a file a symlink points to and copies it to the location of the
## symlink.
function sn-fetch
    set dst $argv[1]
    set src ( readlink "$dst" )

    rm "$dst"
    cp -r "$src" "$dst"
end
################################################################################
