def vim [...args] {
  if ($args | length) == 1 and ($args | first | path type) == 'dir' {
    nvim -c $"Oil --float ($args | first)"
  } else if ($args | is-empty) {
    nvim
  } else {
    nvim ...$args
  }
}

