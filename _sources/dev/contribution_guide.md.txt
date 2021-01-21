# Contribution Guide
We are thrilled that you have decided to join the Breakthrough Energy Sciences community and help develop and improve this software! We wrote the following guidelines to ensure that your contribution is consistent with our coding standards and hence facilitate its merging into the code base.

There are several ways to contribute to this project. You can report bugs, file feature requests, work on existing issues, etc. In order to keep the code base well structured, documented and testable we have written guidelines. When creating a pull request the following items should be addressed. The reviewer will make sure the guidelines are followed.

Thank you for joining the Breakthrough Energy Sciences community!


## How to Contribute
1. First things first, go to the [Installation Guide](../user/installation_guide.md) to get the software up and running
2. Get familiar with our Git/GitHub workflow (click [here][git guide] for more details)
3. Do you need external data for your feature? (see [this section](#data-intake-procedure)))
4. Develop your feature (go to [this section](#develop-your-feature))
5. Format your code (as explained in [this section](#format-your-code))
6. Document your code (see section dedicated to docstring [here](#document-your-code))
7. Make a pull request (see the guide [here][git guide])


### Data Intake Procedure
Before using any external dataset in your project, we must be absolutely certain that it can be redistributed. This applies to both data obtained via an API and data files that are first downloaded and then uploaded to one of our repository on GitHub or any public storage.

A feature relying on external data will not be merged to the code base unless those can be redistributed; therefore it would be a waste of time to write code centered around an external dataset before knowing if it can be used. For this reason, we ask you to follow the below procedure if you should need external data to develop your feature:

1. Create an issue on GitHub using the ***data intake*** template, available in **PreREISE**, **PowerSimData** and **PostREISE** repositories. Fill out all the fields. Make sure the issue has ***data intake*** as label and that *Daniel Olsen* and *Benjamin Rouillé d'Orfeuil* are assigned to the issue.
2. The Breakthrough Energy Sciences team makes sure the data can be used/redistributed.
3. If the data can be used *Daniel* and/or *Ben* communicate the eventual legal note to be added to the ATTRIBUTION file, located in the root directory of the repository, to the collaborator.
4. *Daniel* and *Ben* will review the ATTRIBUTION file and hence should be added as reviewers of your Pull Request.


### Develop your Feature
First, we recommend reading this [guide](coding_guide.md) to ensure your code is well designed.

Second, test your feature. The unit tests for our code are grouped locally in a **tests** folder located at the same level as the module being tested. All the tests of a package can be run using:
```bash
pytest -m "not integration"
```
at the base directory of the repository. The marker in the above command line is used to deselect tests that rely on internal infrastructure.

Best practices for writing tests with `pytest` and a presentation of the mock objects can be found in our [Testing Guide](testing_guide.md).



### Format your Code
Below are the rules:
* Do not use wildcard imports
* Do use absolute imports
* Code is formatted according to the [black] code style and imports are arranged using `isort`. This is automatically done running:
  ```bash
  tox -e format
  ```

More context and examples about imports can be found [here](import_guide.md).


### Document your Code
All functions and methods of classes must be documented with a [docstring][PEP 257].

There are multiple docstring formats. For this project, we adopted the `Sphinx` docstring format which allows us to generate documentation for the code together with this website.

We present the `Sphinx` docstring format [here](code_documentation.md). It is worth noting that more examples can be found in the code base.


## Communication
Use [GitHub] to report bugs and propose features. Also, do not hesitate to contact us on our Slack workspace or by email at <modelinfo@breakthroughenergy.org> if you should have any questions.


[bes]: https://science.breakthroughenergy.org/
[black]: https://github.com/psf/black
[GitHub]: https://github.com/Breakthrough-Energy
[git guide]: ../user/git_guide
[PEP 8]: https://www.python.org/dev/peps/pep-0008/
[PEP 257]: https://www.python.org/dev/peps/pep-0257/
[pytest]: https://docs.pytest.org/en/stable/getting-started.html
