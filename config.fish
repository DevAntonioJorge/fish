if status is-interactive
    source (starship init fish --print-full-init | psub)
    zoxide init fish | source
end
