##############################
# Config constants for scripts
#
# Andrey Kuprianov, 2024
##############################

# Docker image to use
DOCKER_IMAGE=stellar/quickstart

# A few variables to simplify calls with Soroban CLI
export SOROBAN_RPC_URL="http://localhost:8000/soroban/rpc"
export SOROBAN_NETWORK=testnet
export SOROBAN_NETWORK_PASSPHRASE="Standalone Network ; February 2017"
export SOROBAN_ACCOUNT=alice

# Where to look for Soroban example contracts
export SOROBAN_EXAMPLES=soroban-examples

# File to store complete logs
LOGFILE=soroban-scripts.log

# File to store the last encountered error
ERRFILE=soroban-scripts.err

