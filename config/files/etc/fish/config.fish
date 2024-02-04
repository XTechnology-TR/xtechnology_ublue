#set -gx HOSTNAME (uname -n)
#set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME "$HOME/.config"
#set -gx XDG_CACHE_HOME "$HOME/.cache"
#set -gx XDG_SESSION_TYPE x11
set -gx SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh
set -gx GNOME_KEYRING_CONTROL $XDG_RUNTIME_DIR/keyring


# custom bindings
bind --mode insert --user \ce 'commandline -a ' '(commandline -t); commandline -C 100000'

### KEY BINDINGS
function fish_user_key_bindings
	bind \e. "history-token-search-backward"
end

#source $XDG_CONFIG_HOME/fish/web.fish
source $XDG_CONFIG_HOME/fish/aliases.fish
source $HOME/.profile

# Git prompt status
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_showupstream auto

# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate red

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

# pnpm
set -gx PNPM_HOME "/var/home/xtechnology/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


# Start X at login

#if status is-login
#    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
#        exec startx -- -keeptty
#    end
#end


# source /etc/profile with bash
#if status is-login
#    exec bash -c "test -e /etc/profile && source /etc/profile;\
#    exec fish"
#end


# Start starship

#if command -q starship
#   starship init fish | source
#end
