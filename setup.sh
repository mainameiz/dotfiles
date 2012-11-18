#!/bin/bash

REPO_DIR=".dotfiles"
REPO="${HOME}/${REPO_DIR}"
GIT_DIR="--git-dir=${REPO}/.git --work-tree=${REPO}/"

if [[ -d "${REPO}/.git" ]]; then
  echo "Updating repository..."
  #git $GIT_DIR pull
else
  echo "Cloning repository..."
  git clone https://github.com/mainameiz/dotfiles.git "${REPO}"
fi

FILES=$(git $GIT_DIR ls-tree --name-only HEAD files/)

change="n" # изменить ссылку?
backup="y" # сделать бэкап существующего файла?

cd ~
echo " Symlinking..."
for ITEM in ${FILES}; do
  FILE="$REPO_DIR/$ITEM"
  bname=$(basename "$ITEM")
  if [[ -e "$bname" ]]; then # файл существует?
    update="y"
    if [[ -d "$bname" ]]; then
      link_path=$(readlink -f "$bname")
      if [[ "$link_path" == "$HOME/$FILE" ]]; then
        update="n"
      fi
    else
      cmp "$bname" "$HOME/$FILE"
      if [[ "$?" == "0" ]]; then
        update="n"
      fi
    fi
    if [[ "$update" == "n" ]]; then
      backup="n"
      change="n"
    else

      echo -n "File $bname exists. Do you want to change it and make a backup? [yes/no]: "
      while true; do
        read NSWR
        case $NSWR in
          y|ye|yes)
            backup="y"
            change="y"
            break
            ;;
          n|no)
            backup="n"
            change="n"
            break
            ;;
          *)
            echo -n "Sorry, possible answers are \"yes\" or \"no\" [yes/no]: "
            ;;
        esac
      done
      unset NSWR

    fi
  else
    backup="n"
    change="y"
  fi
  if [[ "$backup" == "y" ]]; then
    timestamp=$(($(date +%s%N)/1000000))
    mv "$bname" "$REPO/backups/$bname-$timestamp.bkp"
  fi
  if [[ "$change" == "y" ]]; then
    rm -rf "$bname"
    ln -sv "$FILE"
  else
    echo "Skipped: $bname"
  fi
done
cd -
