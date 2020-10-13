# Installation Guide
We present here, the two types of installation of our software, the i) client-server and ii) the laptop/desktop. Also, we go through the system requirements for both installations.


## 1. Client-Server Installation
In that case, you will use [PowerSimData] to create and run scenarios. This is the way we function at Breakthrough Energy Sciences. Here is what needs to be done to use this framework:


### On Laptop/Desktop
+ generate authentication keys (SSH keys) using the `ssh-keygen` program;
+ fork the [PowerSimData](https://github.com/Breakthrough-Energy/PowerSimData) package;
+ create a ***PowerSimData/powersimdata/utility/.server_user*** file enclosing your server username;
+ enter the server address in ***PowerSimData/powersimdata/utility/server_setup.py***;
+ install Python and its dependencies using [pyenv] and [pipenv] as explained in the section dedicated to [Python](#python).

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
* fork the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package on the server into **MODEL_DIR** and install it following the instructions in the README. Note that the Julia Programming Language and Python will need to be installed on the server;

Before using the scenario framework, you need to update the path to the variables in ***PowerSimData/powersimdata/utility/server_setup.py*** file. Note that the **LOCAL_DIR** does not be updated if having a **ScenarioData** directory in your home folder is a good place to store scenario data. You can now create, execute, extract and analyze scenarios. The README of [PowerSimData] goes over these steps.


## 2. Laptop/Desktop Installation
The installation is simpler in that case since there is no communication with the server. You will still need to install Julia and Python:
* install Python as explained in [here](#python).
* install Gurobi.
* fork the [REISE.jl](https://github.com/Breakthrough-Energy/REISE.jl) package and follow the instruction in the README.
* Download the scenario input data from [zenodo] and run a scenario following the instructions in the README. The input data consist of the demand, hydro, solar and wind profiles as `csv` files together with the grid as a `MAT-file`. The files have been produced for a benchmark scenario that the Breakthrough Energy Sciences team has previously ran. There are a couple of things you need to know before starting; i) the model has high spatial and temporal resolution and, consequently, the run time can be quite extensive; ii) it generates a large amount of data. For this reason, we recommend that you don't run the simulation for more than a couple of weeks.

We understand the research is pretty limited with this option. Once again future releases will allow to run on the cloud. Meanwhile, we hope that you will contribute to this project by requesting/developing new features.


## 3. Python <a name="python"></a>
We describe in this section the Python installation along with all the dependencies required to get up and running.


### System requirements
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


[pipenv]: https://docs.pipenv.org/
[pyenv]: https://github.com/pyenv/pyenv
[PreREISE]: ../prereise_package.md
[PowerSimData]: ../powersimdata_package.md
[REISE.jl]: ../reisejl_package.md
[zenodo]: https://zenodo.org/record/3905429
