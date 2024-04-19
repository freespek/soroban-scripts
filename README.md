# Tiny scripts to simplify testing of / playing with Soroban smart contracts

This repository contains a few scripts to simplify our life when interacting with Soroban,  The scripts automate a few operations which you would need to do frequently, if you want to "play" with Soroban contracts from the command line.

**NB!** We are happy to help, but keep in mind that **these scripts are for testing purposes only**. No waranties of any kind are provided; use at your own risk. Please see [LICENSE](./LICENSE) for full info; enjoy!

In order to use these scripts please make sure that to install on your system (OS specific):

- [Docker](https://docs.docker.com/get-docker/)
- [Rust](https://www.rust-lang.org/tools/install)
- Finally, install also [Soroban CLI](https://github.com/stellar/soroban-cli)

In a directory of your choice, clone two repos:

- `git clone https://github.com/stellar/soroban-examples.git`
- `git clone https://github.com/freespek/soroban-scripts.git`

Now, you are ready to go! 

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

There is more to come; stay tuned!