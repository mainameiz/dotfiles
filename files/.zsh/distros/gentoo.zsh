#!/usr/bin/env zsh
[[ ! -s /etc/gentoo-release ]] && return

if [[ `id -u` -eq 0 ]]; then
  alias eix-sync='eix-sync -C "--ask=n"'
fi
