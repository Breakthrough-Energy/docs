Installation Guide
==================
Our software is available on `GitHub`_. You will need to create an account if you have
not done so already.

In the following section, we present the two types of installation of our software, i)
client-server and ii) docker. Also, we go through the system requirements for these
installations.


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


On Server
+++++++++
+ Copy the generated public key in your **~/.ssh/authorized_keys** file
+ Install Julia, Python and Gurobi
+ Create the above mentioned directories, i.e., **DATA_ROOT_DIR**, **EXECUTE_DIR**,
  **INPUT_DIR**, **OUTPUT_DIR** and **MODEL_DIR**
+ Create the **ScenarioList.csv** and **ExecuteList.csv** files in **DATA_ROOT_DIR**
  on the server following templates in **powersimdata/utility/templates/**
+ Fork `REISE.jl <https://github.com/Breakthrough-Energy/REISE.jl>`_ into **MODEL_DIR**
  and install it following the instructions located in the :doc:`../reisejl_package`
  README


Using docker
------------
This option enables running the full framework in containers, colocated on the same
machine. In this case, the only system requirement is to have `docker`_,
(including docker-compose) installed.

All the data and configuration needed to run a simulation are located in the `plug`_
repository, along with usage examples.


How to Run Scenario
-------------------
Follow the instructions in the :doc:`../powersimdata/scenario` tutorial.


.. _GitHub: https://github.com/Breakthrough-Energy
.. _plug: https://github.com/Breakthrough-Energy/plug
.. _docker: https://docs.docker.com/get-docker/
