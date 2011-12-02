# Setup aliases
alias l='ls -al'
alias ll='ls -al'

# Setup PATH
export ADK_HOME=/Users/erd/Applications/android-sdk
export PATH=$PATH:$ADK_HOME/tools:$ADK_HOME/platform-tools:/opt/local/bin:/opt/local/sbin

# Load RVM
if [ -f "~/.rvm/scripts/rvm" ]; then
    . ~/.rvm/scripts/rvm
fi
