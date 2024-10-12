# 🐧 Dotfiles
## ⚠️ Warning
These dotfiles were configured to be used with a GNU Linux distribution, in my case Arch Linux. I keep this public repository and set of instructions for my personal convenience alone, and therefore **give absolutely no guarantee these will not brick your machine**.

## 🥾 Bootstrapping the Repo
```bash
curl https://raw.githubusercontent.com/Ezuharad/.dotfiles/main/init.sh | bash -s -- headless
```

`headless` can be swapped for one or more of the following tools or tool groups:

### Tool Groups
- `all`: installs all tool groups.
- `headless`: installs the `git`, `nvim`, `yazi`, and `zsh` tools.
- `extra`: installs the `bat`, `conda`, `docker`, `fastfetch`, `htop`, and `man` tools.

## 🐳 Testing Deployment
Building the test container:
```bash
docker build . -f .test/<DOCKERFILE>
```

Removing used containers and images:
```bash
docker ps -a | cut -f 1 -d " " | tail -n +2 | xargs docker rm
```

```bash
docker image ls | grep \<none\> | tr -s " " | cut -f 3 -d " " | xargs docker rm
```
