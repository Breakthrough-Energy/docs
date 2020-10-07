# Contribution guidelines
Welcome! Thank your for your interest in this project. We recommend that you visit our [website][bes] first if you did not yet have a chance to do so. You will find a nice overview of our goals, the questions we try to answer and visualizations that communicate our results.

There are several ways to contribute to this project. You can report bugs, file feature requests, work on existing issues, etc. To coordinate and structure your contribution to this project we have created these guidelines.

To communicate with the team, use the following communication channels. If you are contributing code to this project read on how to contribute to the code base. We have defined coding standards for the project that include formatting, testing, code documentation as well as basic guidelines how to write testable code. Each section contains links to references that help you familiarize with the topic if this is new to you.

Thank you for contributing to this project.



## Communication channels
### Email
If you have general questions about the model or software development please contact us under <modelinfo@breakthroughenergy.org>

### Report bugs and propose features
Use [GitHub] to report bugs and propose features.


## Working with the code
### Get the repo
##### 1. Fork the repository you want to contribute to.
[Fork a repository][Fork]
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

### How to run
#### [Pytest]
`pytest` is installed as a dependency so all that's needed to run tests is to follow the steps above then activate your virtual environment (if using one, which is recommended) and run:
```
pytest [options]
```
Some tests may require infrastructure that is not publicly available. In this case, passing `-m not integration` to the command should select only the tests that can run without these external dependencies.

#### [Tox]
If a **tox.ini** file exists in the repository, this presents the simplest option for validating changes locally. In this case, after doing:
 ```
 pip install tox
 ```
in your global environment, you can simply run `tox` to use the default workflow. You can also select a subset of checks by running `tox -l` which will output a list of options, then pass those as a comma separated list, e.g.:
```
tox -e pytest,format
```
Note that this may have side effects when it comes to code formatting.


## Contributing to code base
In order for the code to be well structured, documented and tested we want to follow some guidelines. When creating a pull request the following items should be addressed. The reviewer will make sure the guidelines are followed.

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

#### Provide test with your code
Describe minimal requirements for test coverage and provide link to testing guidelines.

For this project we decided to rely upon the `pytest` package for our testing framework. `pytest` also supports the built-in `unittest` framework which we accept as well. Generally `pytest` reduces boilerplate code and uses simple Python asserts, though depending on the complexity of the testing situation, the more rigid structure of `unittest` can sometimes be preferable.

We also use mock objects to help reduce external code dependencies. For instance, here's a sample test of a function to return grid generator ids by plant type which makes use a mock grid data frame:
```python
import pytest

def test_multiple_hierarchical_index():
    # simple grid mock for testing
    mock_grid = MockGrid()
    # get ids for solar plants in the mock grid
    plants = get_plantids_by_resource_type(mock_grid, 'solar')

    expected_plants = [101, 103, 104]
    assert plants == expected_plants

class MockGrid:
    def __init__(self):
        self.plant = pd.DataFrame({'plant_id': [101, 102, 103, 104, 105],
                                   'type': ['solar', 'wind', 'solar', 'solar', 'thermal'],
                                   'zone_id': [1, 2, 3, 1, 3],
                                   'Pmin': [20, 30, 25, 100, 20],
                                   'Pmax': [40, 80, 50, 150, 80]})
        self.plant.set_index('plant_id', inplace=True)
```

The unit tests for our code are grouped locally in a **tests** folder located at the same level as the module being tested. To discover and run our existing repo tests, use the command `pytest` at the base directory of our repos. All test files need to prefixed with **test** to be discoverable by `pytest`. Within the test files themselves test functions should be named `test_{description of the test executed}`, e.g., `test_multiple_hierarchical_index`.

We expect the following types of tests to be included with any code submission:
1. Tests that demonstrate that the expected feature is working. In addition to providing a health monitor for the feature, this will help others understand and modify the code in the future.
2. Tests that check error validation which prevents the feature from failing, i.e. missing or unrealistic function parameters. Particular emphasis is needed for edge cases which are hard to detect in the program output.
3. Every bug fix needs an accompanying test for the problem.

In order to get wider input on useful tests for our project, feel free to propose tests cases in a form other than explicit code, and we will consider them for inclusion.

[Testing Guidelines](testing_guidelines.md)

#### Code style
Code is formatted according to the [black] code style and validated by GitHub before changes are merged. Therefore to avoid manually trying to satisfy the automated check, we recommend installing `black` locally and running it before committing changes. Their site describes editor integrations that may simplify this. Additionally, if using `tox`, the installation and formatting will be handled automatically, so no extra work is necessary.

#### Import formatting
In very short:
* don't use wildcard imports;
* do use absolute imports;
* run `isort` via `tox`.

More context and examples are given in the [Importing Guidelines](import_guidelines.md).




#### Code documentation @ben



### Submit your changes

#### Commit messaging
[Semantic commit messages](software_development_guidelines.html#semantic-commit-messages)

#### Push your code

#### Pull request

[bes]: https://science.breakthroughenergy.org/
[black]: https://github.com/psf/black
[Fork]: https://docs.github.com/en/github/getting-started-with-github/fork-a-repo
[GitHub]: https://github.com/Breakthrough-Energy
[isort]: https://pycqa.github.io/isort/
[PEP 8]: https://www.python.org/dev/peps/pep-0008/
[pytest]: https://docs.pytest.org/en/stable/getting-started.html
[tox]: https://tox.readthedocs.io
