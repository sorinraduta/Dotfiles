#  __      __       _
#  \ \    / /__ _ _| |__ ____ __  __ _ __ ___ ___
#   \ \/\/ / _ \ '_| / /(_-< '_ \/ _` / _/ -_|_-<
#    \_/\_/\___/_| |_\_\/__/ .__/\__,_\__\___/__/
#                          |_|

# Define monitors
set $mainMonitor "{{@@ main_monitor @@}}"
set $secondaryMonitor "{{@@ secondary_monitor @@}}"

# Define workspaces
# This name is linked in polybar config
set $workspace1 "1"
set $workspace2 "2"
set $workspace3 "3"
set $workspace4 "4"
set $workspace5 "5"
set $workspace6 "6"
set $workspace7 "7"
set $workspace8 "8"
set $workspace9 "9"
set $workspace10 "10"

# Focus container at launch
for_window [class=".*"] focus

# Floating
for_window [class="Lxappearance"] floating enable
for_window [class="Gpick"] floating enable

# Startup workspaces
# exec --no-startup-id i3-msg workspace ""
# exec --no-startup-id i3-msg workspace ""


# Focus workspace
bindsym $mod+1 workspace $workspace1
bindsym $mod+2 workspace $workspace2
bindsym $mod+3 workspace $workspace3
bindsym $mod+4 workspace $workspace4
bindsym $mod+5 workspace $workspace5
bindsym $mod+6 workspace $workspace6
bindsym $mod+7 workspace $workspace7
bindsym $mod+8 workspace $workspace8
bindsym $mod+9 workspace $workspace9
bindsym $mod+0 workspace $workspace0

# Move focused container to workspace and focuse it
bindsym $mod+Shift+1 move container to workspace $workspace1; workspace $workspace1
bindsym $mod+Shift+2 move container to workspace $workspace2; workspace $workspace2
bindsym $mod+Shift+3 move container to workspace $workspace3; workspace $workspace3
bindsym $mod+Shift+4 move container to workspace $workspace4; workspace $workspace4
bindsym $mod+Shift+5 move container to workspace $workspace5; workspace $workspace5
bindsym $mod+Shift+6 move container to workspace $workspace6; workspace $workspace6
bindsym $mod+Shift+7 move container to workspace $workspace7; workspace $workspace7
bindsym $mod+Shift+8 move container to workspace $workspace8; workspace $workspace8
bindsym $mod+Shift+9 move container to workspace $workspace9; workspace $workspace9
bindsym $mod+Shift+0 move container to workspace $workspace10; workspace $workspace10

# Assign workspaces to monitors
workspace $workspace1 output $mainMonitor
workspace $workspace2 output $mainMonitor
workspace $workspace3 output $secondaryMonitor
workspace $workspace4 output $mainMonitor
workspace $workspace5 output $secondaryMonitor
workspace $workspace6 output $mainMonitor
workspace $workspace7 output $secondaryMonitor
workspace $workspace8 output $mainMonitor
workspace $workspace9 output $mainMonitor
workspace $workspace10 output $secondaryMonitor


# Assign apps to workspaces
### *1* - This needs to be above 'Browsers workspace' because
### some programs are within browsers

## Social
## Workspace: 5 | Monitor: Secondary | *1*
assign [title="WhatsApp"] $workspace5
assign [title="Slack"] $workspace5
assign [title="Discord"] $workspace5
assign [title="Skype"] $workspace5
assign [title="Messenger"] $workspace5

## Media
## Workspace: 6 | Monitor: Main | *1*
assign [title="YouTube"] $workspace6
assign [class="Spotify"] $workspace6

## Productivity
## Workspace: 4 | Monitor: Main | *1*
assign [title="Trello"] $workspace4
assign [title="Jira"] $workspace4
assign [title="Evernote"] $workspace4

## Browsers
## Workspace: 1 | Monitor: Main
assign [class="Chromium" window_role="browser"] $workspace1
assign [class="Google-chrome" window_role="browser"] $workspace1

## Coding
## Workspace: 2 | Monitor: Main
assign [class="Code"] $workspace2
assign [class="code-oss"] $workspace2

## Terminal
## Workspace: 3 | Monitor: Secondary
assign [class="Gnome-terminal"] $workspace3
assign [class="St"] $workspace3
assign [class="Termite"] $workspace3
assign [class="kitty"] $workspace3

## Browser inspector
## Workspace: 7 | Monitor: Secondary
assign [class="Chromium" window_role="pop-up"] $workspace7
assign [class="Google-chrome" window_role="pop-up"] $workspace7
