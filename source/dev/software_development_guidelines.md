# Index
1. [Working with git](Software-Development-Guidelines#working-with-git)
2. [Semantic Commit Messages](Software-Development-Guidelines#Semantic-Commit-Messages)
3. [Pull Request Etiquette](https://github.com/Breakthrough-Energy/REISE/wiki/Pull-Request-Etiquette)
4. [Writing testable code](https://github.com/intvenlab/REISE/wiki/Writing-testable-code)
5. [Cleaning Code](Software-Development-Guidelines#cleaning-code-before-code-goes-back-into-develop)
6. [Document Code](Software-Development-Guidelines#document-code-before-code-goes-back-into-develop)

# Working with git
We loosely follow this branching model:
https://nvie.com/posts/a-successful-git-branching-model/

The main take on this is:
* Branch off from _develop_ to create a feature branch. 
  - ``` git checkout develop ```
  - ``` git checkout username/featurename ```
* When work done rebase feature branch on _develop_.
  - ``` git pull --rebase origin develop ```
* Create a pull request to merge back into _develop_ (See [Pull Request Etiquette](https://github.com/Breakthrough-Energy/REISE/wiki/Pull-Request-Etiquette)).
* The pull request requires a code review by at least one other person.
* Main reviewer decides on type of merge to be performed.
  * fast-forward(```git merge```) or no-fast-forward ```git merge --no-ff```.
* Clean up git history with ```git rebase -i HEAD~n```.
* Perform designated merge.

More info about merge versus rebase and git history cleanup here:

https://medium.com/@porteneuve/getting-solid-at-git-rebase-vs-merge-4fa1a48c53aa
### Git Training
 - [Git Tutorial](https://www.atlassian.com/git/tutorials)
 - [Interactive git branch](https://learngitbranching.js.org/)
## Semantic Commit Messages

```
feat: add hat wobble
^--^  ^------------^
|     |
|     +-> Summary in present tense.
|
+-------> Type: chore, docs, feat, fix, refactor, style, or test.
```

- `feat`: (new feature for the user, not a new feature for build script)
- `fix`: (bug fix for the user, not a fix to a build script)
- `docs`: (changes to the documentation)
- `style`: (formatting, missing semi colons, etc; no production code change)
- `refactor`: (refactoring production code, eg. renaming a variable)
- `test`: (adding missing tests, refactoring tests; no production code change)
- `chore`: (updating grunt tasks etc; no production code change)

Reference(s):

- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html
- https://gist.github.com/joshbuchea/6f47e86d2510bce28f8e7f42ae84c716
# Pull Request Etiquette
https://github.com/intvenlab/REISE/wiki/Pull-Request-Etiquette
# Writing Testable Code
Please follow these principles when writing code:
https://github.com/intvenlab/REISE/wiki/Writing-testable-code
## Training 
[Intro to Python testing](https://carpentries-incubator.github.io/python-testing/)
# Writing Tests
Add tests when contributing new code. Follow this guideline:
https://github.com/intvenlab/REISE/wiki/Testing-Guidelines-for-Python-and-Matlab
# Cleaning Code (before code goes back into _develop_)
* Remove content that is not necessary.
* Remove paths to external (outside of the package) folders.
* Use relative paths within a package.
* Rename variables, functions, classes… if necessary.
* Use [black](https://github.com/psf/black) to format code. This covers [PEP8](https://www.python.org/dev/peps/pep-0008/) as well as other rules to produce deterministic output.
  * Run via installation in virtual env: `pip install black` and `black .`
  * OR - install externally and have your editor do it automatically.
* Black doesn't sort imports - this can be done with isort:
  * pip install isort
  * isort test.py
* Notebooks go into demo folder only.
# Document Code (before code goes back into develop)
* Description of the method goes into the README.md.
* Describe the operations of functions or classes with docstrings.
  * For docstring use reSt in order to use Sphinx. Here is a [CheatSheet](http://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html#explicit-links).

```
:param arg1: description
:param arg2: description
:type arg1: type description
:type arg1: type description
:return: return description
:rtype: the return type description
:raises keyError: raises an exception
```
* Document section within the code

# General
* Good guide for python development: https://docs.python-guide.org/