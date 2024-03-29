#!/bin/bash

# Helix
rm ~/.config/helix/runtime
rm ~/.config/helix/languages.toml
rm ~/.config/helix/config.toml

mkdir -p ~/.config/helix

ln -s ~/helix/runtime ~/.config/helix/runtime
ln -s $PWD/config/helix/languages.toml ~/.config/helix/languages.toml
ln -s $PWD/config/helix/config.toml ~/.config/helix/config.toml

# Alacritty
mkdir -p ~/.config/skhd
rm ~/.config/alacritty

ln -s $PWD/config/alacritty ~/.config/alacritty

# TMUX
rm ~/.tmux.conf

ln -s $PWD/tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf

# ZSH
rm ~/.zshrc

cp $PWD/zshrc ~/.zshrc

# GitUI
mkdir -p ~/.config/gitui
rm ~/.config/gitui/key_bindings.ron

ln -s $PWD/config/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron

# ------------ MacOS -----------
# skhd
mkdir -p ~/.config/skhd
rm ~/.config/skhd/skhdrc
ln -s $PWD/config/skhd/skhdrc ~/.config/skhd/skhdrc
skhd --restart-service

# yabai
mkdir -p ~/.config/yabai
rm ~/.config/yabai/yabairc
ln -s $PWD/config/yabai/yabairc ~/.config/yabai/yabairc
yabai --restart-service

