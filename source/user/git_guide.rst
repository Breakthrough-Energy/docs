Working with Git
================


Setup Git
---------
If not already done:

+ Download and install the latest version of Git. Follow the instructions on the
  `Git website <https://git-scm.com/downloads>`_
+ Set your `username
  <https://docs.github.com/en/github/getting-started-with-github/setting-your-username-in-git>`_
+ Set your `commit email address
  <https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address>`_


Fork
----
GitHub has a good `tutorial <https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo>`_ on forks and their utilities.


Get the Repository
++++++++++++++++++
Select the repository you wish to fork on the main page of the Breakthrough Energy
Sciences' `GitHub <https://github.com/Breakthrough-Energy>`_ account. Then, click on
**Fork** in the top right corner of the page to fork your own copy of the repository
to your account. Note that to do so, you need to have a GitHub account.

Create a local clone of your fork with:

.. code-block:: console

    git clone https://github.com/YOUR_USERNAME/REPO_NAME.git

where ``REPO_NAME`` can be ``PowerSimData`` or ``REISE.jl`` for example.


Sync your Copy
++++++++++++++
Configure Git to sync your fork with the original repository:

.. code-block:: console

    git remote add upstream https://github.com/Breakthrough-Energy/REPO_NAME.git

and keep it up-to-date with:

.. code-block:: console

    git fetch upstream
    git checkout develop
    git merge upstream/develop


For Contributors
----------------
Branching
+++++++++
We recommend that you follow this `branching model
<https://nvie.com/posts/a-successful-git-branching-model/>`_. The main take on this is:

+ Branch off from ``develop`` to create a feature branch:

  .. code-block:: console

      git checkout -b YOUR_USERNAME/FEATURE_NAME upstream/develop

+ After syncing your fork, move your branch to the newest ``HEAD`` of `develop` using:

  .. code-block:: console

      git pull --rebase origin develop

  Note that the more you wait to rebase the more you risk to deal with merge conflicts.
  We recommend that you rebase onto ``develop`` frequently.


Commit message
++++++++++++++
This is how we structure our commit messages:

.. code-block:: console

    feat: add hat wobble
    ^--^  ^------------^
    |     |
    |     +-> Summary in present tense.
    |
    +-------> Type: chore, docs, feat, fix, refactor, style, or test.


+ ``chore``: (updating grunt tasks etc; no production code change)
+ ``ci``: (changes to the CI configuration files and scripts)
+ ``docs``: (changes to the documentation)
+ ``feat``: (new feature for the user, not a new feature for build script)
+ ``fix``: (bug fix for the user, not a fix to a build script)
+ ``perf``: (code change that improves performance)
+ ``refactor``: (refactoring production code, eg. renaming a variable)
+ ``style``: (formatting, missing semi colons, etc; no production code change)
+ ``test``: (adding missing tests, refactoring tests; no production code change)

as suggested `here <https://seesparkbox.com/foundry/semantic_commit_messages>`_. Note
that you must follow this semantic if you want to merge your branch into our code base.
We like to keep our commit history clean.


Clean up personal commit history
++++++++++++++++++++++++++++++++
If you did not follow our commit message convention or your commit history is messy,
use the interactive rebase tool (see this `website
<https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History>`_ for more details) to
revise your commit history. You will be able to reword, drop and meld commits. In short:

.. code-block:: console

    git rebase -i upstream/BRANCH

where ``BRANCH`` is the name of the branch you branched off, e.g., ``develop``.


Pull request
++++++++++++
PRs are critical to good software development by:

+ Reducing code defects
+ Keeping the team up to date with new code in the code base
+ Teaching each other how to get better at coding.

You will find below the tasks that you have to go through for the PR:

+ Keep your PRs simple (< 400 lines) - Short PRs get reviewed faster, get better
  feedback, and more bugs are caught
+ Make sure your commit history is clean
+ Fill out the form when creating the PR
+ Select one (several) Breakthrough Energy Sciences Team member(s) who is (are)
  familiar with your project for reviewer(s)
+ Set yourself together with the main reviewer as the PR assignees
+ Keep branch up to date during the entire process using:

  .. code-block:: console

      git pull --rebase upstream develop
+ Perform a **merge commit** once your PR is approved
