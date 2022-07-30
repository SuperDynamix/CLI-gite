[![npm](https://img.shields.io/npm/dt/cli-gite?style=plastic)](https://www.npmjs.com/package/cli-gite)
[![npm (scoped)](https://img.shields.io/npm/v/cli-gite)](https://www.npmjs.com/package/cli-gite)
[![GitHub](https://img.shields.io/github/license/kl13nt/initrepo)](https://github.com/Mahmoudgalalz/CLI-gite/blob/main/LICENSE)
# introduction
> Hello ppl
This is a smaple CLI to automate ragular git tasks, with many commands.
it's build with bash so it's so compitalbe with liunx, I will provide how to setup it on Windows.
I used NPM package to publish it, you can make your own, copy it and go a head

# Requirements
- NPM
- GPG ( optional ) see how to install it on your OS 
https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key
# installation
## linux
1. `sudo npm i -g cli-gite`
why -g to use it everywhere
2. then install it
`. ~/../../usr/local/lib/node_modules/cli-gite/install.sh`

![Screenshot from 2022-07-29 21-25-10](https://user-images.githubusercontent.com/42272376/181830387-cc807cdd-09dc-4d2e-99ab-c8cd34fd6076.png)

now you can use `gite` :tada:

![Screenshot from 2022-07-29 21-26-11](https://user-images.githubusercontent.com/42272376/181830569-bc992c0a-49d0-49c0-a099-48c4179cf593.png)

## windows
- [ ] not ready, stay tuned...

# Features
- [ :heavy_check_mark: ] creating dir with init git
- [ :heavy_check_mark: ] add remote
- [ :heavy_check_mark: ] adding gpg key to your commits
- [ ] push to any branch without do an adding just put your commit
- [ ] short-hand push
- [ ] auto fetching if there's something to fetch

# Commands
- repo
to init dir with git and remote
- push 
pushing to spcific branch and automate fetching if there.
# Contributing
I welcome all contributions! Feel free to open an issue or submit a PR!
# License
This project is licensed under MIT. Refer to LICENSE for more details.
