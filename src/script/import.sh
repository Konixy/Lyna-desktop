#!/bin/bash

app_dir="../app"
temp_dir="../temp"
app_repo="https://github.com/Konixy/Lyna"
ignores_file="import-ignores.txt"

import() {

  mkdir $temp_dir

  git clone $app_repo $temp_dir

  cp -RT $temp_dir/ $app_dir/
  rm -rf $temp_dir

}

delete_custom_files() {
  while LANG=C IFS= read -r in ; do
    if ! [[ $in == \#* || $in == "" || $in == " " || $in == "
" ]]; then
      FILENAME=$app_dir"/"$in
      rm -rf "$FILENAME"
      echo "deleted $FILENAME";
    fi;
  done <$ignores_file
}

# import
[ -f "$ignores_file" ] && delete_custom_files
