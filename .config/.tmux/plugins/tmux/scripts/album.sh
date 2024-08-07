#!/usr/bin/env bash
# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $current_dir/utils.sh


main()
{
  # storing the refresh rate in the variable RATE, default is 5
  RATE=$(get_tmux_option "@dracula-refresh-rate" 5)

  if ! command -v playerctl &> /dev/null
  then
    exit 1
  fi

  FORMAT=$(get_tmux_option "{{ xesam:album }}" "{{ xesam:album }}")
  export MUSIC_APP=$(playerctl -l | grep chromium)
  if [[ -z "$MUSIC_APP" ]]; then
    export MUSIC_APP=$(playerctl -l | grep tidal-hifi)
  fi
  # echo $MUSIC_APP
  playerctl_playback=$(playerctl --player=$MUSIC_APP metadata --format "${FORMAT}")
  echo ${playerctl_playback}

}

# run the main driver
main
