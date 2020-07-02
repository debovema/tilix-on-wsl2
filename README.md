# Tilix on WSL2

## Prerequisites

* [VcXsrv](https://sourceforge.net/projects/vcxsrv)
* [WSL 2](https://docs.microsoft.com/windows/wsl/wsl2-index)

## Installation

### On the Windows host

[Install WSL 2 and Ubuntu 20.04 LTS distro](https://docs.microsoft.com/windows/wsl/install-win10).

```
git clone https://github.com/debovema/tilix-on-wsl2

cd tilix-on-wsl2
```

Create the Tilix shortcut using PowerShell script:
```
powershell.exe "& ""./create-shortcut.ps1"""
```

### In the Linux distro

Install Tilix in the Linux distro:
```
sudo apt-get update

sudo apt-get install -y tilix

ln -s /etc/profile.d/vte-*.sh /etc/profile.d/vte.sh
```

Add the DISPLAY variable and the TILIX fix in ```.zshrc``` (or ```.bashrc```):
```
cat << 'EOF' >> ~/.zshrc
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
EOF
```
