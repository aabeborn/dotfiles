Tmux Cheatsheet
Prefix Key

Custom: Ctrl + a (replaces default Ctrl + b)

Session Management
Basic Session Commands

tmux new-session -s name - Create new session named "name"
tmux ls - List sessions
tmux attach -t name - Attach to session "name"
<prefix> d - Detach from current session
<prefix> $ - Rename current session
<prefix> s - Show session list
<prefix> L - Switch to last session
<prefix> ( - Switch to previous session
<prefix> ) - Switch to next session

Sessionx Plugin Commands

<prefix> o - Open sessionx menu
alt+backspace - Delete selected session
ctrl-u - Scroll preview up
ctrl-d - Scroll preview down
ctrl-n - Select preview up
ctrl-p - Select preview down
ctrl-r - Launch read prompt to rename session
ctrl-w - Reload list with all available windows and preview
ctrl-x - Fuzzy search in ~/.config
ctrl-e - Expand PWD and search for local directories
ctrl-b - Go back to first query
ctrl-t - Show tree view of sessions+windows
ctrl-/ - Show tmuxinator sessions
ctrl-g - Show fzf-marks marks
? - Toggle preview pane

Window Management

<prefix> c - Create new window
<prefix> & - Kill current window
<prefix> , - Rename current window
<prefix> w - List windows
<prefix> n - Move to next window
<prefix> p - Move to previous window
<prefix> 0-9 - Switch to window number 0-9
<prefix> l - Toggle between current and last window
<prefix> ' - Select window by number
<prefix> w - Select window from list

Pane Management
Custom Pane Commands

<prefix> s - Split window horizontally (replaces <prefix> ")
<prefix> v - Split window vertically (replaces <prefix> %)
<prefix> h - Move to left pane (replaces <prefix> ←)
<prefix> j - Move to down pane (replaces <prefix> ↓)
<prefix> k - Move to up pane (replaces <prefix> ↑)
<prefix> l - Move to right pane (replaces <prefix> →)
<prefix> < - Resize pane left by 5 cells
<prefix> > - Resize pane right by 5 cells
<prefix> - - Resize pane down by 5 cells
<prefix> + - Resize pane up by 5 cells

Standard Pane Commands

<prefix> x - Kill current pane
<prefix> ! - Convert pane to window
<prefix> z - Toggle pane zoom
<prefix> } - Swap current pane with next
<prefix> { - Swap current pane with previous
<prefix> Ctrl+o - Rotate panes
<prefix> Space - Toggle between pane layouts
<prefix> o - Go to next pane
<prefix> ; - Toggle between current and last pane
<prefix> q - Show pane numbers (type number to select)

Copy Mode (Vi Mode)

<prefix> [ - Enter copy mode
v - Begin selection
Ctrl+v - Rectangle selection
y - Copy selection
q - Exit copy mode
Navigation in copy mode:

h, j, k, l - Move cursor
w, b - Move word forward/backward
f, F - Find character forward/backward
/, ? - Search forward/backward
n, N - Next/previous search match
G - Go to bottom
g - Go to top
0 - Start of line
$ - End of line

Plugin Features
tmux-resurrect

<prefix> Ctrl-s - Save session
<prefix> Ctrl-r - Restore session

tmux-continuum

Automatic session saving every 15 minutes
Automatic session restore on tmux server start

tmux-yank

y - Copy selected text (in vi-mode)
<prefix> y - Copy current command line
<prefix> Y - Copy current working directory

tmux-fzf

<prefix> F - Launch fzf (fuzzy finder)

Custom Commands

<prefix> r - Reload configuration
<prefix> a - Install plugins (TPM)
<prefix> m - Update plugins (TPM)

Other Commands

<prefix> : - Enter command mode
<prefix> ? - Show all keybindings
<prefix> t - Show time
<prefix> i - Show current window info

Command Mode Commands

:new-session - Create new session
:kill-session - Kill current session
:kill-server - Kill tmux server
:set -g OPTION - Set option globally
:setw -g OPTION - Set window option globally
:source-file ~/.tmux.conf - Reload configuration
