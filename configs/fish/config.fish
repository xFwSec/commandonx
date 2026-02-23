fish_add_path /home/xfow/go/bin
fish_add_path /home/xfow/.local/bin
fish_add_path /home/xfow/.cargo/bin/
fish_add_path /home/xfow/.local/share/nvim/site/
set -gx GOPATH $HOME/go
zoxide init fish | source
