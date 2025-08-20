def main [] {
    z ~/books
    let book = (ls | get name | str join (char nl) | rofi -dmenu | str trim)
    if $book != "" {
        zathura $book
    }
}

