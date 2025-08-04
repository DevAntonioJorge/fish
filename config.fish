if status is-interactive
    source (starship init fish --print-full-init | psub)
    set -gx PATH /home/aj/.cargo/bin $PATH
    zoxide init fish | source
end
