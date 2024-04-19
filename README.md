# Tiny scripts to simplify testing of / playing with Soroban smart contracts

This repository contains a few scripts to simplify your life when interacting with [Soroban](https://stellar.org/soroban), the emerging smart contract platform from [Stellar](https://stellar.org/). The scripts automate a few operations which you would need to do frequently if you want to "play" with Soroban contracts from the command line.

**NB!** We are happy to help, but please keep in mind that **these scripts are for testing purposes only**. No waranties of any kind are provided; use at your own risk. Please see [LICENSE](./LICENSE) for full info.

In order to use these scripts please make sure to install the following on your system (OS specific):

- [Docker](https://docs.docker.com/get-docker/)
- [Rust](https://www.rust-lang.org/tools/install)
- Finally, install also [Soroban CLI](https://github.com/stellar/soroban-cli)

In a directory of your choice, clone two repos:

- `git clone https://github.com/stellar/soroban-examples.git`
- `git clone https://github.com/freespek/soroban-scripts.git`

Now, you are ready to go! 

### Starting/stopping the network

```sh
⍉ > . soroban-scripts/net.sh 
⍉ > net-launch
👽 Launching stellar transport... 891d50346d47955c63371d27ffe794cca57ebd2eb1ce8c89a4941441ed6f3cb4
   💀 Access to stellar transport denied; retrying...
   💀 Access to stellar transport denied; retrying...
   💀 Access to stellar transport denied; retrying...
👽 Stellar transport ready.
     👾 alice boarded.. 👾 bob boarded.. 👾 carol boarded.. 👾 dave boarded.. 👾 eve boarded.
👽 All passengers aboard; warp 9, commander!
⍉ > net-stop
👽 Stellar transport landing; buckle your seatbelts! 👾👾👾👾👾
   stellar
           transport
                     landed.
👽 Have a nice day, commander!
⍉ > 
```

What you see above is the automation of:

- starting of the Stellar Docker container
- waiting till the container is ready to accept RPC requests
- creating a few testing identities
- stopping of the Docker container

### Creating token contracts, and interacting with them

Now, let's do smth more interesting: we are going to build and deploy the example token contract, and interact with it. Notice that for all `token-*` calls the first parameter is the identity that signs that transaction (its source).

```sh
# now we source the token script
⍉ > . soroban-scripts/token.sh 
⍉ > net-launch
# ... as before
👽 All passengers aboard; warp 9, commander!
⍉ > contract-example-build token
# token contract is being build...
Finished release [optimized] target(s) in 20.06s
# deploy token contract with alice as admin, 18 decimals, and COIN as name/symbol
⍉ > coin=$(token-create alice alice 18 COIN COIN)
⍉ > token-name alice $coin
"COIN"
⍉ > token-balance alice $coin alice
"0"
# alice doesn't have any coins, but she can mint
⍉ > token-mint alice $coin alice 100
⍉ > token-balance alice $coin alice
"100"
# alice is kind, so she shares her coins with bob
⍉ > token-transfer alice $coin alice bob 50
⍉ > token-balance alice $coin alice
"50"
⍉ > token-balance bob $coin bob
"50"
⍉ > net-stop
# ...
👽 Have a nice day, commander!
```

There is more to come; enjoy, and stay tuned!