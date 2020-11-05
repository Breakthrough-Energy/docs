# Contribution Guide
We are thrilled you decided to join the Breakthrough Energy Sciences community and help to develop and improve this software! We wrote the following guidelines to ensure that your contribution is consistent with our coding standards and hence facilitate its merging to the code base.

There are several ways to contribute to this project. You can report bugs, file feature requests, work on existing issues, etc. In order to keep the code base well structured, documented and testable we have written guidelines. When creating a pull request the following items should be addressed. The reviewer will make sure the guidelines are followed.

Thank you for joining the Breakthrough Energy Sciences community!


## How to Contribute
1. First things first, go to the [Installation Guide](../user/installation_guide.md) to get the software up and running
2. Get familiar with our Git/GitHub workflow (click [here][git guide] for more details)
3. Develop your feature (go to [this section](#develop-your-feature))
4. Format your code (as explained in [this section](#format-your-code))
5. Document your code (see section dedicated to docstring [here](#document-your-code))
6. Make a pull request (see the guide [here][git guide])


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

There are multiple docstring formats. For this project, we adopted the `Sphinx` which allows to generate documentation for the code together with this website.

We present the `Sphinx` docstring format [here](code_documentation.md). It worth noting that more examples can be found in the code base.


## Communication
Use [GitHub] to report bugs and propose features. Also, do not hesitate to contact us on our Slack workspace or by email at <modelinfo@breakthroughenergy.org> if you should have any questions.


[bes]: https://science.breakthroughenergy.org/
[black]: https://github.com/psf/black
[GitHub]: https://github.com/Breakthrough-Energy
[git guide]: ../user/git_guide
[PEP 8]: https://www.python.org/dev/peps/pep-0008/
[PEP 257]: https://www.python.org/dev/peps/pep-0257/
[pytest]: https://docs.pytest.org/en/stable/getting-started.html
