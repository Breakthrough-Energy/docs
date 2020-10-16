# Installation Guide
Our software is available on [GitHub]. You will need to create an account if you have not done so already.

In the following section, we present the two types of installation of our software, i) the laptop/desktop and ii) the client-server. Also, we go through the system requirements for both installations.


## 1. Laptop/Desktop Installation
The installation is simpler in that case since there is no communication with the server. You will still need to install Julia and Python:
* install Python as explained in [here](#installing-python).
* install Gurobi.
* [fork](#fork-a-repo) the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package and follow the instruction in the README.
* Download the scenario input data from [zenodo] and run a scenario following the instructions in the README. The input data consist of the demand, hydro, solar and wind profiles as `csv` files together with the grid as a `MAT-file`. The files have been produced for a benchmark scenario that the Breakthrough Energy Sciences team has previously ran. There are a couple of things you need to know before starting; i) the model has high spatial and temporal resolution and, consequently, the run time can be quite extensive; ii) it generates a large amount of data. For this reason, we recommend that you don't run the simulation for more than a couple of weeks.

We understand the research is pretty limited with this option. Once again future releases will allow to run on the cloud. Meanwhile, we hope that you will contribute to this project by requesting/developing new features.


## 2. Client-Server Installation
In that case, you will use [PowerSimData] to create and run scenarios. This is the way we function at Breakthrough Energy Sciences. Here is what needs to be done to use this framework:


### On Laptop/Desktop
+ generate authentication keys (SSH keys) using the `ssh-keygen` program;
+ [fork](#fork-a-repo) the [PowerSimData](https://github.com/Breakthrough-Energy/PowerSimData) package;
+ create a ***PowerSimData/powersimdata/utility/.server_user*** file enclosing your server username;
+ enter the server address in ***PowerSimData/powersimdata/utility/server_setup.py***;
+ install Python and its dependencies using [pyenv] and [pipenv] as explained in the section dedicated to [Python](#installing-python).


### On Server
* copy the generated public key in your ***~/.ssh/authorized_keys*** file.
* install Gurobi.
* create the following directories:
  * **DATA_ROOT_DIR**: the root of the file system.
  * **EXECUTE_DIR**: scenario inputs and outputs will be stored there. Note that these files are temporary files and are not necessary to load an already ran scenario.
  * **BASE_PROFILE_DIR**: the demand, hydro, solar and wind profiles are stored there. These can be generated using the [PreREISE] package or by downloading them on [zenodo]. Anyway, you will need to follow the naming convention described in the README of [PreREISE].
  * **INPUT_DIR**: the input data of the scenario. After the scenario has finished running and the temporary data are extracted, the `MAT-file` that encloses the grid used for the scenario is stored there. The so called change table listing the transformation applied to the original grid is stored there too as a `pickle` file.
  * **OUTPUT_DIR**: all the scenario outputs are stored in this directory after being extracted. The list of scenario output data is given in the README of [PowerSimData].
  * **MODEL_DIR**: this folder encloses the simulation engine.
* create the ***ScenarioList.csv*** and ***ExecuteList.csv*** files in **DATA_ROOT_DIR**.
* [fork](#fork-a-repo) the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package on the server into **MODEL_DIR** and install it following the instructions in the README. Note that the Julia Programming Language and Python will need to be installed on the server;

Before using the scenario framework, you need to update the path to the variables in ***PowerSimData/powersimdata/utility/server_setup.py*** file. Note that the **LOCAL_DIR** does not be updated if having a **ScenarioData** directory in your home folder is a good place to store scenario data. You can now create, execute, extract and analyze scenarios. The README of [PowerSimData] goes over these steps.


## 3. Installing Python
We describe in this section the Python installation along with all the dependencies required to get up and running.


### System Requirements
There are many options when it comes to python environments, but we follow a few general guidelines. The most important is having a virtual environment for each project, which can be created manually or managed with `pipenv`. Currently we support python 3.7 or greater. Another tool to consider is `pyenv` which, especially on Mac OS/Linux, allows creating a user level python installation that is isolated from the system packages. The best way to set this up from scratch is to use the automatic installer, then install the version of python you want to use for creating virtual environments and follow their guide for shell customization, which is needed to use `pyenv` by default.


### Pipenv
When there is a ***Pipfile*** in the repository, dependencies can be installed using `pipenv` by running:
```
pipenv install
```
in that directory. Instructions for how to get `pipenv` itself can be found on their [website][pipenv]. Alternatively, if there is a ***requirements.txt*** that can be used as well:
```
pip install -r requirements.txt
```
Both methods should install the same set of packages, however, automated testing is done using `pipenv` to ensure reproducibility, so if you encounter package related issues it's recommended to troubleshoot using `pipenv` first.


## 4. Fork a repo
GitHub has a good tutorial on forks and their utilities. It can be found [here][fork]. To summarize:
* if not already done, setup Git:
  - download and install the latest version of Git. Follow the instructions on the Git [website][git download];
  - set your username in Git as explained [here][git username];
  - set your commit email address in Git as explained [here][git email];
* on GitHub, navigate to the repository page and click **Fork**;
* keep your fork synced by:
  - creating a local clone of your fork:
    ```
    git clone https://github.com/YOUR_USERNAME/REPO_NAME.git
    ```
    where `REPO_NAME` can be `PowerSimData` or `REISE.jl` for example.
  - configuring Git to sync your fork with the original repository:
    ```
    git remote add upstream https://github.com/Breakthrough-Energy/YOUR_FORK.git
    ```
  - keep your fork up-to-date with the upstream repository:
    ```
    git fetch upstream
    git checkout develop
    git merge upstream/develop
    ```


## 5. How to Run
### Scenario
Scenarios will be created, executed and extracted differently depending on the installation you selected. For the server-client installation, you will find all the information you need the [PowerSimData] README. The [REISE.jl] README explains the procedure for the laptop/desktop installation.


### Test
#### Pytest
`pytest` is installed as a dependency so all that's needed to run tests is to activate your virtual environment as explained [previously](#pipenv) (if using one, which is recommended) and run:
```
pytest [options]
```
Some tests may require infrastructure that is not publicly available. In this case, passing `-m not integration` to the command should select only the tests that can run without these external dependencies. Check the [pytest] website if you want to know more about it.


#### Tox
If a ***tox.ini*** file exists in the repository, this presents the simplest option for validating changes locally. In this case, after doing:
 ```
 pip install tox
 ```
in your global environment, you can simply run `tox` to use the default workflow. You can also select a subset of checks by running `tox -l` which will output a list of options, then pass those as a comma separated list, e.g.:
```
tox -e pytest,checkformatting
```
We recommend that you check their [website][tox].


[fork]: https://docs.github.com/en/free-pro-team@latest/github/getting-started-with-github/fork-a-repo
[git download]: https://git-scm.com/downloads
[git username]: https://docs.github.com/en/free-pro-team@latest/github/using-git/setting-your-username-in-git
[git email]: https://docs.github.com/en/free-pro-team@latest/github/setting-up-and-managing-your-github-user-account/setting-your-commit-email-address
[GitHub]: https://github.com/Breakthrough-Energy
[pipenv]: https://pipenv.pypa.io/en/latest/
[pyenv]: https://github.com/pyenv/pyenv
[PreREISE]: ../prereise_package.md
[PowerSimData]: ../powersimdata_package.md
[pytest]: https://docs.pytest.org/en/stable/getting-started.html
[REISE.jl]: ../reisejl_package.md
[tox]: https://tox.readthedocs.io
[zenodo]: https://zenodo.org/record/3905429
