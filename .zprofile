if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

export PATH=/Users/tadashigaki/.go/bin:/usr/local/bin/go/bin:/Users/tadashigaki/.cargo/bin:/Users/tadashigaki/.nodebrew/current/bin:/Users/tadashigaki/.cask/bin:/Users/tadashigaki/.cargo/bin:/Users/tadashigaki/.nodebrew/current/bin:/Users/tadashigaki/.cask/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/Library/Tex/texbin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tadashigaki/google-cloud-sdk/path.bash.inc' ]; then . '/Users/tadashigaki/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tadashigaki/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/tadashigaki/google-cloud-sdk/completion.bash.inc'; fi

export PATH="$HOME/.cargo/bin:$PATH"
