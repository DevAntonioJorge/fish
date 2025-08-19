if status is-interactive
    source (starship init fish --print-full-init | psub)
    set -gx PATH /home/aj/.cargo/bin $PATH
    set -gx PATH /usr/local/go/bin $PATH
    zoxide init fish | source
end
