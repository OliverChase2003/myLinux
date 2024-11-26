## nvim
cp -r ~/.config/nvim ./.config/

## bash
cp ~/.bash_profile      ./.bash_profile
cp ~/.bashrc            ./.bashrc
cp ~/.inputrc           ./.inputrc

## gitconfig
cp ~/.gitconfig         ./.itconfig

## fish
if [ ! -d "./.config/fish" ]; then
    mkdir -p ./.config/fish
fi

cp ~/.config/fish/config.fish ./.config/fish/config.fish

## ranger
if [ ! -d "./.config/ranger" ]; then
    mkdir -p ./.config/ranger
fi

cp ~/.config/ranger/rifle.conf          ./.config/ranger/rifle.conf
cp ~/.config/ranger/rc.conf             ./.config/ranger/rc.conf
cp ~/.config/ranger/commands.py         ./.config/ranger/commands.py
cp ~/.config/ranger/commands_full.py    ./.config/ranger/rcommands_full.py
cp ~/.config/ranger/scope.sh            ./.config/ranger/scope.sh

## ranger plugins

