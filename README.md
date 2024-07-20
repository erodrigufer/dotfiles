# Dotfiles

The installation of the dotfiles should be as automatic as possible (real _plug-and-play_).

## Boot-up

- If you are setting up a computer for the first time, install `brew` and then run `boot-up.sh`.

## Installation

`make` will link the local dotfiles repository to `$HOME`.
Any changes in the local repository will be automatically reflected in the proper config files.

## Requirements

### nvim

To use nvim with OpenAI's API, please ensure the following requirements are met:

1. **OpenAI API Key**: Store the plain API key in a file named `~/.openai.env`.
