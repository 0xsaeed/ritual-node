<h1 align="center"> Ritual Node </h1>

![image](https://github.com/0xsaeed/ritual-node/assets/16464391/ffdcbc2f-3554-4e58-8227-4f4b4231d981)

### DISCLAIMER

**The code provided in this repository is for informational purposes only and is provided "as is" without any warranty or guarantee. The author(s) and maintainer(s) of this repository shall not be liable for any loss of data, financial losses, or other damages resulting from the use of this code. By using this code, you agree to use it at your own risk and indemnify and hold harmless the author(s) and maintainer(s) from any claims or liabilities arising from your use of the code.**
**using this code, you agree to indemnify and hold harmless the author(s) and maintainer(s) of this repository from any and all claims, damages, or other liabilities that may arise from your use of the code.**

**Please use this code responsibly and at your own risk.**

### Official Links

* [Official Document](https://docs.ritual.net/infernet/node/introduction)
* [Ritual X](https://x.com/ritualnet)
* [Ritual Discord](https://discord.com/invite/ritual-net)

## Recommended System Requirements

| Ram | cpu     | disk                      |
| :-------- | :------- | :-------------------------------- |
| `16GB`      | `4 modern vCPU cores ` | `500GB IOPS-optimized SSD ` |
> It's the recommended specification you can try with lower configuration.

You also need a wallet with a little amount of ETH on Basechain(<10$)

As you going to use the private key of the wallet **PLEASE DONT USE YOUR MAIN WALLET**

# 1 - Register Your Node

Go to the follwing link. In `Contract` section connect your web3 wallet. In the buttom of the contracts click on `registerNode` insert your wallet address and then `write`.

[https://basescan.org/address/0x8d871ef2826ac9001fb2e33fdd6379b6aabf449c#writeContract](https://basescan.org/address/0x8d871ef2826ac9001fb2e33fdd6379b6aabf449c#writeContract)
![image](https://github.com/0xsaeed/ritual-node/assets/16464391/965d50cd-b8b5-4dbb-869d-cac448283c6a)

> Congratulations. You got hacked and all of your money is gone. Joking:). It's safe

Now you have to wait about `1 hour`. After 1 hour come back to above mentioned contract link and the click on `activateNode` and `write`.

If you dont's see any errors it means everything is ok and you can continiue. If see errors you have to wait and try again.

**Metamask** can not estimate the gas it's recommended to use other wallets like Rabby.

#### Lets run a Ritual node

# 2 - Install Dependecies

Update Packages

```console
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git jq lz4 build-essential cmake perl automake autoconf libtool wget libssl-dev screen git apt-transport-https ca-certificates software-properties-common gnupg lsb-release
```

Now check docker is installed or not by following command

```console
docker -v
```

*if you get version of docker it means it's alreary installed. So you can skip part 3 and jump to part [4](#4---install-ritual)*

# 3 - Install Docker

Uninstall old packages

```console
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

Install

```console
# Add Docker's official GPG key:
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null 
sudo apt update
# Install composer packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
```

Check installation

```console
sudo docker run hello-world
```

![image](https://github.com/0xsaeed/ritual-node/assets/16464391/9f11951b-c37e-43d1-b8f5-65cabdf995a2)

# 4 - Install Ritual

Create a screen session
```console
cd $HOME
screen -S ritual
```

In new screen clone the repo
```console
git clone https://github.com/ritual-net/infernet-container-starter
cd infernet-container-starter
project=hello-world make deploy-container
```
```console
export REGISTER_NODE="0x3B1554f346DFe5c482Bb4BA31b880c1C18412170"
export BASE_RPC_URL="https://base-rpc.publicnode.com"
```
Enter private key of your wallet
```console
read -p "Enter your Private key: " NEW_PRIVATE_KEY

```
Change private key, register node and rpc url in config files:
```console
# Replace rpc_url
sed -i "s|\"rpc_url\": \".*\"|\"rpc_url\": \"$BASE_RPC_URL\"|" ~/infernet-container-starter/deploy/config.json
sed -i "s|\"rpc_url\": \".*\"|\"rpc_url\": \"$BASE_RPC_URL\"|" ~/infernet-container-starter/projects/hello-world/contracts/Makefile
sed -i "s|\"rpc_url\": \".*\"|\"rpc_url\": \"$BASE_RPC_URL\"|" ~/infernet-container-starter/projects/hello-world/container/config.json
sed -i "s|\"rpc_url\": \".*\"|\"rpc_url\": \"$BASE_RPC_URL\"|" ~/infernet-container-starter/projects/hello-world/contracts/script/Deploy.s.sol

# Replace registry_address
sed -i "s/\"registry_address\": \".*\"/\"registry_address\": \"$REGISTER_NODE\"/" ~/infernet-container-starter/projects/hello-world/contracts/Makefile
sed -i "s/\"registry_address\": \".*\"/\"registry_address\": \"$REGISTER_NODE\"/" ~/infernet-container-starter/deploy/config.json
sed -i "s/\"registry_address\": \".*\"/\"registry_address\": \"$REGISTER_NODE\"/" ~/infernet-container-starter/projects/hello-world/container/config.json
sed -i "s/\"registry_address\": \".*\"/\"registry_address\": \"$REGISTER_NODE\"/" ~/infernet-container-starter/projects/hello-world/contracts/script/Deploy.s.sol

# Replace private_key
sed -i "s/\"private_key\": \".*\"/\"private_key\": \"$NEW_PRIVATE_KEY\"/" ~/infernet-container-starter/deploy/config.json
sed -i "s/\"private_key\": \".*\"/\"private_key\": \"$NEW_PRIVATE_KEY\"/" ~/infernet-container-starter/projects/hello-world/contracts/Makefile
sed -i "s/\"private_key\": \".*\"/\"private_key\": \"$NEW_PRIVATE_KEY\"/" ~/infernet-container-starter/projects/hello-world/container/config.json
sed -i "s/\"private_key\": \".*\"/\"private_key\": \"$NEW_PRIVATE_KEY\"/" ~/infernet-container-starter/projects/hello-world/contracts/script/Deploy.s.sol

```
```console
cd deploy
docker compose down
docker compose up -d
```
```console
docker restart infernet-node  &&\
docker restart hello-world &&\
docker restart deploy-redis-1 &&\
docker restart infernet-anvil &&\
docker restart deploy-fluentbit-1
```
Install Fundry
```console
cd $HOME
mkdir foundry
cd foundry
curl -L https://foundry.paradigm.xyz | bash
source ~/.bashrc
foundryup
```
```console
cd $HOME/infernet-container-starter/projects/hello-world/contracts/lib/
rm -r forge-std
rm -r infernet-sdk
forge install --no-commit foundry-rs/forge-std
forge install --no-commit ritual-net/infernet-sdk
```

```console
cd $HOME/infernet-container-starter/
project=hello-world make deploy-contracts
```
Copy  `Deployed SaysHello` address and enter it here
```console
read -p "Enter your Deployed SaysHello address: " SAY_GM
```

```console
sed -i "s/SaysGM saysGm = new SaysGM(.*);/SaysGM saysGm = new SaysGM($SAY_GM);/" ~/infernet-container-starter/projects/hello-world/contracts/script/CallContract.s.sol
```

```console
cd $HOME/infernet-container-starter/
make call-contract project=hello-world
```
List all containers
```console
docker ps -a
```
Get logs of these containers
```console
docker logs infernet-node
```

```console
docker logs infernet-anvil 
```
