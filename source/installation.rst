How it Works
============

We build a simulation framework in order to perform power flow study in the U.S. electrical grid. The framework and the available features are presented in the README of the :doc:`powersimdata_package` package. This the first release and, unfortunately, you won't be able to use this package as the researchers of our team do unless you have the following set up:

+ a server with a Unix-like operating system. The engine must be installed on the server and the client-server communication is done over ssh.
+ a `Gurobi <https://www.gurobi.com>`_ license. This is the mathematical solver that our engine use to find power flow solutions to the DC Optimal Power Flow (DCOPF) problems.

It is also possible to run the simulation on your laptop/desktop without using :doc:`powersimdata_package` package. A Gurobi license is still needed but a set of input data to run a simulation is available for download. The two types of installation are presented in the :doc:`here <user/installation_guide>`.

Note that more user friendly setups will be available in the next releases. `Docker <https://www.docker.com>`_ will be used to package up the code and all its dependencies simplifying installation, development and deployment. Also, we will rely on cloud computing to run scenarios.
