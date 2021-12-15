# ip.tmux

tmux plugin showing your IP address in tmux status line

## Installation with Tmux Plugin Manager (recommended)

Add plugin to the list of TPM plugins in .tmux.conf:

```
set -g @plugin 'TamDik/ip.tmux'
```

Hit `prefix + I` to fetch the plugin and source it.


## Manual Installation

Clone the repo:

```sh
git clone https://github.com/TamDik/ip.tmux.git  ~/clone/path
```

Add this line to the bottom of .tmux.conf:

```
run-shell ~/clone/path/ip.tmux
```

Reload TMUX environment with `tmux source-file ~/.tmux.conf`.


## Usage

To display the IP address in the tmux status line, add `#{ip}`.

```
set -g status-left "#{ip}"
```
