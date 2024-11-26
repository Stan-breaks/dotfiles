# ~/.config/fish/conf.d/yazi.fish

# Set Yazi as the file manager
if type -q yazi
    # Function to cd into the directory where yazi exits
    function ya
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # Key bindings - optional but recommended
    bind \co 'ya' # Ctrl+O to open Yazi
    
    # Set as default file manager - optional
    alias fm='ya'
end
