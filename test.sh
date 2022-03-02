#!/usr/bin/env bash

ScriptLoc=$(readlink -f "$0")

unset options i
while IFS= read -r -d $'\0' f; do
  options[i++]="$f"
done < <(find -maxdepth 2 -type f -name "*.conf" -print0 )

IFS=$'\n' sorted=($(sort <<<"${options[*]}"))
unset IFS

select opt in "${sorted[@]}" "Stop the script"; do
  case $opt in
    *.conf)
      flatpak run com.dosbox_x.DOSBox-X -conf $opt
      exec "$ScriptLoc"
      # processing
      ;;
    "Stop the script")
      echo "You chose to stop"
      break
      ;;
    *)
      echo "This is not a number"
      ;;
  esac
done