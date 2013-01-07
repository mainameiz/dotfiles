#!/bin/bash

make_backup() {
  backup_name="${1}"
  backup_number="${2}"
  backup_file="${backup_name}.${backup_number}.bak"
  if [[ -e "$backup_file" ]]; then
    backup_number=$(( $backup_number + 1 ))
    make_backup "$backup_name" "$backup_number"
  else
    cp "$backup_name" "$backup_file"
  fi
}

REPO_DIR=".dotfiles"
REPO="${HOME}/${REPO_DIR}"
GIT_DIR="--git-dir=${REPO}/.git --work-tree=${REPO}/"

if [[ -d "${REPO}/.git" ]]; then
  echo "Updating repository..."
  git $GIT_DIR pull origin master
else
  echo "Cloning repository..."
  git clone https://github.com/mainameiz/dotfiles.git "${REPO}"
fi

FILES=$(git $GIT_DIR ls-tree --name-only HEAD files/)

cd ~
echo " Symlinking..."
for ITEM in ${FILES}; do
  FILE="$REPO_DIR/$ITEM" # .dotfiles/files/file
  bname=$(basename "$ITEM")
  if [[ -e "$bname" && ! -h "$bname" ]]; then # если файл существует и он не символьная ссылка
    if [[ -f "$bname" && -f "$HOME/$FILE" ]]; then # если это файлы - сравнить и сделать бэкап, если нужно
      cmp "$bname" "$HOME/$FILE"
      if [[ "$?" != "0" ]]; then
        make_backup "$bname"
      fi
    else # если один из источников не файл то, сделать бэкап в любом случае
      make_backup "$bname"
    fi
  fi
  ln -svf "$FILE"
done
cd -
