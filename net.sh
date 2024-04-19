##############################
# Network and user scripts
#
# Andrey Kuprianov, 2024
##############################

# Please make sure to define/revise constants in "constants.sh"

# Import running/logging commants
. run.sh

# Set up a fancy terminal? :D
export SOROBAN_PS1="⍉ > "


# Launch Stellar Docker image, and create default identities
net-launch() {
    if [ "$SOROBAN_PS1" != '' ] 
    then
        export PRE_SOROBAN_PS1="$PS1"
        export PS1="$SOROBAN_PS1"
    fi

    printf "👽 Launching stellar transport... "
    log-run  net-launch '' \
    "docker run --rm -d -p $PORT:$PORT --name stellar $DOCKER_IMAGE --local --enable-soroban-rpc"

        while 
            output=$(2>&1 soroban keys generate alice)
            [ "$output" != "" ]
        do
            printf "   💀 Access to stellar transport denied; retrying...\n"
            sleep 5
        done
        printf "👽 Stellar transport ready.\n"
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
    printf "👽 Stellar transport landing; buckle your seatbelts! 👾👾👾👾👾\n   "
    log-run net-stop '' \
    "docker stop stellar"
    printf "           transport\n"
    printf "                     landed.\n👽 Have a nice day, commander!\n"

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

