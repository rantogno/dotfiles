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

function proxy_update() {
   if [ -f "$HOME/.config/intel.proxy" ]; then
      export http_proxy="http://proxy.jf.intel.com:911/"
      export https_proxy="http://proxy.jf.intel.com:911/"
      export ftp_proxy="http://proxy.jf.intel.com:911/"
      export no_proxy="localhost,127.0.0.0,127.0.1.1,127.0.1.1,local.home,.intel.com"
   else
      unset http_proxy
      unset https_proxy
      unset ftp_proxy
      unset no_proxy
   fi
}

function proxy_on() {
   mkdir -p $HOME/.config
   echo 1 > $HOME/.config/intel.proxy
   proxy_update
}

function proxy_off() {
   rm $HOME/.config/intel.proxy
   proxy_update
}

proxy_update
