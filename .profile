# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Setup forwarding of SSH Agent socket from Windows.
# sudo apt-get install socat daemonize
# https://github.com/jstarks/npiperelay
if [ -n "${WSL_INTEROP}" -a -z "${SSH_AUTH_SOCK}" ]; then
  export SSH_AUTH_SOCK="${HOME}/.ssh/ssh-auth-sock"
  if ! ssh-add >/dev/null 2>&1 -l; then
    daemonize /usr/bin/socat UNIX-LISTEN:"${SSH_AUTH_SOCK},unlink-close,fork,umask=177" EXEC:"npiperelay.exe //./pipe/openssh-ssh-agent"
  fi
fi

export VISUAL=vim
export LESS=cSMnqifR
eval $(lesspipe)

export EMAIL=frol@hupp.se
