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
set $workspace1 "ws1"
set $workspace2 "ws2"
set $workspace3 "ws3"
set $workspace4 "ws4"
set $workspace5 "ws5"
set $workspace6 "ws6"
set $workspace7 "ws7"
set $workspace8 "ws8"
set $workspace9 "ws9"
set $workspace10 "ws10"

set $additionalWorkspace1 "addws1"
set $additionalWorkspace2 "addws2"
set $additionalWorkspace3 "addws3"
set $additionalWorkspace4 "addws4"
set $additionalWorkspace5 "addws5"
set $additionalWorkspace6 "addws6"
set $additionalWorkspace7 "addws7"
set $additionalWorkspace8 "addws8"
set $additionalWorkspace9 "addws9"
set $additionalWorkspace10 "addws10"

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

bindsym $mod+KP_End workspace $additionalWorkspace1
bindsym $mod+KP_Down workspace $additionalWorkspace2
bindsym $mod+KP_Next workspace $additionalWorkspace3
bindsym $mod+KP_Left workspace $additionalWorkspace4
bindsym $mod+KP_Begin workspace $additionalWorkspace5
bindsym $mod+KP_Right workspace $additionalWorkspace6
bindsym $mod+KP_Home workspace $additionalWorkspace7
bindsym $mod+KP_Up workspace $additionalWorkspace8
bindsym $mod+KP_Prior workspace $additionalWorkspace9
bindsym $mod+KP_Insert workspace $additionalWorkspace10


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

bindsym $mod+Shift+KP_1 move container to workspace $additionalWorkspace1; workspace $additionalWorkspace1
bindsym $mod+Shift+KP_2 move container to workspace $additionalWorkspace2; workspace $additionalWorkspace2
bindsym $mod+Shift+KP_3 move container to workspace $additionalWorkspace3; workspace $additionalWorkspace3
bindsym $mod+Shift+KP_4 move container to workspace $additionalWorkspace4; workspace $additionalWorkspace4
bindsym $mod+Shift+KP_5 move container to workspace $additionalWorkspace5; workspace $additionalWorkspace5
bindsym $mod+Shift+KP_6 move container to workspace $additionalWorkspace6; workspace $additionalWorkspace6
bindsym $mod+Shift+KP_7 move container to workspace $additionalWorkspace7; workspace $additionalWorkspace7
bindsym $mod+Shift+KP_8 move container to workspace $additionalWorkspace8; workspace $additionalWorkspace8
bindsym $mod+Shift+KP_9 move container to workspace $additionalWorkspace9; workspace $additionalWorkspace9
bindsym $mod+Shift+KP_0 move container to workspace $additionalWorkspace10; workspace $additionalWorkspace10


# Assign workspaces to monitors
workspace $workspace1 output $mainMonitor
workspace $workspace2 output $mainMonitor
workspace $workspace3 output $secondaryMonitor
workspace $workspace4 output $secondaryMonitor
workspace $workspace5 output $secondaryMonitor
workspace $workspace6 output $secondaryMonitor
workspace $workspace7 output $mainMonitor
workspace $workspace8 output $secondaryMonitor
workspace $workspace9 output $secondaryMonitor
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

## Music
## Workspace: 6 | Monitor: Secondary | *1*
assign [title="YouTube"] $workspace6
assign [class="Spotify"] $workspace6

## Productivity
## Workspace: 9 | Monitor: Secondary | *1*
assign [title="Trello"] $workspace9
assign [title="Jira"] $workspace9

## Browsers
## Workspace: 1 | Monitor: Main
assign [class="Chromium" window_role="browser"] $workspace1
assign [class="Google-chrome" window_role="browser"] $workspace1

## Text editing
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
## Workspace: 4 | Monitor: Secondary
assign [class="Chromium" window_role="pop-up"] $workspace4
assign [class="Google-chrome" window_role="pop-up"] $workspace4

## Media
## Workspace: 7 | Monitor: Main

## Image editing
## Workspace: 8 | Monitor: Secondary
assign [class="^Gimp"] $workspace8
assign [class="feh"] $workspace8


