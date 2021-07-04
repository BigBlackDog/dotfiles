#!/bin/bash

mkdir -p $HOME/.config/nvim
cp --verbose -r neovim/.config/nvim/* $HOME/.config/nvim/

mkdir -p $HOME/.i3
cp --verbose i3/config $HOME/.i3/

mkdir -p $HOME/.config/i3status
cp --verbose -r i3status/.config/i3status/* $HOME/.config/i3status/

cp --verbose shells/zshrc $HOME/.zshrc
cp --verbose shells/aliases $HOME/.aliases
cp --verbose tmux/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/alacritty
cp --verbose alacritty/.config/alacritty/* $HOME/.config/alacritty/
cp --verbose picom/.config/picom.conf $HOME/.config/
