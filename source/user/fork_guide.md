# Working with Git
GitHub has a good tutorial on forks and their utilities. It can be found [here][fork]. To summarize:


## 1. Setup Git
if not already done:
* download and install the latest version of Git. Follow the instructions on the Git [website][git download];
* set your username in Git as explained [here][git username];
* set your commit email address in Git as explained [here][git email];


## 2. Fork
Select the repository you wish to fork on the main page of the Breakthrough Energy Sciences' [GitHub] account. Then, click on **Fork** in the top right corner of the page to fork your own copy of the repository to your account. Note that to do so, you need to have a GitHub account.

Create a local clone of your fork with:
```bash
git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
```
where `REPO_NAME` can be `PowerSimData` or `REISE.jl` for example.


## 3. Sync
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


## 4. For Contributors
### Branching
We recommend that you follow the branching model exposed [here][branching]. The main take on this is:
* Branch off from `develop` to create a feature branch:
  ```bash
  git checkout -b YOUR_USERNAME/FEATURE_NAME upstream/develop
  ```
* After syncing your fork, move your branch to the newest `HEAD` of `develop` using:
  ```bash
  git pull --rebase origin develop
  ```
  Note that the more you wait to rebase the more you risk to deal with merge conflicts. We recommend that you rebase onto `develop` frequently.


### Commit message
This is how we structure our commit messages:
```
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```

- `chore`: (updating grunt tasks etc; no production code change)
- `ci`: (changes to the CI configuration files and scripts)
- `docs`: (changes to the documentation)
- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `perf`: (code change that improves performance)
- `refactor`: (refactoring production code, eg. renaming a variable)
- `style`: (formatting, missing semi colons, etc; no production code change)
- `test`: (adding missing tests, refactoring tests; no production code change)

as suggested [here][git message]. Note that you must follow this semantic if you want to merge your branch into our code base. We like to keep our commit history clean.


### Clean up personal commit history
If you did not follow our commit message convention or your commit history is messy, use the interactive rebase tool (see this [website][git rebase] for more details) to revise your commit history. You will be able to reword, drop and meld commits. In short:
```bash
git rebase -i upstream/BRANCH
```
where `BRANCH` is the name of the branch you branched off, e.g., `develop`.


### Pull request


[fork]: https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo
[git download]: https://git-scm.com/downloads
[git username]: https://docs.github.com/en/free-pro-team@latest/github/using-git/setting-your-username-in-git
[git email]: https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address
[GitHub]: https://github.com/Breakthrough-Energy
