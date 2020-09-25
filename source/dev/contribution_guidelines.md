# Contribution guidelines
Welcome! Thank your for your interest in this project. We recommend that you visit our
[website](link_to_website) first if you did not yet have a chance to do so. You will
find there a nice overview of our goals, the questions we try to answer and
visualizations that clearly communicate our results.

There are several ways to contribute to this project. You can report bugs, file feature
requests, work on existing issues, etc. To coordinate and structure your contribution
to this project we have created these guidelines.

To communicate with the team, use the following communication channels. If you are contributing code to this project read on how to contribute to the code base. We have defined coding standards for the project that include formatting, testing, code documentation as well as basic guidelines how to write testable code.
Each section contains links to references that help you familiarize with the topic if this is new to you.
Thank you very much for contributing to this project.



## Communication channels
### Slack
We use Slack for general communication about the project as well as code development. This is the best way to get in touch with individual people within the project to get information.

### Mailing list (Still need to be discussed)
We use the mailing list to keep you up do date with the latest information about releases as well as information about the project

### Report bugs
Use GitHub to report bugs.


## Working with the code
### Get the repo
##### 1. Fork the repository you want to contribute to.
[Fork a repository](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo)
##### 2. Clone your fork
```
git clone https://github.com/<your-username>/repo.git
```
##### 3. Set upstream to project repository
```
git remote add upstream https://github.com/Breakthrough-Energy/repo.git
```
##### 4. Create a feature branch
```
git checkout -b <feature-name>
```
##### 5. Commit and push your work to your fork
##### 6. Prepare for pull request
Rebase
```
git fetch upstream
git rebase upstream/develop
```
##### 7. Clean up personal commit history
```
git rebase -i HEAD~n
```
##### 8. Open a pull request when the feature including tests and documentation is ready.
Provide a short form of the PR guideline

### How to install
#### System requirements
There are many options when it comes to python environments, but we follow a few general guidelines.
The most important is having a virtual environment for each project, which can be created manually or
managed with pipenv. Currently we support python 3.7 or greater. Another tool to consider is [pyenv](https://github.com/pyenv/pyenv)
which, especially on Mac OS/Linux, allows creating a user level python installation that is isolated from
the system packages. The best way to set this up from scratch is to use the automatic installer, then
install the version of python you want to use for creating virtual environments and follow their guide
for shell customization, which is needed to use pyenv by default.

#### Pipenv
When there is a Pipfile in the repository, dependencies can be installed
using [pipenv](https://github.com/pypa/pipenv) by running `pipenv install` in that directory. 
Instructions for how to get pipenv itself can be found on their website. Alternatively, if 
there is a requirements.txt that can be used as well - `pip install -r requirements.txt`. Both
methods should install the same set of packages, however, automated testing is done using pipenv
to ensure reproducibility, so if you encounter package related issues it's recommended to troubleshoot
using pipenv first.

### How to run
#### Pytest
Pytest is installed as a dependency so all that's needed to run tests is to follow the steps above
then activate your virtual environment (if using one, which is recommended) and run `pytest [options]`.
Some tests may require infrastructure that is not publicly available. In this case, passing `-m not integration` 
to the pytest command should select only the tests that can run without these external dependencies.

#### Tox
If a tox.ini file exists in the repository, this presents the simplest option for validating changes locally.
In this case, after doing `pip install tox` in your global environment, you can simply run `tox` to use the default
workflow. You can also select a subset of checks by running `tox -l` which will output a list of options, then
pass those as a comma separated list, e.g. `tox -e pytest,format`. Note: this may have side effects when it comes
to code formatting.


## Contributing to code base
In order for the code to be well structured, documented and tested we want to follow some guidelines.
When creating a pull request the following items should be addressed.
The reviewer will make sure the guidelines are followed.

### Coding standards

#### Write testable code

When contributing code to the project, we ask that you include tests to the best of your ability. Tests can be relatively painless depending on how your code is organized. Here are some guidelines for how to write code that makes testing easy:

* Use the **Single Responsibility Principle** to keep functions simple
    * Functions only have one responsibility and therefore one reason to change
    * Responsibilities can include getting data, processing data, outputting data
* **Avoid mutable global state**, including mutable static properties and singletons
    * Functions that use global state are hard to debug because global state can be changed from anywhere in the codebase
    * Global constants are fine, though be wary as some languages do not enforce them as such
* **Avoid Side effects** such as:
    * modifying a non-local variable
    * modifying a static local variable
    * modifying a mutable argument passed by reference
    * performing I/O
    * calling other side-effect functions
* Use **dependency injection** and **higher order functions** to isolate code from non-deterministic behavior such as:
    * Calls to the OS
    * Calls to random number generators
    * Solution: use dependency injection and higher order functions to isolate code
* **Use pure functions** whenever possible - no side effects or non-deterministic behavior
    * Given the same inputs, the function will always have the same output
* **Impurity is inevitable** - we need to read files, databases, get user input, etc
    * But you can keep impure code as far away from your functions as possible
    * Break hard-coded dependencies so you can swap them out when testing

A more detailed guideline can be found here: [Writing testable code](writing_testable_code.md)

#### Provide test with you code @dmuldrew
Describe minimal requirements for test coverage and provide link to testing guidelines.

Improve [Testing Guidelines](testing_guidelines.md)

#### Code style
Code is formatted according to the [black](https://github.com/psf/black) code style and validated by github before changes are
merged. Therefore to avoid manually trying to satisfy the automated check, we recommend installing `black` locally and running
it before committing changes. Their site describes editor integrations that may simplify this. Additionally, if using `tox`,
the installation and formatting will be handled automatically, so no extra work is necessary.

#### Import formatting @ben

#### Code documentation @ben



### Submit your changes

#### Commit messaging
[Semantic commit messages](software_development_guidelines.html#semantic-commit-messages)

#### Push your code

#### Pull request
