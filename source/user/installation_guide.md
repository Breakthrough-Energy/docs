# Installation Guide
Our software is available on [GitHub]. You will need to create an account if you have not done so already.

In the following section, we present the two types of installation of our software, i) the laptop/desktop and ii) the client-server. Also, we go through the system requirements for both installations.


## 1. Laptop/Desktop Installation
The installation is simpler in that case since there is no communication with the server. You will still need to install Julia and Python:
* install Python as instructed [here][python].
* install Gurobi.
* [fork] the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package and follow the instruction in the README.
* Download the scenario input data from [zenodo] and run a scenario following the instructions in the README. The input data consist of the demand, hydro, solar and wind profiles as `csv` files together with the grid as a `MAT-file`. The files have been produced for a benchmark scenario that the Breakthrough Energy Sciences team has previously ran. There are a couple of things you need to know before starting; i) the model has high spatial and temporal resolution and, consequently, the run time can be quite extensive; ii) it generates a large amount of data. For this reason, we recommend that you don't run the simulation for more than a couple of weeks.

We understand the research is pretty limited with this option. Once again future releases will allow to run on the cloud. Meanwhile, we hope that you will contribute to this project by requesting/developing new features.


## 2. Client-Server Installation
In that case, you will use [PowerSimData] to create and run scenarios. This is the way we function at Breakthrough Energy Sciences. Here is what needs to be done to use this framework:


### On Laptop/Desktop
+ generate authentication keys (SSH keys) using the `ssh-keygen` program;
+ [fork] the [PowerSimData](https://github.com/Breakthrough-Energy/PowerSimData) package;
+ create a ***PowerSimData/powersimdata/utility/.server_user*** file enclosing your server username;
+ enter the server address in ***PowerSimData/powersimdata/utility/server_setup.py***;
+ install Python and its dependencies using as instructed [here][python].


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
* [fork] the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package on the server into **MODEL_DIR** and install it following the instructions in the README. Note that the Julia Programming Language and Python will need to be installed on the server;

Before using the scenario framework, you need to update the path to the variables in ***PowerSimData/powersimdata/utility/server_setup.py*** file. Note that the **LOCAL_DIR** does not be updated if having a **ScenarioData** directory in your home folder is a good place to store scenario data. You can now create, execute, extract and analyze scenarios. The README of [PowerSimData] goes over these steps.


## 3. How to Run
### Scenario
Scenarios will be created, executed and extracted differently depending on the installation you selected. For the server-client installation, you will find all the information you need the [PowerSimData] README. The [REISE.jl] README explains the procedure for the laptop/desktop installation.


### Test
#### Pytest
`pytest` is installed as a dependency so all that's needed to run tests is to activate your virtual environment as explained [here][python] (if using one, which is recommended) and run:
```bash
pytest [options]
```
Some tests may require infrastructure that is not publicly available. In this case, passing `-m "not integration"` to the command should select only the tests that can run without these external dependencies. Check the [pytest] website if you want to know more about it.


#### Tox
If a ***tox.ini*** file exists in the repository, this presents the simplest option for validating changes locally. In this case, after doing:
 ```bash
 pip install tox
 ```
in your global environment, you can simply run `tox` to use the default workflow. You can also select a subset of checks by running `tox -l` which will output a list of options, then pass those as a comma separated list, e.g.:
```bash
tox -e pytest,checkformatting
```
We recommend that you check their [website][tox].

[fork]: fork_guide
[GitHub]: https://github.com/Breakthrough-Energy
[PreREISE]: ../prereise_package
[PowerSimData]: ../powersimdata_package
[pytest]: https://docs.pytest.org/en/stable/getting-started.html
[python]: python_guide
[REISE.jl]: ../reisejl_package
[tox]: https://tox.readthedocs.io
[zenodo]: https://zenodo.org/record/3905429
