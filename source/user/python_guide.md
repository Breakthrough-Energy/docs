# Installing Python and its Dependencies
We describe here the Python installation along with all the dependencies required to get up and running.


## Python
We recommend you install Python through [pyenv] which, especially on Mac OS/Linux, allows creating a user level python installation that is isolated from the system packages. The best way to set this up from scratch is to use the automatic installer, then install the version of python you want to use for creating virtual environments and follow their guide for shell customization, which is needed to use `pyenv` by default.

Note that currently we only support Python 3.7 or greater.


## Dependencies
The dependencies should be installed separately from the system-level packages. This can be achieved using virtual environments. There are many options when it comes to python environments, but we follow a few general guidelines. The most important is having a virtual environment for each project, which can be created manually or managed with [pipenv]. Instructions for how to get `pipenv` itself can be found on their website.


### Pipenv
When there is a ***Pipfile*** in the repository, dependencies can be installed using `pipenv` by running:
```bash
pipenv install
```
in that directory. Then, to activate the environment, use:
```bash
pipenv shell
```
If you should need additional packages, those can easily be appended to the environment using `pip`. To illustrate, if you like to work with [Jupyter Notebook][jupyter] to carry out data analysis and make plots, add the package to your environment with:
```bash
pip install jupyter
```


### Requirements File
If there is no ***Pipfile***, the ***requirements.txt*** file can be used to install the dependencies. First, create a virtual environment using [venv], activate it and install the dependencies using:
```bash
pip install -r requirements.txt
```
Here too, additional packages, i.e., not enclosed in ***requirements.txt***, can be installed via `pip` in the virtual environment.


Both methods should install the same set of packages, however, automated testing is done using `pipenv` to ensure reproducibility, so if you encounter package related issues it's recommended to troubleshoot using `pipenv` first.


[jupyter]: https://jupyter.org/
[pipenv]: https://pipenv.pypa.io/en/latest/
[pyenv]: https://github.com/pyenv/pyenv
[venv]: https://docs.python.org/3/library/venv.html
