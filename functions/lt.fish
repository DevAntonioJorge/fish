function lt
    set -l level 2
    set -l args $argv
    
    # Se primeiro argumento é um número, usa como level
    if test (count $argv) -gt 0 && string match -q -r '^[0-9]+$' $argv[1]
        set level $argv[1]
        set args $argv[2..]
    end
    
    eza --tree --icons --group --header --group-directories-first --level=$level $args
end