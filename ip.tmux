#!/bin/bash

get_ip_address() {
  echo ip address
}

ip_address="$(get_ip_address)"

update_tmux_option() {
  local option="$1"
  local old_option_value="$(tmux show-option -gqv "$option")"
  local new_option_value=${old_option_value//\#\{ip\}/$ip_address}
  tmux set-option -gq "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
