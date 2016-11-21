# dotfiles

My dotfiles for bash, vim and few other pieces of software.
Comes with an install script, meant for a new desktop.

## Usage

The install script is pretty invasive, you may want to test it in a vm or a container. 
The script deletes any existing dotfiles and changes the gnome-terminal profile.

**WARNING:** The scripts clones the whole nerd-fonts repo, which is ~1.8GB...

```
$ sudo apt install git
$ git clone https://github.com/lynxnot/dotfiles.git ~/repos/github.com/lynxnot/dotfiles
$ cd ~/repos/github.com/lynxnot/dotfiles
$ ./install.sh
```
