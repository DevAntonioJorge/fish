if status is-interactive
    source (/usr/sbin/starship init fish --print-full-init | psub)
    zoxide init fish | source
end
