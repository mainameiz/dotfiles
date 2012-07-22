#/bin/sh

cd ~
git clone https://github.com/mainameiz/dotfiles.git .dotfiles

echo " Symlinking..."
dotfiles_dir=".dotfiles/files"
for item in `ls -A $HOME/$dotfiles_dir`; do
  file="$dotfiles_dir/$item"
  #  echo "$file"
  ln -sv "$file"
done

cd -
