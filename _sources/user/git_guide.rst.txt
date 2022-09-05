Working with Git/GitHub
=======================


Setup Git
---------
If not already done:

+ Download and install the latest version of Git. Follow the instructions on the
  `Git website <https://git-scm.com/downloads>`_
+ Create a GitHub account
+ Set your `username
  <https://docs.github.com/en/github/getting-started-with-github/setting-your-username-in-git>`_
+ Set your `commit email address
  <https://docs.github.com/en/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address>`_


For Users
---------
If you only plan to use the framework, you can clone the repositories using:

.. code-block:: console

    git clone https://github.com/Breakthrough-Energy/REPO_NAME.git

and keep the repository up-to-date via:

.. code-block:: console

    git pull origin develop


For Contributors
----------------
You will work with forks. GitHub has a good `tutorial <https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo>`_ on their utilities.
You will find below a drawing summarizing the workflow.

.. figure:: /_static/img/fork_and_clone.png

    The image is taken from the Peer Production (Open Source Software, Wikipedia, and Beyond) course by James Howison available `here <https://jameshowison.github.io/peer_production_course/pp_syllabus.html>`_.


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

Your local Git client can keep track of many different 'remote' versions of the same
repository. By default, when you clone a repository from Github, the first remote is
named ``origin``. The command above adds another remote and names it ``upstream``. This
will be useful when the upstream version of the repository has code changes, and you
want your local branch to include those changes, so that the only difference between
your branch and the original repository is the code changes for your feature.

Branching
+++++++++
We recommend that you follow this `branching model
<https://nvie.com/posts/a-successful-git-branching-model/>`_. The main take on this is:

+ Branch off from ``develop`` to create a feature branch:

  .. code-block:: console

      git checkout -b YOUR_USERNAME/FEATURE_NAME upstream/develop

+ Keep it up-to-date, i.e., move your branch to the newest ``HEAD`` of ``develop`` via:

  .. code-block:: console

      git pull --rebase upstream develop

  Note that the more you wait to rebase the more you risk having to deal with merge
  conflicts. We recommend that you rebase onto ``develop`` frequently.


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


Don't ``git pull``...
+++++++++++++++++++++
...unless you understand how this command behaves and you're sure that's what you want.

By default, ``git pull`` will perform two distinct actions:

+ Making your local Git client aware of the latest commits in the default remote
  (running ``git fetch``).
+ If there are any differences between the commit history of the currently checked-out
  branch in your local Git client and the latest commits of the corresponding branch in
  the default remote, they will be merged (running ``git merge``).

If the commit histories of the two branches have diverged (i.e. each branch has at least
one commit that's not present in the other), then Git will automatically create a merge
commit. This is contrary to the branching model we typically follow (see the Branching
section above), and will make integrating your code back into our codebase more
difficult. If there are no commits in your local branch that aren't present in the
remote, then the ``git merge`` command will result in a 'fast-forward' merge, where the
commit history of your local branch is identical to the remote (this is good).

Since you probably don't want a new merge commit, if you do want to run ``git pull``, we
encourage it to be run in a non-default mode with different behavior:

+ ``git pull --ff-only``: this will run ``git fetch`` as normal but only execute the
  ``git merge`` step if it can be completed with a fast-forward merge (i.e. without
  creating a merge commit). This will only work if there are no new commits in your
  local branch.
+ ``git pull --rebase``: this will run ``get fetch`` as normal and then attempt to
  rebase any new commits in your local branch (any commits since the history deviated
  from the remote) after the new commits of the remote branch. This will only work if
  the distinct commits in the two versions of the branch don't have any instances of
  editing the same part of the same file.

If neither of these steps can be completed automatically, then your local branch's
commit history will need to be reconciled in a more manual way, e.g. rebasing and
manually resolving conflicts.

For more information, see
`the git pull documentation <https://git-scm.com/docs/git-pull>`_.

Git can be configured to set either of these behaviors as the default behavior when
``git pull`` is called. To configure ``git pull`` to use fast-forward-only by default:
run ``git config pull.ff only``. To instead configure ``git pull`` to use a rebase to
resolve the commit history by default: ``git config pull.rebase true``. By default
``git config`` changes configurations on a per-repository basis, but it can
alternatively configure behavior across all repositories via a ``--global`` flag, e.g.
``git config --global pull.ff only`` or ``git config --global pull.rebase true``.

For more information, see
`the git config documentation <https://git-scm.com/docs/git-config>`_.

Clean up personal commit history
++++++++++++++++++++++++++++++++
If you did not follow our commit message convention or your commit history is messy,
use the interactive rebase tool (see this `website
<https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History>`_ for more details) to
revise your commit history. You will be able to reorder, reword, drop and meld commits.
In short:

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
