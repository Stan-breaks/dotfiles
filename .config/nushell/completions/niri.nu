module completions {

  # A scrollable-tiling Wayland compositor
  export extern niri [
    --config(-c): path        # Path to config file (default: `$XDG_CONFIG_HOME/niri/config.kdl`)
    --session                 # Import environment globally to systemd and D-Bus, run D-Bus services
    ...command: string        # Command to run upon compositor startup
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
  ]

  # Communicate with the running niri instance
  export extern "niri msg" [
    --json(-j)                # Format output as JSON
    --help(-h)                # Print help
  ]

  # List connected outputs
  export extern "niri msg outputs" [
    --help(-h)                # Print help
  ]

  # List workspaces
  export extern "niri msg workspaces" [
    --help(-h)                # Print help
  ]

  # List open windows
  export extern "niri msg windows" [
    --help(-h)                # Print help
  ]

  # List open layer-shell surfaces
  export extern "niri msg layers" [
    --help(-h)                # Print help
  ]

  # Get the configured keyboard layouts
  export extern "niri msg keyboard-layouts" [
    --help(-h)                # Print help
  ]

  # Print information about the focused output
  export extern "niri msg focused-output" [
    --help(-h)                # Print help
  ]

  # Print information about the focused window
  export extern "niri msg focused-window" [
    --help(-h)                # Print help
  ]

  # Pick a window with the mouse and print information about it
  export extern "niri msg pick-window" [
    --help(-h)                # Print help
  ]

  # Pick a color from the screen with the mouse
  export extern "niri msg pick-color" [
    --help(-h)                # Print help
  ]

  # Perform an action
  export extern "niri msg action" [
    --help(-h)                # Print help
  ]

  # Exit niri
  export extern "niri msg action quit" [
    --skip-confirmation(-s)   # Skip the "Press Enter to confirm" prompt
    --help(-h)                # Print help
  ]

  # Power off all monitors via DPMS
  export extern "niri msg action power-off-monitors" [
    --help(-h)                # Print help
  ]

  # Power on all monitors via DPMS
  export extern "niri msg action power-on-monitors" [
    --help(-h)                # Print help
  ]

  # Spawn a command
  export extern "niri msg action spawn" [
    ...command: string        # Command to spawn
    --help(-h)                # Print help
  ]

  # Spawn a command through the shell
  export extern "niri msg action spawn-sh" [
    command: string           # Command to run
    --help(-h)                # Print help
  ]

  # Do a screen transition
  export extern "niri msg action do-screen-transition" [
    --delay-ms(-d): string    # Delay in milliseconds for the screen to freeze before starting the transition
    --help(-h)                # Print help
  ]

  def "nu-complete niri msg action screenshot show_pointer" [] {
    [ "true" "false" ]
  }

  # Open the screenshot UI
  export extern "niri msg action screenshot" [
    --show-pointer(-p): string@"nu-complete niri msg action screenshot show_pointer" # Whether to show the mouse pointer by default in the screenshot UI
    --help(-h)                # Print help
  ]

  def "nu-complete niri msg action screenshot-screen write_to_disk" [] {
    [ "true" "false" ]
  }

  def "nu-complete niri msg action screenshot-screen show_pointer" [] {
    [ "true" "false" ]
  }

  # Screenshot the focused screen
  export extern "niri msg action screenshot-screen" [
    --write-to-disk(-d): string@"nu-complete niri msg action screenshot-screen write_to_disk" # Write the screenshot to disk in addition to putting it in your clipboard
    --show-pointer(-p): string@"nu-complete niri msg action screenshot-screen show_pointer" # Whether to include the mouse pointer in the screenshot
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action screenshot-window write_to_disk" [] {
    [ "true" "false" ]
  }

  # Screenshot the focused window
  export extern "niri msg action screenshot-window" [
    --id: string              # Id of the window to screenshot
    --write-to-disk(-d): string@"nu-complete niri msg action screenshot-window write_to_disk" # Write the screenshot to disk in addition to putting it in your clipboard
    --help(-h)                # Print help (see more with '--help')
  ]

  # Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
  export extern "niri msg action toggle-keyboard-shortcuts-inhibit" [
    --help(-h)                # Print help
  ]

  # Close the focused window
  export extern "niri msg action close-window" [
    --id: string              # Id of the window to close
    --help(-h)                # Print help (see more with '--help')
  ]

  # Toggle fullscreen on the focused window
  export extern "niri msg action fullscreen-window" [
    --id: string              # Id of the window to toggle fullscreen of
    --help(-h)                # Print help (see more with '--help')
  ]

  # Toggle windowed (fake) fullscreen on the focused window
  export extern "niri msg action toggle-windowed-fullscreen" [
    --id: string              # Id of the window to toggle windowed fullscreen of
    --help(-h)                # Print help (see more with '--help')
  ]

  # Focus a window by id
  export extern "niri msg action focus-window" [
    --id: string              # Id of the window to focus
    --help(-h)                # Print help
  ]

  # Focus a window in the focused column by index
  export extern "niri msg action focus-window-in-column" [
    index: string             # Index of the window in the column
    --help(-h)                # Print help (see more with '--help')
  ]

  # Focus the previously focused window
  export extern "niri msg action focus-window-previous" [
    --help(-h)                # Print help
  ]

  # Focus the column to the left
  export extern "niri msg action focus-column-left" [
    --help(-h)                # Print help
  ]

  # Focus the column to the right
  export extern "niri msg action focus-column-right" [
    --help(-h)                # Print help
  ]

  # Focus the first column
  export extern "niri msg action focus-column-first" [
    --help(-h)                # Print help
  ]

  # Focus the last column
  export extern "niri msg action focus-column-last" [
    --help(-h)                # Print help
  ]

  # Focus the next column to the right, looping if at end
  export extern "niri msg action focus-column-right-or-first" [
    --help(-h)                # Print help
  ]

  # Focus the next column to the left, looping if at start
  export extern "niri msg action focus-column-left-or-last" [
    --help(-h)                # Print help
  ]

  # Focus a column by index
  export extern "niri msg action focus-column" [
    index: string             # Index of the column to focus
    --help(-h)                # Print help (see more with '--help')
  ]

  # Focus the window or the monitor above
  export extern "niri msg action focus-window-or-monitor-up" [
    --help(-h)                # Print help
  ]

  # Focus the window or the monitor below
  export extern "niri msg action focus-window-or-monitor-down" [
    --help(-h)                # Print help
  ]

  # Focus the column or the monitor to the left
  export extern "niri msg action focus-column-or-monitor-left" [
    --help(-h)                # Print help
  ]

  # Focus the column or the monitor to the right
  export extern "niri msg action focus-column-or-monitor-right" [
    --help(-h)                # Print help
  ]

  # Focus the window below
  export extern "niri msg action focus-window-down" [
    --help(-h)                # Print help
  ]

  # Focus the window above
  export extern "niri msg action focus-window-up" [
    --help(-h)                # Print help
  ]

  # Focus the window below or the column to the left
  export extern "niri msg action focus-window-down-or-column-left" [
    --help(-h)                # Print help
  ]

  # Focus the window below or the column to the right
  export extern "niri msg action focus-window-down-or-column-right" [
    --help(-h)                # Print help
  ]

  # Focus the window above or the column to the left
  export extern "niri msg action focus-window-up-or-column-left" [
    --help(-h)                # Print help
  ]

  # Focus the window above or the column to the right
  export extern "niri msg action focus-window-up-or-column-right" [
    --help(-h)                # Print help
  ]

  # Focus the window or the workspace below
  export extern "niri msg action focus-window-or-workspace-down" [
    --help(-h)                # Print help
  ]

  # Focus the window or the workspace above
  export extern "niri msg action focus-window-or-workspace-up" [
    --help(-h)                # Print help
  ]

  # Focus the topmost window
  export extern "niri msg action focus-window-top" [
    --help(-h)                # Print help
  ]

  # Focus the bottommost window
  export extern "niri msg action focus-window-bottom" [
    --help(-h)                # Print help
  ]

  # Focus the window below or the topmost window
  export extern "niri msg action focus-window-down-or-top" [
    --help(-h)                # Print help
  ]

  # Focus the window above or the bottommost window
  export extern "niri msg action focus-window-up-or-bottom" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the left
  export extern "niri msg action move-column-left" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the right
  export extern "niri msg action move-column-right" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the start of the workspace
  export extern "niri msg action move-column-to-first" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the end of the workspace
  export extern "niri msg action move-column-to-last" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the left or to the monitor to the left
  export extern "niri msg action move-column-left-or-to-monitor-left" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the right or to the monitor to the right
  export extern "niri msg action move-column-right-or-to-monitor-right" [
    --help(-h)                # Print help
  ]

  # Move the focused column to a specific index on its workspace
  export extern "niri msg action move-column-to-index" [
    index: string             # New index for the column
    --help(-h)                # Print help (see more with '--help')
  ]

  # Move the focused window down in a column
  export extern "niri msg action move-window-down" [
    --help(-h)                # Print help
  ]

  # Move the focused window up in a column
  export extern "niri msg action move-window-up" [
    --help(-h)                # Print help
  ]

  # Move the focused window down in a column or to the workspace below
  export extern "niri msg action move-window-down-or-to-workspace-down" [
    --help(-h)                # Print help
  ]

  # Move the focused window up in a column or to the workspace above
  export extern "niri msg action move-window-up-or-to-workspace-up" [
    --help(-h)                # Print help
  ]

  # Consume or expel the focused window left
  export extern "niri msg action consume-or-expel-window-left" [
    --id: string              # Id of the window to consume or expel
    --help(-h)                # Print help (see more with '--help')
  ]

  # Consume or expel the focused window right
  export extern "niri msg action consume-or-expel-window-right" [
    --id: string              # Id of the window to consume or expel
    --help(-h)                # Print help (see more with '--help')
  ]

  # Consume the window to the right into the focused column
  export extern "niri msg action consume-window-into-column" [
    --help(-h)                # Print help
  ]

  # Expel the focused window from the column
  export extern "niri msg action expel-window-from-column" [
    --help(-h)                # Print help
  ]

  # Swap focused window with one to the right
  export extern "niri msg action swap-window-right" [
    --help(-h)                # Print help
  ]

  # Swap focused window with one to the left
  export extern "niri msg action swap-window-left" [
    --help(-h)                # Print help
  ]

  # Toggle the focused column between normal and tabbed display
  export extern "niri msg action toggle-column-tabbed-display" [
    --help(-h)                # Print help
  ]

  # Set the display mode of the focused column
  export extern "niri msg action set-column-display" [
    display: string           # Display mode to set
    --help(-h)                # Print help
  ]

  # Center the focused column on the screen
  export extern "niri msg action center-column" [
    --help(-h)                # Print help
  ]

  # Center the focused window on the screen
  export extern "niri msg action center-window" [
    --id: string              # Id of the window to center
    --help(-h)                # Print help (see more with '--help')
  ]

  # Center all fully visible columns on the screen
  export extern "niri msg action center-visible-columns" [
    --help(-h)                # Print help
  ]

  # Focus the workspace below
  export extern "niri msg action focus-workspace-down" [
    --help(-h)                # Print help
  ]

  # Focus the workspace above
  export extern "niri msg action focus-workspace-up" [
    --help(-h)                # Print help
  ]

  # Focus a workspace by reference (index or name)
  export extern "niri msg action focus-workspace" [
    reference: string         # Reference (index or name) of the workspace to focus
    --help(-h)                # Print help
  ]

  # Focus the previous workspace
  export extern "niri msg action focus-workspace-previous" [
    --help(-h)                # Print help
  ]

  def "nu-complete niri msg action move-window-to-workspace-down focus" [] {
    [ "true" "false" ]
  }

  # Move the focused window to the workspace below
  export extern "niri msg action move-window-to-workspace-down" [
    --focus: string@"nu-complete niri msg action move-window-to-workspace-down focus" # Whether the focus should follow the target workspace
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action move-window-to-workspace-up focus" [] {
    [ "true" "false" ]
  }

  # Move the focused window to the workspace above
  export extern "niri msg action move-window-to-workspace-up" [
    --focus: string@"nu-complete niri msg action move-window-to-workspace-up focus" # Whether the focus should follow the target workspace
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action move-window-to-workspace focus" [] {
    [ "true" "false" ]
  }

  # Move the focused window to a workspace by reference (index or name)
  export extern "niri msg action move-window-to-workspace" [
    --window-id: string       # Id of the window to move
    reference: string         # Reference (index or name) of the workspace to move the window to
    --focus: string@"nu-complete niri msg action move-window-to-workspace focus" # Whether the focus should follow the moved window
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action move-column-to-workspace-down focus" [] {
    [ "true" "false" ]
  }

  # Move the focused column to the workspace below
  export extern "niri msg action move-column-to-workspace-down" [
    --focus: string@"nu-complete niri msg action move-column-to-workspace-down focus" # Whether the focus should follow the target workspace
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action move-column-to-workspace-up focus" [] {
    [ "true" "false" ]
  }

  # Move the focused column to the workspace above
  export extern "niri msg action move-column-to-workspace-up" [
    --focus: string@"nu-complete niri msg action move-column-to-workspace-up focus" # Whether the focus should follow the target workspace
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete niri msg action move-column-to-workspace focus" [] {
    [ "true" "false" ]
  }

  # Move the focused column to a workspace by reference (index or name)
  export extern "niri msg action move-column-to-workspace" [
    reference: string         # Reference (index or name) of the workspace to move the column to
    --focus: string@"nu-complete niri msg action move-column-to-workspace focus" # Whether the focus should follow the target workspace
    --help(-h)                # Print help (see more with '--help')
  ]

  # Move the focused workspace down
  export extern "niri msg action move-workspace-down" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace up
  export extern "niri msg action move-workspace-up" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to a specific index on its monitor
  export extern "niri msg action move-workspace-to-index" [
    index: string             # New index for the workspace
    --reference: string       # Reference (index or name) of the workspace to move
    --help(-h)                # Print help (see more with '--help')
  ]

  # Set the name of the focused workspace
  export extern "niri msg action set-workspace-name" [
    name: string              # New name for the workspace
    --workspace: string       # Reference (index or name) of the workspace to name
    --help(-h)                # Print help (see more with '--help')
  ]

  # Unset the name of the focused workspace
  export extern "niri msg action unset-workspace-name" [
    reference?: string        # Reference (index or name) of the workspace to unname
    --help(-h)                # Print help (see more with '--help')
  ]

  # Focus the monitor to the left
  export extern "niri msg action focus-monitor-left" [
    --help(-h)                # Print help
  ]

  # Focus the monitor to the right
  export extern "niri msg action focus-monitor-right" [
    --help(-h)                # Print help
  ]

  # Focus the monitor below
  export extern "niri msg action focus-monitor-down" [
    --help(-h)                # Print help
  ]

  # Focus the monitor above
  export extern "niri msg action focus-monitor-up" [
    --help(-h)                # Print help
  ]

  # Focus the previous monitor
  export extern "niri msg action focus-monitor-previous" [
    --help(-h)                # Print help
  ]

  # Focus the next monitor
  export extern "niri msg action focus-monitor-next" [
    --help(-h)                # Print help
  ]

  # Focus a monitor by name
  export extern "niri msg action focus-monitor" [
    output: string            # Name of the output to focus
    --help(-h)                # Print help
  ]

  # Move the focused window to the monitor to the left
  export extern "niri msg action move-window-to-monitor-left" [
    --help(-h)                # Print help
  ]

  # Move the focused window to the monitor to the right
  export extern "niri msg action move-window-to-monitor-right" [
    --help(-h)                # Print help
  ]

  # Move the focused window to the monitor below
  export extern "niri msg action move-window-to-monitor-down" [
    --help(-h)                # Print help
  ]

  # Move the focused window to the monitor above
  export extern "niri msg action move-window-to-monitor-up" [
    --help(-h)                # Print help
  ]

  # Move the focused window to the previous monitor
  export extern "niri msg action move-window-to-monitor-previous" [
    --help(-h)                # Print help
  ]

  # Move the focused window to the next monitor
  export extern "niri msg action move-window-to-monitor-next" [
    --help(-h)                # Print help
  ]

  # Move the focused window to a specific monitor
  export extern "niri msg action move-window-to-monitor" [
    --id: string              # Id of the window to move
    output: string            # The target output name
    --help(-h)                # Print help (see more with '--help')
  ]

  # Move the focused column to the monitor to the left
  export extern "niri msg action move-column-to-monitor-left" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the monitor to the right
  export extern "niri msg action move-column-to-monitor-right" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the monitor below
  export extern "niri msg action move-column-to-monitor-down" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the monitor above
  export extern "niri msg action move-column-to-monitor-up" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the previous monitor
  export extern "niri msg action move-column-to-monitor-previous" [
    --help(-h)                # Print help
  ]

  # Move the focused column to the next monitor
  export extern "niri msg action move-column-to-monitor-next" [
    --help(-h)                # Print help
  ]

  # Move the focused column to a specific monitor
  export extern "niri msg action move-column-to-monitor" [
    output: string            # The target output name
    --help(-h)                # Print help
  ]

  # Change the width of the focused window
  export extern "niri msg action set-window-width" [
    --id: string              # Id of the window whose width to set
    change: string            # How to change the width
    --help(-h)                # Print help (see more with '--help')
  ]

  # Change the height of the focused window
  export extern "niri msg action set-window-height" [
    --id: string              # Id of the window whose height to set
    change: string            # How to change the height
    --help(-h)                # Print help (see more with '--help')
  ]

  # Reset the height of the focused window back to automatic
  export extern "niri msg action reset-window-height" [
    --id: string              # Id of the window whose height to reset
    --help(-h)                # Print help (see more with '--help')
  ]

  # Switch between preset column widths
  export extern "niri msg action switch-preset-column-width" [
    --help(-h)                # Print help
  ]

  # Switch between preset column widths backwards
  export extern "niri msg action switch-preset-column-width-back" [
    --help(-h)                # Print help
  ]

  # Switch between preset window widths
  export extern "niri msg action switch-preset-window-width" [
    --id: string              # Id of the window whose width to switch
    --help(-h)                # Print help (see more with '--help')
  ]

  # Switch between preset window widths backwards
  export extern "niri msg action switch-preset-window-width-back" [
    --id: string              # Id of the window whose width to switch
    --help(-h)                # Print help (see more with '--help')
  ]

  # Switch between preset window heights
  export extern "niri msg action switch-preset-window-height" [
    --id: string              # Id of the window whose height to switch
    --help(-h)                # Print help (see more with '--help')
  ]

  # Switch between preset window heights backwards
  export extern "niri msg action switch-preset-window-height-back" [
    --id: string              # Id of the window whose height to switch
    --help(-h)                # Print help (see more with '--help')
  ]

  # Toggle the maximized state of the focused column
  export extern "niri msg action maximize-column" [
    --help(-h)                # Print help
  ]

  # Change the width of the focused column
  export extern "niri msg action set-column-width" [
    change: string            # How to change the width
    --help(-h)                # Print help
  ]

  # Expand the focused column to space not taken up by other fully visible columns
  export extern "niri msg action expand-column-to-available-width" [
    --help(-h)                # Print help
  ]

  # Switch between keyboard layouts
  export extern "niri msg action switch-layout" [
    layout: string            # Layout to switch to
    --help(-h)                # Print help
  ]

  # Show the hotkey overlay
  export extern "niri msg action show-hotkey-overlay" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the monitor to the left
  export extern "niri msg action move-workspace-to-monitor-left" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the monitor to the right
  export extern "niri msg action move-workspace-to-monitor-right" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the monitor below
  export extern "niri msg action move-workspace-to-monitor-down" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the monitor above
  export extern "niri msg action move-workspace-to-monitor-up" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the previous monitor
  export extern "niri msg action move-workspace-to-monitor-previous" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to the next monitor
  export extern "niri msg action move-workspace-to-monitor-next" [
    --help(-h)                # Print help
  ]

  # Move the focused workspace to a specific monitor
  export extern "niri msg action move-workspace-to-monitor" [
    output: string            # The target output name
    --reference: string       # If `None`, uses the focused workspace
    --help(-h)                # Print help
  ]

  # Toggle a debug tint on windows
  export extern "niri msg action toggle-debug-tint" [
    --help(-h)                # Print help
  ]

  # Toggle visualization of render element opaque regions
  export extern "niri msg action debug-toggle-opaque-regions" [
    --help(-h)                # Print help
  ]

  # Toggle visualization of output damage
  export extern "niri msg action debug-toggle-damage" [
    --help(-h)                # Print help
  ]

  # Move the focused window between the floating and the tiling layout
  export extern "niri msg action toggle-window-floating" [
    --id: string              # Id of the window to move
    --help(-h)                # Print help (see more with '--help')
  ]

  # Move the focused window to the floating layout
  export extern "niri msg action move-window-to-floating" [
    --id: string              # Id of the window to move
    --help(-h)                # Print help (see more with '--help')
  ]

  # Move the focused window to the tiling layout
  export extern "niri msg action move-window-to-tiling" [
    --id: string              # Id of the window to move
    --help(-h)                # Print help (see more with '--help')
  ]

  # Switches focus to the floating layout
  export extern "niri msg action focus-floating" [
    --help(-h)                # Print help
  ]

  # Switches focus to the tiling layout
  export extern "niri msg action focus-tiling" [
    --help(-h)                # Print help
  ]

  # Toggles the focus between the floating and the tiling layout
  export extern "niri msg action switch-focus-between-floating-and-tiling" [
    --help(-h)                # Print help
  ]

  # Move the floating window on screen
  export extern "niri msg action move-floating-window" [
    --id: string              # Id of the window to move
    --x(-x): string           # How to change the X position
    --y(-y): string           # How to change the Y position
    --help(-h)                # Print help (see more with '--help')
  ]

  # Toggle the opacity of the focused window
  export extern "niri msg action toggle-window-rule-opacity" [
    --id: string              # Id of the window
    --help(-h)                # Print help (see more with '--help')
  ]

  # Set the dynamic cast target to the focused window
  export extern "niri msg action set-dynamic-cast-window" [
    --id: string              # Id of the window to target
    --help(-h)                # Print help (see more with '--help')
  ]

  # Set the dynamic cast target to the focused monitor
  export extern "niri msg action set-dynamic-cast-monitor" [
    output?: string           # Name of the output to target
    --help(-h)                # Print help (see more with '--help')
  ]

  # Clear the dynamic cast target, making it show nothing
  export extern "niri msg action clear-dynamic-cast-target" [
    --help(-h)                # Print help
  ]

  # Toggle (open/close) the Overview
  export extern "niri msg action toggle-overview" [
    --help(-h)                # Print help
  ]

  # Open the Overview
  export extern "niri msg action open-overview" [
    --help(-h)                # Print help
  ]

  # Close the Overview
  export extern "niri msg action close-overview" [
    --help(-h)                # Print help
  ]

  # Toggle urgent status of a window
  export extern "niri msg action toggle-window-urgent" [
    --id: string              # Id of the window to toggle urgent
    --help(-h)                # Print help
  ]

  # Set urgent status of a window
  export extern "niri msg action set-window-urgent" [
    --id: string              # Id of the window to set urgent
    --help(-h)                # Print help
  ]

  # Unset urgent status of a window
  export extern "niri msg action unset-window-urgent" [
    --id: string              # Id of the window to unset urgent
    --help(-h)                # Print help
  ]

  # Reload the config file
  export extern "niri msg action load-config-file" [
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg action help" [
  ]

  # Exit niri
  export extern "niri msg action help quit" [
  ]

  # Power off all monitors via DPMS
  export extern "niri msg action help power-off-monitors" [
  ]

  # Power on all monitors via DPMS
  export extern "niri msg action help power-on-monitors" [
  ]

  # Spawn a command
  export extern "niri msg action help spawn" [
  ]

  # Spawn a command through the shell
  export extern "niri msg action help spawn-sh" [
  ]

  # Do a screen transition
  export extern "niri msg action help do-screen-transition" [
  ]

  # Open the screenshot UI
  export extern "niri msg action help screenshot" [
  ]

  # Screenshot the focused screen
  export extern "niri msg action help screenshot-screen" [
  ]

  # Screenshot the focused window
  export extern "niri msg action help screenshot-window" [
  ]

  # Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
  export extern "niri msg action help toggle-keyboard-shortcuts-inhibit" [
  ]

  # Close the focused window
  export extern "niri msg action help close-window" [
  ]

  # Toggle fullscreen on the focused window
  export extern "niri msg action help fullscreen-window" [
  ]

  # Toggle windowed (fake) fullscreen on the focused window
  export extern "niri msg action help toggle-windowed-fullscreen" [
  ]

  # Focus a window by id
  export extern "niri msg action help focus-window" [
  ]

  # Focus a window in the focused column by index
  export extern "niri msg action help focus-window-in-column" [
  ]

  # Focus the previously focused window
  export extern "niri msg action help focus-window-previous" [
  ]

  # Focus the column to the left
  export extern "niri msg action help focus-column-left" [
  ]

  # Focus the column to the right
  export extern "niri msg action help focus-column-right" [
  ]

  # Focus the first column
  export extern "niri msg action help focus-column-first" [
  ]

  # Focus the last column
  export extern "niri msg action help focus-column-last" [
  ]

  # Focus the next column to the right, looping if at end
  export extern "niri msg action help focus-column-right-or-first" [
  ]

  # Focus the next column to the left, looping if at start
  export extern "niri msg action help focus-column-left-or-last" [
  ]

  # Focus a column by index
  export extern "niri msg action help focus-column" [
  ]

  # Focus the window or the monitor above
  export extern "niri msg action help focus-window-or-monitor-up" [
  ]

  # Focus the window or the monitor below
  export extern "niri msg action help focus-window-or-monitor-down" [
  ]

  # Focus the column or the monitor to the left
  export extern "niri msg action help focus-column-or-monitor-left" [
  ]

  # Focus the column or the monitor to the right
  export extern "niri msg action help focus-column-or-monitor-right" [
  ]

  # Focus the window below
  export extern "niri msg action help focus-window-down" [
  ]

  # Focus the window above
  export extern "niri msg action help focus-window-up" [
  ]

  # Focus the window below or the column to the left
  export extern "niri msg action help focus-window-down-or-column-left" [
  ]

  # Focus the window below or the column to the right
  export extern "niri msg action help focus-window-down-or-column-right" [
  ]

  # Focus the window above or the column to the left
  export extern "niri msg action help focus-window-up-or-column-left" [
  ]

  # Focus the window above or the column to the right
  export extern "niri msg action help focus-window-up-or-column-right" [
  ]

  # Focus the window or the workspace below
  export extern "niri msg action help focus-window-or-workspace-down" [
  ]

  # Focus the window or the workspace above
  export extern "niri msg action help focus-window-or-workspace-up" [
  ]

  # Focus the topmost window
  export extern "niri msg action help focus-window-top" [
  ]

  # Focus the bottommost window
  export extern "niri msg action help focus-window-bottom" [
  ]

  # Focus the window below or the topmost window
  export extern "niri msg action help focus-window-down-or-top" [
  ]

  # Focus the window above or the bottommost window
  export extern "niri msg action help focus-window-up-or-bottom" [
  ]

  # Move the focused column to the left
  export extern "niri msg action help move-column-left" [
  ]

  # Move the focused column to the right
  export extern "niri msg action help move-column-right" [
  ]

  # Move the focused column to the start of the workspace
  export extern "niri msg action help move-column-to-first" [
  ]

  # Move the focused column to the end of the workspace
  export extern "niri msg action help move-column-to-last" [
  ]

  # Move the focused column to the left or to the monitor to the left
  export extern "niri msg action help move-column-left-or-to-monitor-left" [
  ]

  # Move the focused column to the right or to the monitor to the right
  export extern "niri msg action help move-column-right-or-to-monitor-right" [
  ]

  # Move the focused column to a specific index on its workspace
  export extern "niri msg action help move-column-to-index" [
  ]

  # Move the focused window down in a column
  export extern "niri msg action help move-window-down" [
  ]

  # Move the focused window up in a column
  export extern "niri msg action help move-window-up" [
  ]

  # Move the focused window down in a column or to the workspace below
  export extern "niri msg action help move-window-down-or-to-workspace-down" [
  ]

  # Move the focused window up in a column or to the workspace above
  export extern "niri msg action help move-window-up-or-to-workspace-up" [
  ]

  # Consume or expel the focused window left
  export extern "niri msg action help consume-or-expel-window-left" [
  ]

  # Consume or expel the focused window right
  export extern "niri msg action help consume-or-expel-window-right" [
  ]

  # Consume the window to the right into the focused column
  export extern "niri msg action help consume-window-into-column" [
  ]

  # Expel the focused window from the column
  export extern "niri msg action help expel-window-from-column" [
  ]

  # Swap focused window with one to the right
  export extern "niri msg action help swap-window-right" [
  ]

  # Swap focused window with one to the left
  export extern "niri msg action help swap-window-left" [
  ]

  # Toggle the focused column between normal and tabbed display
  export extern "niri msg action help toggle-column-tabbed-display" [
  ]

  # Set the display mode of the focused column
  export extern "niri msg action help set-column-display" [
  ]

  # Center the focused column on the screen
  export extern "niri msg action help center-column" [
  ]

  # Center the focused window on the screen
  export extern "niri msg action help center-window" [
  ]

  # Center all fully visible columns on the screen
  export extern "niri msg action help center-visible-columns" [
  ]

  # Focus the workspace below
  export extern "niri msg action help focus-workspace-down" [
  ]

  # Focus the workspace above
  export extern "niri msg action help focus-workspace-up" [
  ]

  # Focus a workspace by reference (index or name)
  export extern "niri msg action help focus-workspace" [
  ]

  # Focus the previous workspace
  export extern "niri msg action help focus-workspace-previous" [
  ]

  # Move the focused window to the workspace below
  export extern "niri msg action help move-window-to-workspace-down" [
  ]

  # Move the focused window to the workspace above
  export extern "niri msg action help move-window-to-workspace-up" [
  ]

  # Move the focused window to a workspace by reference (index or name)
  export extern "niri msg action help move-window-to-workspace" [
  ]

  # Move the focused column to the workspace below
  export extern "niri msg action help move-column-to-workspace-down" [
  ]

  # Move the focused column to the workspace above
  export extern "niri msg action help move-column-to-workspace-up" [
  ]

  # Move the focused column to a workspace by reference (index or name)
  export extern "niri msg action help move-column-to-workspace" [
  ]

  # Move the focused workspace down
  export extern "niri msg action help move-workspace-down" [
  ]

  # Move the focused workspace up
  export extern "niri msg action help move-workspace-up" [
  ]

  # Move the focused workspace to a specific index on its monitor
  export extern "niri msg action help move-workspace-to-index" [
  ]

  # Set the name of the focused workspace
  export extern "niri msg action help set-workspace-name" [
  ]

  # Unset the name of the focused workspace
  export extern "niri msg action help unset-workspace-name" [
  ]

  # Focus the monitor to the left
  export extern "niri msg action help focus-monitor-left" [
  ]

  # Focus the monitor to the right
  export extern "niri msg action help focus-monitor-right" [
  ]

  # Focus the monitor below
  export extern "niri msg action help focus-monitor-down" [
  ]

  # Focus the monitor above
  export extern "niri msg action help focus-monitor-up" [
  ]

  # Focus the previous monitor
  export extern "niri msg action help focus-monitor-previous" [
  ]

  # Focus the next monitor
  export extern "niri msg action help focus-monitor-next" [
  ]

  # Focus a monitor by name
  export extern "niri msg action help focus-monitor" [
  ]

  # Move the focused window to the monitor to the left
  export extern "niri msg action help move-window-to-monitor-left" [
  ]

  # Move the focused window to the monitor to the right
  export extern "niri msg action help move-window-to-monitor-right" [
  ]

  # Move the focused window to the monitor below
  export extern "niri msg action help move-window-to-monitor-down" [
  ]

  # Move the focused window to the monitor above
  export extern "niri msg action help move-window-to-monitor-up" [
  ]

  # Move the focused window to the previous monitor
  export extern "niri msg action help move-window-to-monitor-previous" [
  ]

  # Move the focused window to the next monitor
  export extern "niri msg action help move-window-to-monitor-next" [
  ]

  # Move the focused window to a specific monitor
  export extern "niri msg action help move-window-to-monitor" [
  ]

  # Move the focused column to the monitor to the left
  export extern "niri msg action help move-column-to-monitor-left" [
  ]

  # Move the focused column to the monitor to the right
  export extern "niri msg action help move-column-to-monitor-right" [
  ]

  # Move the focused column to the monitor below
  export extern "niri msg action help move-column-to-monitor-down" [
  ]

  # Move the focused column to the monitor above
  export extern "niri msg action help move-column-to-monitor-up" [
  ]

  # Move the focused column to the previous monitor
  export extern "niri msg action help move-column-to-monitor-previous" [
  ]

  # Move the focused column to the next monitor
  export extern "niri msg action help move-column-to-monitor-next" [
  ]

  # Move the focused column to a specific monitor
  export extern "niri msg action help move-column-to-monitor" [
  ]

  # Change the width of the focused window
  export extern "niri msg action help set-window-width" [
  ]

  # Change the height of the focused window
  export extern "niri msg action help set-window-height" [
  ]

  # Reset the height of the focused window back to automatic
  export extern "niri msg action help reset-window-height" [
  ]

  # Switch between preset column widths
  export extern "niri msg action help switch-preset-column-width" [
  ]

  # Switch between preset column widths backwards
  export extern "niri msg action help switch-preset-column-width-back" [
  ]

  # Switch between preset window widths
  export extern "niri msg action help switch-preset-window-width" [
  ]

  # Switch between preset window widths backwards
  export extern "niri msg action help switch-preset-window-width-back" [
  ]

  # Switch between preset window heights
  export extern "niri msg action help switch-preset-window-height" [
  ]

  # Switch between preset window heights backwards
  export extern "niri msg action help switch-preset-window-height-back" [
  ]

  # Toggle the maximized state of the focused column
  export extern "niri msg action help maximize-column" [
  ]

  # Change the width of the focused column
  export extern "niri msg action help set-column-width" [
  ]

  # Expand the focused column to space not taken up by other fully visible columns
  export extern "niri msg action help expand-column-to-available-width" [
  ]

  # Switch between keyboard layouts
  export extern "niri msg action help switch-layout" [
  ]

  # Show the hotkey overlay
  export extern "niri msg action help show-hotkey-overlay" [
  ]

  # Move the focused workspace to the monitor to the left
  export extern "niri msg action help move-workspace-to-monitor-left" [
  ]

  # Move the focused workspace to the monitor to the right
  export extern "niri msg action help move-workspace-to-monitor-right" [
  ]

  # Move the focused workspace to the monitor below
  export extern "niri msg action help move-workspace-to-monitor-down" [
  ]

  # Move the focused workspace to the monitor above
  export extern "niri msg action help move-workspace-to-monitor-up" [
  ]

  # Move the focused workspace to the previous monitor
  export extern "niri msg action help move-workspace-to-monitor-previous" [
  ]

  # Move the focused workspace to the next monitor
  export extern "niri msg action help move-workspace-to-monitor-next" [
  ]

  # Move the focused workspace to a specific monitor
  export extern "niri msg action help move-workspace-to-monitor" [
  ]

  # Toggle a debug tint on windows
  export extern "niri msg action help toggle-debug-tint" [
  ]

  # Toggle visualization of render element opaque regions
  export extern "niri msg action help debug-toggle-opaque-regions" [
  ]

  # Toggle visualization of output damage
  export extern "niri msg action help debug-toggle-damage" [
  ]

  # Move the focused window between the floating and the tiling layout
  export extern "niri msg action help toggle-window-floating" [
  ]

  # Move the focused window to the floating layout
  export extern "niri msg action help move-window-to-floating" [
  ]

  # Move the focused window to the tiling layout
  export extern "niri msg action help move-window-to-tiling" [
  ]

  # Switches focus to the floating layout
  export extern "niri msg action help focus-floating" [
  ]

  # Switches focus to the tiling layout
  export extern "niri msg action help focus-tiling" [
  ]

  # Toggles the focus between the floating and the tiling layout
  export extern "niri msg action help switch-focus-between-floating-and-tiling" [
  ]

  # Move the floating window on screen
  export extern "niri msg action help move-floating-window" [
  ]

  # Toggle the opacity of the focused window
  export extern "niri msg action help toggle-window-rule-opacity" [
  ]

  # Set the dynamic cast target to the focused window
  export extern "niri msg action help set-dynamic-cast-window" [
  ]

  # Set the dynamic cast target to the focused monitor
  export extern "niri msg action help set-dynamic-cast-monitor" [
  ]

  # Clear the dynamic cast target, making it show nothing
  export extern "niri msg action help clear-dynamic-cast-target" [
  ]

  # Toggle (open/close) the Overview
  export extern "niri msg action help toggle-overview" [
  ]

  # Open the Overview
  export extern "niri msg action help open-overview" [
  ]

  # Close the Overview
  export extern "niri msg action help close-overview" [
  ]

  # Toggle urgent status of a window
  export extern "niri msg action help toggle-window-urgent" [
  ]

  # Set urgent status of a window
  export extern "niri msg action help set-window-urgent" [
  ]

  # Unset urgent status of a window
  export extern "niri msg action help unset-window-urgent" [
  ]

  # Reload the config file
  export extern "niri msg action help load-config-file" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg action help help" [
  ]

  # Change output configuration temporarily
  export extern "niri msg output" [
    output: string            # Output name
    --help(-h)                # Print help (see more with '--help')
  ]

  # Turn off the output
  export extern "niri msg output off" [
    --help(-h)                # Print help
  ]

  # Turn on the output
  export extern "niri msg output on" [
    --help(-h)                # Print help
  ]

  # Set the output mode
  export extern "niri msg output mode" [
    mode: string              # Mode to set, or "auto" for automatic selection
    --help(-h)                # Print help (see more with '--help')
  ]

  # Set the output scale
  export extern "niri msg output scale" [
    scale: string             # Scale factor to set, or "auto" for automatic selection
    --help(-h)                # Print help
  ]

  def "nu-complete niri msg output transform transform" [] {
    [ "normal" "90" "180" "270" "flipped" "flipped-90" "flipped-180" "flipped-270" ]
  }

  # Set the output transform
  export extern "niri msg output transform" [
    transform: string@"nu-complete niri msg output transform transform" # Transform to set, counter-clockwise
    --help(-h)                # Print help (see more with '--help')
  ]

  # Set the output position
  export extern "niri msg output position" [
    --help(-h)                # Print help
  ]

  # Position the output automatically
  export extern "niri msg output position auto" [
    --help(-h)                # Print help
  ]

  # Set a specific position
  export extern "niri msg output position set" [
    x: string                 # Logical X position
    y: string                 # Logical Y position
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg output position help" [
  ]

  # Position the output automatically
  export extern "niri msg output position help auto" [
  ]

  # Set a specific position
  export extern "niri msg output position help set" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg output position help help" [
  ]

  def "nu-complete niri msg output vrr vrr" [] {
    [ "y" "yes" "t" "true" "on" "1" "n" "no" "f" "false" "off" "0" ]
  }

  # Set the variable refresh rate mode
  export extern "niri msg output vrr" [
    vrr: string@"nu-complete niri msg output vrr vrr" # Whether to enable variable refresh rate
    --on-demand               # Only enable when the output shows a window matching the variable-refresh-rate window rule
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg output help" [
  ]

  # Turn off the output
  export extern "niri msg output help off" [
  ]

  # Turn on the output
  export extern "niri msg output help on" [
  ]

  # Set the output mode
  export extern "niri msg output help mode" [
  ]

  # Set the output scale
  export extern "niri msg output help scale" [
  ]

  # Set the output transform
  export extern "niri msg output help transform" [
  ]

  # Set the output position
  export extern "niri msg output help position" [
  ]

  # Position the output automatically
  export extern "niri msg output help position auto" [
  ]

  # Set a specific position
  export extern "niri msg output help position set" [
  ]

  # Set the variable refresh rate mode
  export extern "niri msg output help vrr" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg output help help" [
  ]

  # Start continuously receiving events from the compositor
  export extern "niri msg event-stream" [
    --help(-h)                # Print help
  ]

  # Print the version of the running niri instance
  export extern "niri msg version" [
    --help(-h)                # Print help
  ]

  # Request an error from the running niri instance
  export extern "niri msg request-error" [
    --help(-h)                # Print help
  ]

  # Print the overview state
  export extern "niri msg overview-state" [
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg help" [
  ]

  # List connected outputs
  export extern "niri msg help outputs" [
  ]

  # List workspaces
  export extern "niri msg help workspaces" [
  ]

  # List open windows
  export extern "niri msg help windows" [
  ]

  # List open layer-shell surfaces
  export extern "niri msg help layers" [
  ]

  # Get the configured keyboard layouts
  export extern "niri msg help keyboard-layouts" [
  ]

  # Print information about the focused output
  export extern "niri msg help focused-output" [
  ]

  # Print information about the focused window
  export extern "niri msg help focused-window" [
  ]

  # Pick a window with the mouse and print information about it
  export extern "niri msg help pick-window" [
  ]

  # Pick a color from the screen with the mouse
  export extern "niri msg help pick-color" [
  ]

  # Perform an action
  export extern "niri msg help action" [
  ]

  # Exit niri
  export extern "niri msg help action quit" [
  ]

  # Power off all monitors via DPMS
  export extern "niri msg help action power-off-monitors" [
  ]

  # Power on all monitors via DPMS
  export extern "niri msg help action power-on-monitors" [
  ]

  # Spawn a command
  export extern "niri msg help action spawn" [
  ]

  # Spawn a command through the shell
  export extern "niri msg help action spawn-sh" [
  ]

  # Do a screen transition
  export extern "niri msg help action do-screen-transition" [
  ]

  # Open the screenshot UI
  export extern "niri msg help action screenshot" [
  ]

  # Screenshot the focused screen
  export extern "niri msg help action screenshot-screen" [
  ]

  # Screenshot the focused window
  export extern "niri msg help action screenshot-window" [
  ]

  # Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
  export extern "niri msg help action toggle-keyboard-shortcuts-inhibit" [
  ]

  # Close the focused window
  export extern "niri msg help action close-window" [
  ]

  # Toggle fullscreen on the focused window
  export extern "niri msg help action fullscreen-window" [
  ]

  # Toggle windowed (fake) fullscreen on the focused window
  export extern "niri msg help action toggle-windowed-fullscreen" [
  ]

  # Focus a window by id
  export extern "niri msg help action focus-window" [
  ]

  # Focus a window in the focused column by index
  export extern "niri msg help action focus-window-in-column" [
  ]

  # Focus the previously focused window
  export extern "niri msg help action focus-window-previous" [
  ]

  # Focus the column to the left
  export extern "niri msg help action focus-column-left" [
  ]

  # Focus the column to the right
  export extern "niri msg help action focus-column-right" [
  ]

  # Focus the first column
  export extern "niri msg help action focus-column-first" [
  ]

  # Focus the last column
  export extern "niri msg help action focus-column-last" [
  ]

  # Focus the next column to the right, looping if at end
  export extern "niri msg help action focus-column-right-or-first" [
  ]

  # Focus the next column to the left, looping if at start
  export extern "niri msg help action focus-column-left-or-last" [
  ]

  # Focus a column by index
  export extern "niri msg help action focus-column" [
  ]

  # Focus the window or the monitor above
  export extern "niri msg help action focus-window-or-monitor-up" [
  ]

  # Focus the window or the monitor below
  export extern "niri msg help action focus-window-or-monitor-down" [
  ]

  # Focus the column or the monitor to the left
  export extern "niri msg help action focus-column-or-monitor-left" [
  ]

  # Focus the column or the monitor to the right
  export extern "niri msg help action focus-column-or-monitor-right" [
  ]

  # Focus the window below
  export extern "niri msg help action focus-window-down" [
  ]

  # Focus the window above
  export extern "niri msg help action focus-window-up" [
  ]

  # Focus the window below or the column to the left
  export extern "niri msg help action focus-window-down-or-column-left" [
  ]

  # Focus the window below or the column to the right
  export extern "niri msg help action focus-window-down-or-column-right" [
  ]

  # Focus the window above or the column to the left
  export extern "niri msg help action focus-window-up-or-column-left" [
  ]

  # Focus the window above or the column to the right
  export extern "niri msg help action focus-window-up-or-column-right" [
  ]

  # Focus the window or the workspace below
  export extern "niri msg help action focus-window-or-workspace-down" [
  ]

  # Focus the window or the workspace above
  export extern "niri msg help action focus-window-or-workspace-up" [
  ]

  # Focus the topmost window
  export extern "niri msg help action focus-window-top" [
  ]

  # Focus the bottommost window
  export extern "niri msg help action focus-window-bottom" [
  ]

  # Focus the window below or the topmost window
  export extern "niri msg help action focus-window-down-or-top" [
  ]

  # Focus the window above or the bottommost window
  export extern "niri msg help action focus-window-up-or-bottom" [
  ]

  # Move the focused column to the left
  export extern "niri msg help action move-column-left" [
  ]

  # Move the focused column to the right
  export extern "niri msg help action move-column-right" [
  ]

  # Move the focused column to the start of the workspace
  export extern "niri msg help action move-column-to-first" [
  ]

  # Move the focused column to the end of the workspace
  export extern "niri msg help action move-column-to-last" [
  ]

  # Move the focused column to the left or to the monitor to the left
  export extern "niri msg help action move-column-left-or-to-monitor-left" [
  ]

  # Move the focused column to the right or to the monitor to the right
  export extern "niri msg help action move-column-right-or-to-monitor-right" [
  ]

  # Move the focused column to a specific index on its workspace
  export extern "niri msg help action move-column-to-index" [
  ]

  # Move the focused window down in a column
  export extern "niri msg help action move-window-down" [
  ]

  # Move the focused window up in a column
  export extern "niri msg help action move-window-up" [
  ]

  # Move the focused window down in a column or to the workspace below
  export extern "niri msg help action move-window-down-or-to-workspace-down" [
  ]

  # Move the focused window up in a column or to the workspace above
  export extern "niri msg help action move-window-up-or-to-workspace-up" [
  ]

  # Consume or expel the focused window left
  export extern "niri msg help action consume-or-expel-window-left" [
  ]

  # Consume or expel the focused window right
  export extern "niri msg help action consume-or-expel-window-right" [
  ]

  # Consume the window to the right into the focused column
  export extern "niri msg help action consume-window-into-column" [
  ]

  # Expel the focused window from the column
  export extern "niri msg help action expel-window-from-column" [
  ]

  # Swap focused window with one to the right
  export extern "niri msg help action swap-window-right" [
  ]

  # Swap focused window with one to the left
  export extern "niri msg help action swap-window-left" [
  ]

  # Toggle the focused column between normal and tabbed display
  export extern "niri msg help action toggle-column-tabbed-display" [
  ]

  # Set the display mode of the focused column
  export extern "niri msg help action set-column-display" [
  ]

  # Center the focused column on the screen
  export extern "niri msg help action center-column" [
  ]

  # Center the focused window on the screen
  export extern "niri msg help action center-window" [
  ]

  # Center all fully visible columns on the screen
  export extern "niri msg help action center-visible-columns" [
  ]

  # Focus the workspace below
  export extern "niri msg help action focus-workspace-down" [
  ]

  # Focus the workspace above
  export extern "niri msg help action focus-workspace-up" [
  ]

  # Focus a workspace by reference (index or name)
  export extern "niri msg help action focus-workspace" [
  ]

  # Focus the previous workspace
  export extern "niri msg help action focus-workspace-previous" [
  ]

  # Move the focused window to the workspace below
  export extern "niri msg help action move-window-to-workspace-down" [
  ]

  # Move the focused window to the workspace above
  export extern "niri msg help action move-window-to-workspace-up" [
  ]

  # Move the focused window to a workspace by reference (index or name)
  export extern "niri msg help action move-window-to-workspace" [
  ]

  # Move the focused column to the workspace below
  export extern "niri msg help action move-column-to-workspace-down" [
  ]

  # Move the focused column to the workspace above
  export extern "niri msg help action move-column-to-workspace-up" [
  ]

  # Move the focused column to a workspace by reference (index or name)
  export extern "niri msg help action move-column-to-workspace" [
  ]

  # Move the focused workspace down
  export extern "niri msg help action move-workspace-down" [
  ]

  # Move the focused workspace up
  export extern "niri msg help action move-workspace-up" [
  ]

  # Move the focused workspace to a specific index on its monitor
  export extern "niri msg help action move-workspace-to-index" [
  ]

  # Set the name of the focused workspace
  export extern "niri msg help action set-workspace-name" [
  ]

  # Unset the name of the focused workspace
  export extern "niri msg help action unset-workspace-name" [
  ]

  # Focus the monitor to the left
  export extern "niri msg help action focus-monitor-left" [
  ]

  # Focus the monitor to the right
  export extern "niri msg help action focus-monitor-right" [
  ]

  # Focus the monitor below
  export extern "niri msg help action focus-monitor-down" [
  ]

  # Focus the monitor above
  export extern "niri msg help action focus-monitor-up" [
  ]

  # Focus the previous monitor
  export extern "niri msg help action focus-monitor-previous" [
  ]

  # Focus the next monitor
  export extern "niri msg help action focus-monitor-next" [
  ]

  # Focus a monitor by name
  export extern "niri msg help action focus-monitor" [
  ]

  # Move the focused window to the monitor to the left
  export extern "niri msg help action move-window-to-monitor-left" [
  ]

  # Move the focused window to the monitor to the right
  export extern "niri msg help action move-window-to-monitor-right" [
  ]

  # Move the focused window to the monitor below
  export extern "niri msg help action move-window-to-monitor-down" [
  ]

  # Move the focused window to the monitor above
  export extern "niri msg help action move-window-to-monitor-up" [
  ]

  # Move the focused window to the previous monitor
  export extern "niri msg help action move-window-to-monitor-previous" [
  ]

  # Move the focused window to the next monitor
  export extern "niri msg help action move-window-to-monitor-next" [
  ]

  # Move the focused window to a specific monitor
  export extern "niri msg help action move-window-to-monitor" [
  ]

  # Move the focused column to the monitor to the left
  export extern "niri msg help action move-column-to-monitor-left" [
  ]

  # Move the focused column to the monitor to the right
  export extern "niri msg help action move-column-to-monitor-right" [
  ]

  # Move the focused column to the monitor below
  export extern "niri msg help action move-column-to-monitor-down" [
  ]

  # Move the focused column to the monitor above
  export extern "niri msg help action move-column-to-monitor-up" [
  ]

  # Move the focused column to the previous monitor
  export extern "niri msg help action move-column-to-monitor-previous" [
  ]

  # Move the focused column to the next monitor
  export extern "niri msg help action move-column-to-monitor-next" [
  ]

  # Move the focused column to a specific monitor
  export extern "niri msg help action move-column-to-monitor" [
  ]

  # Change the width of the focused window
  export extern "niri msg help action set-window-width" [
  ]

  # Change the height of the focused window
  export extern "niri msg help action set-window-height" [
  ]

  # Reset the height of the focused window back to automatic
  export extern "niri msg help action reset-window-height" [
  ]

  # Switch between preset column widths
  export extern "niri msg help action switch-preset-column-width" [
  ]

  # Switch between preset column widths backwards
  export extern "niri msg help action switch-preset-column-width-back" [
  ]

  # Switch between preset window widths
  export extern "niri msg help action switch-preset-window-width" [
  ]

  # Switch between preset window widths backwards
  export extern "niri msg help action switch-preset-window-width-back" [
  ]

  # Switch between preset window heights
  export extern "niri msg help action switch-preset-window-height" [
  ]

  # Switch between preset window heights backwards
  export extern "niri msg help action switch-preset-window-height-back" [
  ]

  # Toggle the maximized state of the focused column
  export extern "niri msg help action maximize-column" [
  ]

  # Change the width of the focused column
  export extern "niri msg help action set-column-width" [
  ]

  # Expand the focused column to space not taken up by other fully visible columns
  export extern "niri msg help action expand-column-to-available-width" [
  ]

  # Switch between keyboard layouts
  export extern "niri msg help action switch-layout" [
  ]

  # Show the hotkey overlay
  export extern "niri msg help action show-hotkey-overlay" [
  ]

  # Move the focused workspace to the monitor to the left
  export extern "niri msg help action move-workspace-to-monitor-left" [
  ]

  # Move the focused workspace to the monitor to the right
  export extern "niri msg help action move-workspace-to-monitor-right" [
  ]

  # Move the focused workspace to the monitor below
  export extern "niri msg help action move-workspace-to-monitor-down" [
  ]

  # Move the focused workspace to the monitor above
  export extern "niri msg help action move-workspace-to-monitor-up" [
  ]

  # Move the focused workspace to the previous monitor
  export extern "niri msg help action move-workspace-to-monitor-previous" [
  ]

  # Move the focused workspace to the next monitor
  export extern "niri msg help action move-workspace-to-monitor-next" [
  ]

  # Move the focused workspace to a specific monitor
  export extern "niri msg help action move-workspace-to-monitor" [
  ]

  # Toggle a debug tint on windows
  export extern "niri msg help action toggle-debug-tint" [
  ]

  # Toggle visualization of render element opaque regions
  export extern "niri msg help action debug-toggle-opaque-regions" [
  ]

  # Toggle visualization of output damage
  export extern "niri msg help action debug-toggle-damage" [
  ]

  # Move the focused window between the floating and the tiling layout
  export extern "niri msg help action toggle-window-floating" [
  ]

  # Move the focused window to the floating layout
  export extern "niri msg help action move-window-to-floating" [
  ]

  # Move the focused window to the tiling layout
  export extern "niri msg help action move-window-to-tiling" [
  ]

  # Switches focus to the floating layout
  export extern "niri msg help action focus-floating" [
  ]

  # Switches focus to the tiling layout
  export extern "niri msg help action focus-tiling" [
  ]

  # Toggles the focus between the floating and the tiling layout
  export extern "niri msg help action switch-focus-between-floating-and-tiling" [
  ]

  # Move the floating window on screen
  export extern "niri msg help action move-floating-window" [
  ]

  # Toggle the opacity of the focused window
  export extern "niri msg help action toggle-window-rule-opacity" [
  ]

  # Set the dynamic cast target to the focused window
  export extern "niri msg help action set-dynamic-cast-window" [
  ]

  # Set the dynamic cast target to the focused monitor
  export extern "niri msg help action set-dynamic-cast-monitor" [
  ]

  # Clear the dynamic cast target, making it show nothing
  export extern "niri msg help action clear-dynamic-cast-target" [
  ]

  # Toggle (open/close) the Overview
  export extern "niri msg help action toggle-overview" [
  ]

  # Open the Overview
  export extern "niri msg help action open-overview" [
  ]

  # Close the Overview
  export extern "niri msg help action close-overview" [
  ]

  # Toggle urgent status of a window
  export extern "niri msg help action toggle-window-urgent" [
  ]

  # Set urgent status of a window
  export extern "niri msg help action set-window-urgent" [
  ]

  # Unset urgent status of a window
  export extern "niri msg help action unset-window-urgent" [
  ]

  # Reload the config file
  export extern "niri msg help action load-config-file" [
  ]

  # Change output configuration temporarily
  export extern "niri msg help output" [
  ]

  # Turn off the output
  export extern "niri msg help output off" [
  ]

  # Turn on the output
  export extern "niri msg help output on" [
  ]

  # Set the output mode
  export extern "niri msg help output mode" [
  ]

  # Set the output scale
  export extern "niri msg help output scale" [
  ]

  # Set the output transform
  export extern "niri msg help output transform" [
  ]

  # Set the output position
  export extern "niri msg help output position" [
  ]

  # Position the output automatically
  export extern "niri msg help output position auto" [
  ]

  # Set a specific position
  export extern "niri msg help output position set" [
  ]

  # Set the variable refresh rate mode
  export extern "niri msg help output vrr" [
  ]

  # Start continuously receiving events from the compositor
  export extern "niri msg help event-stream" [
  ]

  # Print the version of the running niri instance
  export extern "niri msg help version" [
  ]

  # Request an error from the running niri instance
  export extern "niri msg help request-error" [
  ]

  # Print the overview state
  export extern "niri msg help overview-state" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri msg help help" [
  ]

  # Validate the config file
  export extern "niri validate" [
    --config(-c): path        # Path to config file (default: `$XDG_CONFIG_HOME/niri/config.kdl`)
    --help(-h)                # Print help (see more with '--help')
  ]

  # Cause a panic to check if the backtraces are good
  export extern "niri panic" [
    --help(-h)                # Print help
  ]

  def "nu-complete niri completions shell" [] {
    [ "bash" "elvish" "fish" "power-shell" "zsh" "nushell" ]
  }

  # Generate shell completions
  export extern "niri completions" [
    shell: string@"nu-complete niri completions shell"
    --help(-h)                # Print help
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri help" [
  ]

  # Communicate with the running niri instance
  export extern "niri help msg" [
  ]

  # List connected outputs
  export extern "niri help msg outputs" [
  ]

  # List workspaces
  export extern "niri help msg workspaces" [
  ]

  # List open windows
  export extern "niri help msg windows" [
  ]

  # List open layer-shell surfaces
  export extern "niri help msg layers" [
  ]

  # Get the configured keyboard layouts
  export extern "niri help msg keyboard-layouts" [
  ]

  # Print information about the focused output
  export extern "niri help msg focused-output" [
  ]

  # Print information about the focused window
  export extern "niri help msg focused-window" [
  ]

  # Pick a window with the mouse and print information about it
  export extern "niri help msg pick-window" [
  ]

  # Pick a color from the screen with the mouse
  export extern "niri help msg pick-color" [
  ]

  # Perform an action
  export extern "niri help msg action" [
  ]

  # Exit niri
  export extern "niri help msg action quit" [
  ]

  # Power off all monitors via DPMS
  export extern "niri help msg action power-off-monitors" [
  ]

  # Power on all monitors via DPMS
  export extern "niri help msg action power-on-monitors" [
  ]

  # Spawn a command
  export extern "niri help msg action spawn" [
  ]

  # Spawn a command through the shell
  export extern "niri help msg action spawn-sh" [
  ]

  # Do a screen transition
  export extern "niri help msg action do-screen-transition" [
  ]

  # Open the screenshot UI
  export extern "niri help msg action screenshot" [
  ]

  # Screenshot the focused screen
  export extern "niri help msg action screenshot-screen" [
  ]

  # Screenshot the focused window
  export extern "niri help msg action screenshot-window" [
  ]

  # Enable or disable the keyboard shortcuts inhibitor (if any) for the focused surface
  export extern "niri help msg action toggle-keyboard-shortcuts-inhibit" [
  ]

  # Close the focused window
  export extern "niri help msg action close-window" [
  ]

  # Toggle fullscreen on the focused window
  export extern "niri help msg action fullscreen-window" [
  ]

  # Toggle windowed (fake) fullscreen on the focused window
  export extern "niri help msg action toggle-windowed-fullscreen" [
  ]

  # Focus a window by id
  export extern "niri help msg action focus-window" [
  ]

  # Focus a window in the focused column by index
  export extern "niri help msg action focus-window-in-column" [
  ]

  # Focus the previously focused window
  export extern "niri help msg action focus-window-previous" [
  ]

  # Focus the column to the left
  export extern "niri help msg action focus-column-left" [
  ]

  # Focus the column to the right
  export extern "niri help msg action focus-column-right" [
  ]

  # Focus the first column
  export extern "niri help msg action focus-column-first" [
  ]

  # Focus the last column
  export extern "niri help msg action focus-column-last" [
  ]

  # Focus the next column to the right, looping if at end
  export extern "niri help msg action focus-column-right-or-first" [
  ]

  # Focus the next column to the left, looping if at start
  export extern "niri help msg action focus-column-left-or-last" [
  ]

  # Focus a column by index
  export extern "niri help msg action focus-column" [
  ]

  # Focus the window or the monitor above
  export extern "niri help msg action focus-window-or-monitor-up" [
  ]

  # Focus the window or the monitor below
  export extern "niri help msg action focus-window-or-monitor-down" [
  ]

  # Focus the column or the monitor to the left
  export extern "niri help msg action focus-column-or-monitor-left" [
  ]

  # Focus the column or the monitor to the right
  export extern "niri help msg action focus-column-or-monitor-right" [
  ]

  # Focus the window below
  export extern "niri help msg action focus-window-down" [
  ]

  # Focus the window above
  export extern "niri help msg action focus-window-up" [
  ]

  # Focus the window below or the column to the left
  export extern "niri help msg action focus-window-down-or-column-left" [
  ]

  # Focus the window below or the column to the right
  export extern "niri help msg action focus-window-down-or-column-right" [
  ]

  # Focus the window above or the column to the left
  export extern "niri help msg action focus-window-up-or-column-left" [
  ]

  # Focus the window above or the column to the right
  export extern "niri help msg action focus-window-up-or-column-right" [
  ]

  # Focus the window or the workspace below
  export extern "niri help msg action focus-window-or-workspace-down" [
  ]

  # Focus the window or the workspace above
  export extern "niri help msg action focus-window-or-workspace-up" [
  ]

  # Focus the topmost window
  export extern "niri help msg action focus-window-top" [
  ]

  # Focus the bottommost window
  export extern "niri help msg action focus-window-bottom" [
  ]

  # Focus the window below or the topmost window
  export extern "niri help msg action focus-window-down-or-top" [
  ]

  # Focus the window above or the bottommost window
  export extern "niri help msg action focus-window-up-or-bottom" [
  ]

  # Move the focused column to the left
  export extern "niri help msg action move-column-left" [
  ]

  # Move the focused column to the right
  export extern "niri help msg action move-column-right" [
  ]

  # Move the focused column to the start of the workspace
  export extern "niri help msg action move-column-to-first" [
  ]

  # Move the focused column to the end of the workspace
  export extern "niri help msg action move-column-to-last" [
  ]

  # Move the focused column to the left or to the monitor to the left
  export extern "niri help msg action move-column-left-or-to-monitor-left" [
  ]

  # Move the focused column to the right or to the monitor to the right
  export extern "niri help msg action move-column-right-or-to-monitor-right" [
  ]

  # Move the focused column to a specific index on its workspace
  export extern "niri help msg action move-column-to-index" [
  ]

  # Move the focused window down in a column
  export extern "niri help msg action move-window-down" [
  ]

  # Move the focused window up in a column
  export extern "niri help msg action move-window-up" [
  ]

  # Move the focused window down in a column or to the workspace below
  export extern "niri help msg action move-window-down-or-to-workspace-down" [
  ]

  # Move the focused window up in a column or to the workspace above
  export extern "niri help msg action move-window-up-or-to-workspace-up" [
  ]

  # Consume or expel the focused window left
  export extern "niri help msg action consume-or-expel-window-left" [
  ]

  # Consume or expel the focused window right
  export extern "niri help msg action consume-or-expel-window-right" [
  ]

  # Consume the window to the right into the focused column
  export extern "niri help msg action consume-window-into-column" [
  ]

  # Expel the focused window from the column
  export extern "niri help msg action expel-window-from-column" [
  ]

  # Swap focused window with one to the right
  export extern "niri help msg action swap-window-right" [
  ]

  # Swap focused window with one to the left
  export extern "niri help msg action swap-window-left" [
  ]

  # Toggle the focused column between normal and tabbed display
  export extern "niri help msg action toggle-column-tabbed-display" [
  ]

  # Set the display mode of the focused column
  export extern "niri help msg action set-column-display" [
  ]

  # Center the focused column on the screen
  export extern "niri help msg action center-column" [
  ]

  # Center the focused window on the screen
  export extern "niri help msg action center-window" [
  ]

  # Center all fully visible columns on the screen
  export extern "niri help msg action center-visible-columns" [
  ]

  # Focus the workspace below
  export extern "niri help msg action focus-workspace-down" [
  ]

  # Focus the workspace above
  export extern "niri help msg action focus-workspace-up" [
  ]

  # Focus a workspace by reference (index or name)
  export extern "niri help msg action focus-workspace" [
  ]

  # Focus the previous workspace
  export extern "niri help msg action focus-workspace-previous" [
  ]

  # Move the focused window to the workspace below
  export extern "niri help msg action move-window-to-workspace-down" [
  ]

  # Move the focused window to the workspace above
  export extern "niri help msg action move-window-to-workspace-up" [
  ]

  # Move the focused window to a workspace by reference (index or name)
  export extern "niri help msg action move-window-to-workspace" [
  ]

  # Move the focused column to the workspace below
  export extern "niri help msg action move-column-to-workspace-down" [
  ]

  # Move the focused column to the workspace above
  export extern "niri help msg action move-column-to-workspace-up" [
  ]

  # Move the focused column to a workspace by reference (index or name)
  export extern "niri help msg action move-column-to-workspace" [
  ]

  # Move the focused workspace down
  export extern "niri help msg action move-workspace-down" [
  ]

  # Move the focused workspace up
  export extern "niri help msg action move-workspace-up" [
  ]

  # Move the focused workspace to a specific index on its monitor
  export extern "niri help msg action move-workspace-to-index" [
  ]

  # Set the name of the focused workspace
  export extern "niri help msg action set-workspace-name" [
  ]

  # Unset the name of the focused workspace
  export extern "niri help msg action unset-workspace-name" [
  ]

  # Focus the monitor to the left
  export extern "niri help msg action focus-monitor-left" [
  ]

  # Focus the monitor to the right
  export extern "niri help msg action focus-monitor-right" [
  ]

  # Focus the monitor below
  export extern "niri help msg action focus-monitor-down" [
  ]

  # Focus the monitor above
  export extern "niri help msg action focus-monitor-up" [
  ]

  # Focus the previous monitor
  export extern "niri help msg action focus-monitor-previous" [
  ]

  # Focus the next monitor
  export extern "niri help msg action focus-monitor-next" [
  ]

  # Focus a monitor by name
  export extern "niri help msg action focus-monitor" [
  ]

  # Move the focused window to the monitor to the left
  export extern "niri help msg action move-window-to-monitor-left" [
  ]

  # Move the focused window to the monitor to the right
  export extern "niri help msg action move-window-to-monitor-right" [
  ]

  # Move the focused window to the monitor below
  export extern "niri help msg action move-window-to-monitor-down" [
  ]

  # Move the focused window to the monitor above
  export extern "niri help msg action move-window-to-monitor-up" [
  ]

  # Move the focused window to the previous monitor
  export extern "niri help msg action move-window-to-monitor-previous" [
  ]

  # Move the focused window to the next monitor
  export extern "niri help msg action move-window-to-monitor-next" [
  ]

  # Move the focused window to a specific monitor
  export extern "niri help msg action move-window-to-monitor" [
  ]

  # Move the focused column to the monitor to the left
  export extern "niri help msg action move-column-to-monitor-left" [
  ]

  # Move the focused column to the monitor to the right
  export extern "niri help msg action move-column-to-monitor-right" [
  ]

  # Move the focused column to the monitor below
  export extern "niri help msg action move-column-to-monitor-down" [
  ]

  # Move the focused column to the monitor above
  export extern "niri help msg action move-column-to-monitor-up" [
  ]

  # Move the focused column to the previous monitor
  export extern "niri help msg action move-column-to-monitor-previous" [
  ]

  # Move the focused column to the next monitor
  export extern "niri help msg action move-column-to-monitor-next" [
  ]

  # Move the focused column to a specific monitor
  export extern "niri help msg action move-column-to-monitor" [
  ]

  # Change the width of the focused window
  export extern "niri help msg action set-window-width" [
  ]

  # Change the height of the focused window
  export extern "niri help msg action set-window-height" [
  ]

  # Reset the height of the focused window back to automatic
  export extern "niri help msg action reset-window-height" [
  ]

  # Switch between preset column widths
  export extern "niri help msg action switch-preset-column-width" [
  ]

  # Switch between preset column widths backwards
  export extern "niri help msg action switch-preset-column-width-back" [
  ]

  # Switch between preset window widths
  export extern "niri help msg action switch-preset-window-width" [
  ]

  # Switch between preset window widths backwards
  export extern "niri help msg action switch-preset-window-width-back" [
  ]

  # Switch between preset window heights
  export extern "niri help msg action switch-preset-window-height" [
  ]

  # Switch between preset window heights backwards
  export extern "niri help msg action switch-preset-window-height-back" [
  ]

  # Toggle the maximized state of the focused column
  export extern "niri help msg action maximize-column" [
  ]

  # Change the width of the focused column
  export extern "niri help msg action set-column-width" [
  ]

  # Expand the focused column to space not taken up by other fully visible columns
  export extern "niri help msg action expand-column-to-available-width" [
  ]

  # Switch between keyboard layouts
  export extern "niri help msg action switch-layout" [
  ]

  # Show the hotkey overlay
  export extern "niri help msg action show-hotkey-overlay" [
  ]

  # Move the focused workspace to the monitor to the left
  export extern "niri help msg action move-workspace-to-monitor-left" [
  ]

  # Move the focused workspace to the monitor to the right
  export extern "niri help msg action move-workspace-to-monitor-right" [
  ]

  # Move the focused workspace to the monitor below
  export extern "niri help msg action move-workspace-to-monitor-down" [
  ]

  # Move the focused workspace to the monitor above
  export extern "niri help msg action move-workspace-to-monitor-up" [
  ]

  # Move the focused workspace to the previous monitor
  export extern "niri help msg action move-workspace-to-monitor-previous" [
  ]

  # Move the focused workspace to the next monitor
  export extern "niri help msg action move-workspace-to-monitor-next" [
  ]

  # Move the focused workspace to a specific monitor
  export extern "niri help msg action move-workspace-to-monitor" [
  ]

  # Toggle a debug tint on windows
  export extern "niri help msg action toggle-debug-tint" [
  ]

  # Toggle visualization of render element opaque regions
  export extern "niri help msg action debug-toggle-opaque-regions" [
  ]

  # Toggle visualization of output damage
  export extern "niri help msg action debug-toggle-damage" [
  ]

  # Move the focused window between the floating and the tiling layout
  export extern "niri help msg action toggle-window-floating" [
  ]

  # Move the focused window to the floating layout
  export extern "niri help msg action move-window-to-floating" [
  ]

  # Move the focused window to the tiling layout
  export extern "niri help msg action move-window-to-tiling" [
  ]

  # Switches focus to the floating layout
  export extern "niri help msg action focus-floating" [
  ]

  # Switches focus to the tiling layout
  export extern "niri help msg action focus-tiling" [
  ]

  # Toggles the focus between the floating and the tiling layout
  export extern "niri help msg action switch-focus-between-floating-and-tiling" [
  ]

  # Move the floating window on screen
  export extern "niri help msg action move-floating-window" [
  ]

  # Toggle the opacity of the focused window
  export extern "niri help msg action toggle-window-rule-opacity" [
  ]

  # Set the dynamic cast target to the focused window
  export extern "niri help msg action set-dynamic-cast-window" [
  ]

  # Set the dynamic cast target to the focused monitor
  export extern "niri help msg action set-dynamic-cast-monitor" [
  ]

  # Clear the dynamic cast target, making it show nothing
  export extern "niri help msg action clear-dynamic-cast-target" [
  ]

  # Toggle (open/close) the Overview
  export extern "niri help msg action toggle-overview" [
  ]

  # Open the Overview
  export extern "niri help msg action open-overview" [
  ]

  # Close the Overview
  export extern "niri help msg action close-overview" [
  ]

  # Toggle urgent status of a window
  export extern "niri help msg action toggle-window-urgent" [
  ]

  # Set urgent status of a window
  export extern "niri help msg action set-window-urgent" [
  ]

  # Unset urgent status of a window
  export extern "niri help msg action unset-window-urgent" [
  ]

  # Reload the config file
  export extern "niri help msg action load-config-file" [
  ]

  # Change output configuration temporarily
  export extern "niri help msg output" [
  ]

  # Turn off the output
  export extern "niri help msg output off" [
  ]

  # Turn on the output
  export extern "niri help msg output on" [
  ]

  # Set the output mode
  export extern "niri help msg output mode" [
  ]

  # Set the output scale
  export extern "niri help msg output scale" [
  ]

  # Set the output transform
  export extern "niri help msg output transform" [
  ]

  # Set the output position
  export extern "niri help msg output position" [
  ]

  # Position the output automatically
  export extern "niri help msg output position auto" [
  ]

  # Set a specific position
  export extern "niri help msg output position set" [
  ]

  # Set the variable refresh rate mode
  export extern "niri help msg output vrr" [
  ]

  # Start continuously receiving events from the compositor
  export extern "niri help msg event-stream" [
  ]

  # Print the version of the running niri instance
  export extern "niri help msg version" [
  ]

  # Request an error from the running niri instance
  export extern "niri help msg request-error" [
  ]

  # Print the overview state
  export extern "niri help msg overview-state" [
  ]

  # Validate the config file
  export extern "niri help validate" [
  ]

  # Cause a panic to check if the backtraces are good
  export extern "niri help panic" [
  ]

  # Generate shell completions
  export extern "niri help completions" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "niri help help" [
  ]

}

export use completions *
