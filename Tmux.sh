#!/bin/bash

#### Make a backup of .tmux.conf, delete original, create new
cp ~/.tmux.conf ~/.tmux.conf.bak
rm ~/.tmux.conf
touch ~/.tmux.conf

echo '# remap prefix to ctrl+a to benefit tmux usage on ssh connections
unbind C-b
set -g prefix C-Space
bind C-Space send-prefix

# reload config source-file after changes
unbind r
bind r source-file ~/.tmux.config \; display "Reloaded source-file"

# quality of life
set -g history-limit 10000
set -g allow-rename off

## join windows
bind-key j command-prompt -p "join pane from:"  "join-pane -s %%"
bind-key s command-prompt -p "send pane to:"  "join-pane -t %%"

# search mode VI (default is emac)
set-window-option -g mode-keys vi

# mouse scrolling

set -g mouse on

run-shell /opt/tmux-logging/logging.tmux' >> ~/.tmux.conf
