#!/bin/bash

# First we append the saved layout of worspace N to workspace M
i3-msg "workspace 1; append_layout ~/.i3/workspace_N.json"

# And finally we fill the containers with the programs they had
(xfce4-terminal -T tasks -e 'sh -c "task projects; task; exec bash"' &)
(xfce4-terminal -T burndown -e 'sh -c "task burndown.daily; exec bash"' &)
(xfce4-terminal -T calendar -e 'sh -c "task calendar; exec bash"' &)
