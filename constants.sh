##############################
# Config constants for scripts
#
# Andrey Kuprianov, 2024
##############################

# Docker image to use
DOCKER_IMAGE=stellar/quickstart

# A few variables to simplify calls with Soroban CLI

## Local (Docker) network
PORT=8000
SOROBAN_LOCAL_NETWORK_NAME=local
SOROBAN_LOCAL_RPC_URL="http://localhost:$PORT/soroban/rpc"
SOROBAN_LOCAL_NETWORK_PASSPHRASE="Standalone Network ; February 2017"

# Public testnet
SOROBAN_TESTNET_NETWORK_NAME=testnet
SOROBAN_TESTNET_RPC_URL="https://soroban-testnet.stellar.org:443"
SOROBAN_TESTNET_NETWORK_PASSPHRASE="Test SDF Network ; September 2015"

# Default source account
export SOROBAN_ACCOUNT=alice

# Where to look for Soroban example contracts
export SOROBAN_EXAMPLES=soroban-examples

# Set up a fancy terminal? :D
export SOROBAN_PS1="⍉ > "

# File to store complete logs
LOGFILE=soroban-scripts.log

# File to store the last encountered error
ERRFILE=soroban-scripts.err

