# Fork a repo

GitHub has a good tutorial on forks and their utilities. It can be found [here][fork]. To summarize:


## Setup Git
if not already done:
* download and install the latest version of Git. Follow the instructions on the Git [website][git download];
* set your username in Git as explained [here][git username];
* set your commit email address in Git as explained [here][git email];


## Fork
Select the repository you wish to fork on the main page of the Breakthrough Energy Sciences' [GitHub] account. Then, click on **Fork** in the top right corner of the page to fork your own copy of the repository to your account. Note that to do so, you need to have a GitHub account.

Create a local clone of your fork with:
```bash
git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
```
where `REPO_NAME` can be `PowerSimData` or `REISE.jl` for example.


## Sync
Configure Git to sync your fork with the original repository:
```bash
git remote add upstream https://github.com/Breakthrough-Energy/REPO_NAME.git
```
and keep it up-to-date with:
```bash
git fetch upstream
git checkout develop
git merge upstream/develop
```


[fork]: https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo
[git download]: https://git-scm.com/downloads
[git username]: https://docs.github.com/en/free-pro-team@latest/github/using-git/setting-your-username-in-git
[git email]: https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address
[GitHub]: https://github.com/Breakthrough-Energy
