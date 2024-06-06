####################################
# Scripts for example token contract
#
# Andrey Kuprianov, 2024
####################################

SCRIPT_DIR=`dirname ${BASH_SOURCE[0]-$0}`
SCRIPT_DIR=`cd $SCRIPT_DIR && pwd`

. "$SCRIPT_DIR/contract.sh"

# Deploy the example token contract
# Args: SOURCE ADMIN DECIMALS NAME SYMBOL
# Returns: CONTRACT-ID
token-deploy() {
    log token-create "$*"
    contract=$(contract-example-deploy token)
    contract-invoke $1 $contract initialize --admin $2 --decimal $3 --name $4 --symbol $5
    echo $contract
}

# Returns the name for this token
# Args: SOURCE CONTRACT-ID
# Returns: balance
token-name() {
    log token-name "$*"
    contract-invoke $1 $2 name
}

# Returns the symbol for this token.
# Args: SOURCE CONTRACT-ID
# Returns: balance
token-symbol() {
    log token-symbol "$*"
    contract-invoke $1 $2 symbol
}

# Mint tokens
# Args: SOURCE CONTRACT-ID TO AMOUNT
token-mint() {
    log token-mint "$*"
    contract-invoke $1 $2 mint --to $3 --amount $4
}

# Get balance of an account
# Args: SOURCE CONTRACT-ID ACCOUNT
# Returns: balance
token-balance() {
    log token-balance "$*"
    contract-invoke $1 $2 balance --id $3
}

# Transfer tokens
# Args: SOURCE CONTRACT-ID FROM TO AMOUNT
token-transfer() {
    log token-transfer "$*"
    contract-invoke $1 $2 transfer --from $3 --to $4 --amount $5
}

# Get allowance
# Args: SOURCE CONTRACT-ID FROM SPENDER
# Returns: allowance of FROM to SPENDER
token-allowance() {
    log token-allowance "$*"
    contract-invoke $1 $2 allowance --from $3 --spender $4
}
