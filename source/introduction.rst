Our Mission
===========

We are a team of research scientists and software engineers who aim to help facilitating the energy transition by developing a model of the U.S electric grid that can integrate clean energy technologies and predict how the system will perform. We belong to the `Breakthrough Energy <https://www.breakthroughenergy.org/>`_ Community and have already conducted several studies that are presented on our `website <https://science.breakthroughenergy.org/>`_. You will find there a nice overview of our goals, the questions we try to answer, the model we developed and cool visualizations that clearly communicate our results.

Our model is open source and is available for download on `GitHub <https://github.com/Breakthrough-Energy>`_. We try here to encourage you to contribute to our project. Since we started this effort, we mainly focused on developing the model and running meaningful scenarios. As a result, our software is not easily installable and deployable. The team has grown and we are now creating a better user experience. While we make this happen, we created this webpage to help you install the software and show you how you can contribute to this effort with the Breakthrough Energy Sciences team. Here is what you will find on `GitHub <https://github.com/Breakthrough-Energy>`_:

+ The :doc:`powersimdata_package` package - we start with this one since it encloses the model, i.e., the synthetic U.S. electric grid, along with our simulation platform
+ The :doc:`prereise_package` package - you will find there the routines to generate the demand, hydro, solar and wind profiles, a.k.a, the scenario input data
+ The :doc:`postreise_package` package that takes care of the analysis of the scenario output data and the plotting
+ The :doc:`reisejl_package` package - this is our simulation engine

The first three packages are written in Python. The last one, the simulation engine, is written in Julia. You are welcome to contribute to any of these packages. In the next section we present the overall architecture and the installation. We wrote a :doc:`dev/contribution_guide` that will help us to work together efficiently.
