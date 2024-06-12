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
| `16GB`      | `4 modern vCPU cores	` | `500GB IOPS-optimized SSD	` |
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

#### Lets run a Ritual node!
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
*if you get version of docker it means it's alreary installed. So you can skip part 3 and jump to part [4](#install-ritual)*

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

```console
git clone https://github.com/ritual-net/infernet-container-starter
cd infernet-container-starter
```


