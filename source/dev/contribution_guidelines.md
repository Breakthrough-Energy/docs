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

#### Write testable code @Merrielle
Provide short form of [Writing testable code](writing_testable_code.md) and link to the long form

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
