# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# AWS
alias ec2din=ec2-describe-instances
alias ec2dinr="ec2din -F 'instance-state-name=running'"

# Code cleanup
alias gch="git cherry -v master"
alias rmpyc="find . -regex '.*pyc$' -print0 | xargs --null -I file rm -v file"
alias ec="emacsclient"

# macOS hacks
alias updatedb="sudo /usr/libexec/locate.updatedb"
alias restart_camera="sudo killall VDCAssistant"
alias restart_audio="ps aux | grep 'coreaudio[d]' | awk '{print $2}' | xargs sudo kill"

function gra {
    toadd=$(find . -name "$1")
    git add $toadd
    echo Added $toadd
}

function r() {
    if [ "$1" == "emacs" ]; then
        cd ~/.emacs.d
    elif [ "$1" == "scripts" ]; then
        cd ~/scripts
    else
        cd ~/repos/$1
    fi
}
