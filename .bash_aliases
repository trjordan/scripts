alias ec2din=ec2-describe-instances
alias ec2dinr="ec2din -F 'instance-state-name=running'"

alias gch="git cherry -v master"

alias rmqlist="sudo rabbitmqctl list_queues -p etl_vhost"

alias runetl="CELERY_CONFIG_MODULE=config celeryd --maxtasksperchild=100 -c 4 -l INFO"
alias runtf="tracelyzer /etc/tracelyzer/tracelyzer.conf"

alias tl="cd ~/repos/tracelons/tracelytics"
alias etl="cd ~/repos/tracelons/transformer/etl"
alias cm="cd ~/repos/tracelons/common"
alias fmc="echo \"flush_all\" | nc localhost 11211"
alias genschema="python customers.py -i ../tracelytics/development.ini -M ../transformer/infra/mysql_tables.sql"
alias resetdb="mysql tracelytics < ~/repos/tracelons/transformer/infra/mysql_tables.sql && echo \"flush_all\" | nc localhost 11211"

alias tunstart="autossh -f dev -R 4012:localhost:48256 -N && echo done"
alias tunstop='kill `cat $AUTOSSH_PIDFILE` && echo done'

alias rmpyc="find . -regex '.*pyc$' -print0 | xargs --null -I file rm -v file"

function gra { 
    toadd=$(find . -name "$1")
    git add $toadd
    echo Added $toadd
}

function r() {
    if [ "$1" == "emacs" ]; then
        cd ~/.emacs.d
    else
        cd ~/repos/$1
    fi
}