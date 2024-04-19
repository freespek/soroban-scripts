##############################
# Config constants for scripts
#
# Andrey Kuprianov, 2024
##############################

# Docker image to use
DOCKER_IMAGE=stellar/quickstart

# A few variables to simplify calls with Soroban CLI
PORT=8000
export SOROBAN_RPC_URL="http://localhost:$PORT/soroban/rpc"
export SOROBAN_NETWORK=testnet
export SOROBAN_NETWORK_PASSPHRASE="Standalone Network ; February 2017"
export SOROBAN_ACCOUNT=alice

# Where to look for Soroban example contracts
export SOROBAN_EXAMPLES=soroban-examples

# Set up a fancy terminal? :D
export SOROBAN_PS1="⍉ > "

# File to store complete logs
LOGFILE=soroban-scripts.log

# File to store the last encountered error
ERRFILE=soroban-scripts.err

