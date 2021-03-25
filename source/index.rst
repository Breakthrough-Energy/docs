.. Renewable Energy Modeling documentation master file, created by
   sphinx-quickstart on Fri Oct 12 10:42:19 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Facilitating the Energy Transition
==================================

You are familiar with our mission and you just want to install the software, add features or access the documentation? The quick links below will then come up handy:

* :doc:`user/installation_guide`
* :doc:`communication/code_of_conduct`
* :doc:`dev/contribution_guide`
* :doc:`user/git_guide`
* :doc:`communication/project_ideas`
* :ref:`modindex`


Our Mission
-----------
We are a team of research scientists and software engineers who aim to help facilitate the energy transition by developing a model of the U.S electric grid that can integrate clean energy technologies and predict how the system will perform. We belong to the `Breakthrough Energy <https://www.breakthroughenergy.org/>`_ Community and have already conducted several studies that are presented on our `website <https://science.breakthroughenergy.org/>`_. You will find there a nice overview of our goals, the questions we try to answer, the model we developed and cool visualizations that clearly communicate our results.

Our model is open source and is available for download on `GitHub <https://github.com/Breakthrough-Energy>`_. We try here to encourage you to contribute to our project. Since we started this effort, we mainly focused on developing the model and running meaningful scenarios. As a result, our software is not easily installable and deployable. The team has grown and we are now creating a better user experience. While we make this happen, we created this webpage to help you install the software and show you how you can contribute to this effort with the Breakthrough Energy Sciences team. Here is what you will find on `GitHub <https://github.com/Breakthrough-Energy>`_:

+ The :doc:`powersimdata_package` package - we start with this one since it includes the model, i.e., the synthetic U.S. electric grid, and our simulation platform
+ The :doc:`prereise_package` package - you will find there the routines to generate the demand, hydro, solar and wind profiles, a.k.a, the scenario input data
+ The :doc:`postreise_package` package that takes care of the analysis of the scenario output data and the plotting
+ The :doc:`reisejl_package` package - this is our simulation engine

The first three packages are written in Python. The last one, the simulation engine, is written in Julia. You are welcome to contribute to any of these packages. In the next section we present the overall architecture and the installation. We wrote a :doc:`dev/contribution_guide` to help us to work together efficiently.


How it Works
------------
We built a simulation framework in order to perform power flow study in the U.S. electrical grid. The framework and the available features are presented in the README of the :doc:`powersimdata_package` package. There are a few options for using the framework, each with different advantages. We provide more detailed information in the :doc:`installation guide <user/installation_guide>`.

Note that in any case, you should have a `Gurobi <https://www.gurobi.com>`_ license - this is the mathematical solver that our engine use to find power flow solutions to the DC Optimal Power Flow (DCOPF) problems. Note: other solvers will be supported in the future.


Communication Channels
----------------------
`Sign up <http://science.breakthroughenergy.org#get-updates>`_ to our email list to stay updated.
Indicate if you also want to join our Slack workspace to participate in the community.

Please review our :doc:`communication/code_of_conduct` before contributing.


.. toctree::
   :maxdepth: 3
   :hidden:

   user/installation_guide.md
   communication/code_of_conduct
   dev/contribution_guide.md
   user/git_guide.md
   powersimdata_package.md
   prereise_package.md
   postreise_package.md
   reisejl_package.md
