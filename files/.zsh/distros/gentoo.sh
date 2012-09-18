[[ ! -s /etc/gentoo-release ]] && return

if [[ ${EUID} == 0 ]]; then
  alias eix-sync='eix-sync -C "--ask=n"'
fi
