# =========================== #
# Backup and symlink dotfiles #
# =========================== #

# Dotfiles directory
dir=~/dotfiles/dotfiles
# Backup directory
olddir=~/dotfiles/dotfiles_old
# List of files/folders to symlink
config=".config/dunst .config/i3status .config/redshift.conf .config/screenlayout"
files="$config .i3 .Xdefaults .xinitrc .zshrc .vimrc"


echo "Clear backup folder at $olddir"
rm -rf $olddir
mkdir -p $olddir

echo "Changing to the $dir directory"
cd $dir

# Move existing dotfiles to backup folder; create new symlink
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
