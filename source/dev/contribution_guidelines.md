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
#### Pipenv
Here goes the installation guideline for the package.
### How to run
#### Pytest



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

#### Pip8/black/tox @jonh

#### Import formatting @ben

#### Code documentation @ben



### Submit your changes

#### Commit messaging
[Semantic commit messages](software_development_guidelines.html#semantic-commit-messages)

#### Push your code

#### Pull request
