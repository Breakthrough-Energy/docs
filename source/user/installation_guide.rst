Installation Guide
==================
Our software is available on `GitHub`_. You will need to create an account if you have
not done so already.

There are multiple ways to install this software. For most people, using docker will be
the easiest and fastest way to run a simulation. We recommend using a commercial solver
with this framework, but not all license types are compatible with docker. If using
such a license, this software can also be installed and run natively with slightly more
effort.

This framework can also be installed in a client-server configuration. This is most
useful for groups where multiple people will want to run simulations and access results
on an appropriately-sized central server. In this case, both the server and each user's
local environment will need to be configured accordingly.

Using docker
------------
This option enables running the full framework in containers, colocated on the same
machine. In this case, the only system requirement is to have `docker`_,
(including docker-compose) installed.

All the data and configuration needed to run a simulation are located in the `plug`_
repository, along with additional guidance about compatible commercial solver licenses.
There are also usage examples.

Natively
--------
The framework can be used natively after some initial setup. This first requires the
following:

+ Install Julia 1.5 and create an environment as described in the REISE.jl
  :doc:`../reisejl/installation` notes
+ Clone `PowerSimData`_ and `REISE.jl`_ (preferably in the same directory)
+ Install the solver you wish to use within your Julia environment (either Gurobi or
  GLPK)

Create a virtualenv and activate it using the following. For the activate step, it's
important to follow exactly (instead of using the ``source`` command) - this ensures
that ``sys.executable`` will give back the python interpreter within this environment.

.. code-block:: console

    python -m venv .env
    . .env/bin/activate

Install PowerSimData dependencies into a virtual environment, along with the
requirements for REISE.jl:

.. code-block:: console

    pip install -r requirements.txt
    pip install -r /path/to/REISE.jl/requirements.txt

Some one time configuration is necessary as well. Within your PowerSimData repository,
create a config file called ``config.ini`` with the following contents

.. code-block:: console

    [PowerSimData]
    DEPLOYMENT_MODE = 2
    ENGINE_DIR = /full/path/to/REISE.jl
    JULIA_PROJECT = /full/path/to/REISE.jl

The last step is provisioning a directory where data will be stored. Copy paste this
command (still in your virtualenv):

.. code-block:: console

    python -c "from powersimdata.utility.config import LocalConfig; LocalConfig().initialize()"


You should now be able to run a scenario, per the following section.
Note: when doing so, your working directory should be the root of the PowerSimData
repository.

Client-Server Installation
--------------------------
Here is what needs to be done to use this framework.


On Laptop/Desktop
+++++++++++++++++
+ Fork `PowerSimData <https://github.com/Breakthrough-Energy/PowerSimData>`_ (see our
  :doc:`git_guide` guide to set this up)
+ Generate authentication keys (SSH keys) using the ``ssh-keygen`` program
+ Create a **PowerSimData/powersimdata/utility/.server_user** file enclosing your
  username on the server if different from your local username
+ Edit **PowerSimData/powersimdata/utility/server_setup.py** file as follows:
    + Set ``SERVER_ADDRESS``: your server address
    + Set ``DATA_ROOT_DIR``: root of the file system
    + Set ``EXECUTE_DIR``: scenario inputs and outputs will be stored there - note that
      these files are temporary files and are not necessary to load an already ran
      scenario
    + Set ``INPUT_DIR``: all scenario inputs are stored there - after the scenario has
      finished running and the temporary data are extracted, the **MAT-file** that
      encloses the grid used for the scenario is stored there along with the **pickle**
      file enclosing the change table listing the transformation applied to the
      original grid
    + Set ``OUTPUT_DIR``: all scenario outputs are stored there after being extracted -
      the list of output data is given in the :doc:`../powersimdata/index` tutorial
    + Set ``MODEL_DIR``: this directory encloses the simulation engine
    + Set ``LOCAL_DIR``: this directory will enclose your local file system
    + Note that ``BACKUP_DATA_ROOT_DIR`` does not need to be set unless you have a
      backup storage mounted on you server that you plan to use to transfer scenario
      data.
+ Install Python and its dependencies as instructed in our :doc:`python_guide` guide
+ Fork `PostREISE <https://github.com/Breakthrough-Energy/PostREISE>`_ to later analyze
  and plot scenario data.


On Server
+++++++++
+ Copy the generated public key in your **~/.ssh/authorized_keys** file
+ Install Julia, Python and Gurobi
+ Create the above mentioned directories, i.e., **DATA_ROOT_DIR**, **EXECUTE_DIR**,
  **INPUT_DIR**, **OUTPUT_DIR** and **MODEL_DIR**
+ Create the **ScenarioList.csv** and **ExecuteList.csv** files in **DATA_ROOT_DIR**
  on the server following templates in **powersimdata/utility/templates/**
+ Fork `REISE.jl`_ into **MODEL_DIR**
  and install it following the instructions located in the :doc:`../reisejl/index`
  installation guide



How to Run Scenario
-------------------
Follow the instructions in the :doc:`../powersimdata/scenario` tutorial.


.. _GitHub: https://github.com/Breakthrough-Energy
.. _plug: https://github.com/Breakthrough-Energy/plug
.. _REISE.jl: https://github.com/Breakthrough-Energy/REISE.jl
.. _PowerSimData: https://github.com/Breakthrough-Energy/PowerSimData
.. _docker: https://docs.docker.com/get-docker/
