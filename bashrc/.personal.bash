# Use gpg-agent for ssh authentication
[ -v SSH_CONNECTION ] || export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh"

# Setup some PATHs
if [[ ! "$PATH" == */home/rantogno/.local/bin* ]]; then
   export PATH="$HOME/.local/bin:$PATH"
fi

if [[ ! "$PATH" == */home/rantogno/.cargo/bin* ]]; then
   export PATH="$PATH:$HOME/.cargo/bin"
fi

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups
