#!/bin/bash

tmpfile=$(mktemp)
  ranger ~/Pictures/wallpapers/ --choosefile=${tmpfile}
  wallpaper=$(cat ${tmpfile})
  rm -f ${tmpfile}
  if [ -n "$wallpaper" ]; then
    backend=""
    wal -q -i "$wallpaper" 2> /dev/null
    wal --preview
    while [ "$backend" != "y" ]; do 
      echo "Which color backend?"
      echo "[1] wal (default)"
      echo "[2] haishoku"
      echo "[3] colorz"
      echo "[4] colorthief"
      echo "[5] fast_colorthief"
      echo "[6] modern_colorthief"
      echo "[7/y/ok] accept current"
      read -p "Choose: " backend

      case $backend in
        2) backend="haishoku";;
        3) backend="colorz";;
        4) backend="colorthief";;
        5) backend="fast_colorthief";;
        6) backend="modern_colorthief";;
        7|y|ok)
          break;;
        1|*) echo "Using wal (default)"; backend="wal";;
      esac
      
      wal -q -i "$wallpaper" --backend ${backend} 2> /dev/null
      wal --preview
    done
  fi
