##############################
# Network and user scripts
#
# Andrey Kuprianov, 2024
##############################

# Please make sure to define/revise constants in "constants.sh"

SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

. "$SCRIPT_DIR/run.sh"

# Select which network to use (local, testnet)
net-select() {
    if [ "$1" == 'local' ]
    then
        export SOROBAN_NETWORK="$SOROBAN_LOCAL_NETWORK_NAME"
        export SOROBAN_RPC_URL="$SOROBAN_LOCAL_RPC_URL"
        export SOROBAN_NETWORK_PASSPHRASE="$SOROBAN_LOCAL_NETWORK_PASSPHRASE"
    elif [ "$1" == 'testnet' ]
    then
        export SOROBAN_NETWORK="$SOROBAN_TESTNET_NETWORK_NAME"
        export SOROBAN_RPC_URL="$SOROBAN_TESTNET_RPC_URL"
        export SOROBAN_NETWORK_PASSPHRASE="$SOROBAN_TESTNET_NETWORK_PASSPHRASE"
    else
        echo 'ERROR: excpecting one of "local", "testnet"'
        return 1
    fi
}

# Launch/connect to network, and create default identities
net-launch() {
    if [ "$SOROBAN_PS1" != '' ] 
    then
        export PRE_SOROBAN_PS1="$PS1"
        export PS1="$SOROBAN_PS1"
    fi

    printf "👽 Launching stellar transport... \n"

    if [ "$SOROBAN_NETWORK" == "$SOROBAN_LOCAL_NETWORK_NAME" ] 
    then
        1>/dev/null log-run  net-launch '' \
        "soroban network start local"
    elif [ "$SOROBAN_NETWORK" == "" ] 
    then
        echo 'ERROR: please run net-select first'
        return 1
    fi

    while 
        output=$(2>&1 soroban keys generate alice)
        [ "$output" != "" ]
    do
        printf "   💀 Access to stellar transport denied; retrying...\n"
        sleep 5
    done
    printf "👽 Stellar transport ready. Latest ledger: "
    curl -s -X POST -H \
        'Content-Type: application/json' -d '{"jsonrpc": "2.0","id": 111111,"method": "getLatestLedger"}' \
        $SOROBAN_RPC_URL \
        |  grep -o -e '[0-9]*' | tail -n1
    printf "     👾 alice boarded.. "
    soroban keys generate bob
    printf "👾 bob boarded.. "
    soroban keys generate carol
    printf "👾 carol boarded.. "
    soroban keys generate dave
    printf "👾 dave boarded.. "
    soroban keys generate eve
    printf "👾 eve boarded.\n👽 All passengers aboard; warp 9, commander!\n"
}

# Stop Stellar Docker image
net-stop() {
    printf "👽 Stellar transport landing; buckle your seatbelts! 👾👾👾👾👾\n"

    if [ "$SOROBAN_NETWORK" == "$SOROBAN_LOCAL_NETWORK_NAME" ] 
    then
        1>/dev/null log-run  net-launch '' \
        "soroban network stop local"
    fi

    printf "👽 Have a nice day, commander!\n"

    if [ "$PRE_SOROBAN_PS1" != '' ] 
    then
        export PS1="$PRE_SOROBAN_PS1"
        unset SOROBAN_PS1
        unset PRE_SOROBAN_PS1
    fi
}


net-user-create() {
    log-run  net-user-create "$*" \
    "soroban keys generate $1"
}

