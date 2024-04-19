###############################
# Scripts for Soroban contracts
#
# Andrey Kuprianov, 2024
###############################

SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

. "$SCRIPT_DIR/net.sh"

# Install a WASM file to the ledger without creating a contract instance
# Args: WASM-FILE-NAME
contract-install() {
    log-run  contract-install "$*" \
    "soroban contract install --wasm '$1'"
}

# Build a WASM file from soroban example contracts
# Args: EXAMPLE-CONTRACT-NAME
contract-example-build() {
    cur_dir=$(pwd)
    log  contract-example-build "$*"
    cd $SOROBAN_EXAMPLES/$1/ && soroban contract build && cd $cur_dir
}


# Install a WASM file from soroban example contracts
# Args: EXAMPLE-CONTRACT-NAME
contract-example-install() {
    log-run  contract-example-install "$*" \
    "soroban contract install --wasm '$SOROBAN_EXAMPLES/$1/target/wasm32-unknown-unknown/release/soroban_${1}_contract.wasm'"
}

# Deploy a WASM contract
# Args: WASM-FILE-NAME
# Returns: CONTRACT-ID
contract-deploy() {
    log-run  contract-deploy "$*" \
    "soroban contract deploy --wasm '$1'"
}

# Deploy a WASM file from soroban example contracts
# Args: EXAMPLE-CONTRACT-NAME
# Returns: CONTRACT-ID
contract-example-deploy() {
    log-run  contract-example-deploy "$*" \
    "soroban contract deploy --wasm '$SOROBAN_EXAMPLES/$1/target/wasm32-unknown-unknown/release/soroban_${1}_contract.wasm'"
}

# Invoke a contract function
# Args: CONTRACT-ID SOURCE FUNCTION [--ARG-NAME ARG-VALUE]*
# Returns: function output
contract-invoke() {
    args="${@:4}"

    log-run  contract-invoke "$*" \
    "soroban contract invoke --source $1 --id $2 -- $3 $args"
}
