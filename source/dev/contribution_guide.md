# Contribution Guide
We are thrilled you decided to join the Breakthrough Energy Sciences community and help to develop and improve this software! We wrote the following guidelines to ensure that your contribution is consistent with our coding standards and hence facilitate its merging to the code base. But first things first, go to the [Installation Guide][installation] to get the software up and running.

There are several ways to contribute to this project. You can report bugs, file feature requests, work on existing issues, etc. In order to keep the code base well structured, documented and testable we have written guidelines. When creating a pull request the following items should be addressed. The reviewer will make sure the guidelines are followed.

Thank you for joining the Breakthrough Energy Sciences community!


## 1. Communication
Use [GitHub] to report bugs and propose features. Also, do not hesitate to contact us on our Slack workspace or by email at <modelinfo@breakthroughenergy.org> if you should have any questions.


## 2. Coding Standards
### Write Testable Code
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


### Test your Code
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

[Testing Guidelines](testing_guide.md)


### Format your Code
Code is formatted according to the [black] code style and validated by GitHub before changes are merged. Therefore to avoid manually trying to satisfy the automated check, we recommend installing `black` locally and running it before committing changes. Their site describes editor integrations that may simplify this. Additionally, if using `tox` as explained in the [installation], the installation and formatting will be handled automatically, so no extra work is necessary.


### Rules when Importing Packages
In very short:
* don't use wildcard imports;
* do use absolute imports;
* run `isort` via `tox`.

More context and examples can be found [here](import_guide.md).


### Document your Code
All functions and methods of classes must be documented with a [docstring][PEP 257], i.e., a string literal located right below the declaration of the above-mentioned objects. It then becomes the `__doc__` special attribute of that object and can be accessed in a Python interpreter using the Python `help` function.

There are multiple docstring formats. For this project, we adopted the `Sphinx` format since it allows to enable the [Sphinx's autodoc extension][Sphinx autodoc] to generate documentation for the code together with this website. We present the `Sphinx` docstring format [here](code_documentation.md).


## 3. Working with Git
### Sync your Fork
Keep your fork up-to-date with the upstream repository:
```bash
git fetch upstream
git checkout develop
git merge upstream/develop
```


### Branching
We recommend that you follow the branching model exposed [here][branching]. The main take on this is:
* branch off from `develop` to create a feature branch:
  ```bash
  git checkout -b YOUR_USERNAME/FEATURE_NAME upstream/develop
  ```
* after syncing your fork, move your branch to the newest `HEAD` of `develop` using:
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


## 4. Pull request

[bes]: https://science.breakthroughenergy.org/
[black]: https://github.com/psf/black
[branching]: https://nvie.com/posts/a-successful-git-branching-model/
[GitHub]: https://github.com/Breakthrough-Energy
[git message]: https://seesparkbox.com/foundry/semantic_commit_messages
[git rebase]: https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History
[installation]: ../user/installation_guide
[PEP 8]: https://www.python.org/dev/peps/pep-0008/
[PEP 257]: https://www.python.org/dev/peps/pep-0257/
[Sphinx autodoc]: https://www.sphinx-doc.org/en/master/usage/extensions/autodoc.html
