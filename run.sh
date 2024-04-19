##############################
# Command running and logging
#
# Andrey Kuprianov, 2024
##############################

SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

. "$SCRIPT_DIR/constants.sh"

# log the command to LOGFILE
log() {
    if [ "$2" == '' ] 
    then
      printf "$1\n" >> $LOGFILE
    else
        printf "$1 $2\n" >> $LOGFILE
    fi
}

# log the command to LOGFILE, and run it
log-run() {
    log $1 $2
    printf "# $3\n" >> $LOGFILE
    output=$(eval $3 2>$ERRFILE)
    err=$(cat $ERRFILE)
    if [ -n "$err" ] 
    then 
        filtered=$(printf "$err" | grep -ie "error" | grep -ve "stellar_rpc_client::log::diagnostic_events" | >&2 cat)
        if [ -n "$filtered" ] 
        then 
            printf "$filtered\n(errors are abridged; see the full error message in the logs)" 
        fi
        printf "\n$err\n" >> $LOGFILE
    fi
    if [ -n "$output" ] 
    then 
        echo $output
        printf "\n$output\n" >> $LOGFILE
    fi
    printf "\n" >> $LOGFILE
}

