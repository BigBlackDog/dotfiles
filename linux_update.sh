#!/bin/bash

mkdir -p $HOME/.config/nvim
cp --verbose -r neovim/.config/nvim/* $HOME/.config/nvim/

mkdir -p $HOME/.i3
cp --verbose i3/config $HOME/.i3/

cp --verbose shells/zshrc $HOME/.zshrc
cp --verbose shells/aliases $HOME/.aliases
cp --verbose tmux/tmux.conf $HOME/.tmux.conf

mkdir -p $HOME/.config/alacritty
cp --verbose alacritty/.config/alacritty/alacritty.yml $HOME/.config/alacritty/
cp --verbose picom/.config/picom.conf $HOME/.config/
