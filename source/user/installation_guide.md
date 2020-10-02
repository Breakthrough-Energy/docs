### Installation Guide
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