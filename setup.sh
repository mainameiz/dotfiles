#/bin/sh

REPO_DIR=".dotfiles"
REPO="${HOME}/${REPO_DIR}"
GIT_DIR="--git-dir=${REPO}/.git --work-tree=${REPO}/"

if [[ -d "${REPO}/.git" ]]; then
  echo "Updating repository..."
  git $GIT_DIR pull
else
  echo "Cloning repository..."
  git clone https://github.com/mainameiz/dotfiles.git "${REPO}"
fi

FILES=$(git $GIT_DIR ls-tree --name-only HEAD files/)

cd ~
echo " Symlinking..."
for ITEM in ${FILES}; do
  FILE="$REPO_DIR/$ITEM"
  #echo ">>> $FILE"
  ln -sv "$FILE"
done
cd -
