function vim
    if test (count $argv) -eq 1 -a -d "$argv[1]"
        nvim -c "Oil --float $argv[1]"
    else if test (count $argv) -eq 0
        nvim
    else
        command nvim $argv
    end
end
