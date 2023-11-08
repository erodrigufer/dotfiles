# Dotfiles

I am currently still trying to make the installation of the dotfiles as automatic as possible (real plug-and-play).

## Boot-up

- If you are setting up a computer for the first time, install `brew` and then run `boot-up.sh`.

## Installation

`make` will link the local dotfiles repository to `$HOME`.
Any changes in the local repository will be automatically reflected in the proper config files.

### nvim

#### Requirements

- Requires a file at `${HOME}/.chatgpt.vim.env` with the OpenAI API token.
  So that the `ChatGPT.nvim` plugins works.
