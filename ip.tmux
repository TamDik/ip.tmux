#!/bin/bash

get_ip_address() {
  if type ifconfig > /dev/null 2>&1; then
    ip="$(ifconfig | grep broadcast | awk '{print $2}' | head -n1)"
  elif type ip > /dev/null 2>&1; then
    ip="$(ip -o a | grep brd | awk '{print $4}' | head -n1)"
  elif type hostname > /dev/null 2>&1; then
    ip="$(hostname -I | awk '{print $1}')"
  fi

  if [ ! -z "$ip" ]; then
    echo $ip
  else
    echo failed
  fi
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
