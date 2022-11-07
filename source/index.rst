.. Renewable Energy Modeling documentation master file, created by
   sphinx-quickstart on Fri Oct 12 10:42:19 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.


Facilitating the Energy Transition
==================================
You are familiar with our mission and you just want to install the software, add
features or access the documentation? The quick links below will then come up handy:

* :doc:`user/installation_guide`
* :doc:`communication/code_of_conduct`
* :doc:`dev/contribution_guide`
* :doc:`user/git_guide`
* :doc:`communication/project_ideas`
* :ref:`modindex`


Our Mission
-----------
We are a team of research scientists and software engineers who aim to help facilitate
the energy transition by developing a model of the U.S electric grid that can integrate
clean energy technologies and predict how the system will perform. We belong to the
`Breakthrough Energy <https://www.breakthroughenergy.org/>`_ network and have already
conducted several studies that are presented on our `website
<https://science.breakthroughenergy.org/>`_. You will find there a nice overview of our
goals, the questions we try to answer, the model we developed and cool visualizations
that clearly communicate our results.

Our model is open source (`MIT <https://en.wikipedia.org/wiki/MIT_License>`_)
and available for download on `GitHub <https://github.com/Breakthrough-Energy>`_.
Our data is also open source (`CC‑BY‑4.0
<https://en.wikipedia.org/wiki/Creative_Commons_license>`_) and downloadable from
Zenodo. We try here to encourage you to contribute to our project. Since we started this
effort, we mainly focused on developing the model and running meaningful scenarios. As
a result, our software is not easily installable and deployable. The team has grown and
we are now creating a better user experience. While we make this happen, we created
this webpage to help you install the software and show you how you can contribute to
this effort with the Breakthrough Energy Sciences team. Here is what you will find on
GitHub:

- The `PowerSimData <https://github.com/Breakthrough-Energy/PowerSimData>`_ package -
  we start with this one since it includes the model, i.e., the synthetic U.S. electric
  grid, and our simulation platform
- The `PreREISE <https://github.com/Breakthrough-Energy/PreREISE>`_ package - you will
  find there the routines to generate
  the demand, hydro, solar and wind profiles, a.k.a, the scenario input data
- The `PostREISE <https://github.com/Breakthrough-Energy/PostREISE>`_ package that
  handles the analysis of the scenario output data and the plotting
- The `REISE.jl <https://github.com/Breakthrough-Energy/REISE.jl>`_ package - this is
  our simulation engine

.. mermaid::

    flowchart TD
        subgraph M[PreREISE]
        B["Prepare time series .csv's
        and other data input"]
        end

        subgraph N[PowerSimData]
        C[Create] --> D[Execute]
        D
        E[Analyze]
        end

        B ----> N
        subgraph O[REISE.jl]
        F["Simulation Engine to translate
        the optimization problem to solver"]
        end
        D --".mat and .csv"--> O
        O --".pkl"--> E
        subgraph P[PostREISE]
        G["Optional output analysis and plotting"]
        end
        E ----> P

The first three packages are written in Python. The last one, the simulation engine, is
written in Julia. You are welcome to contribute to any of these packages. In the next
section we present the overall architecture and the installation. We wrote a
:doc:`dev/contribution_guide` to help us to work together efficiently.


How it Works
------------
We built a simulation framework in order to perform power flow study in the U.S.
electrical grid. The framework and the available features are presented in the
:doc:`powersimdata/index` tutorial. There are a few options for using the framework,
each with different advantages. We provide more detailed information in the
:doc:`user/installation_guide`.

Note that in any case, you should have a `Gurobi <https://www.gurobi.com>`_ license -
this is the mathematical solver that our engine use to find power flow solutions to the
DC Optimal Power Flow (DCOPF) problems. Note: other solvers will be supported in the
future.


Communication Channels
----------------------
`Sign up <http://science.breakthroughenergy.org#get-updates>`_ to our email list to stay
updated. Indicate if you also want to join our Slack workspace to participate in the
community.

Please review our :doc:`communication/code_of_conduct` before contributing.


.. toctree::
   :maxdepth: 3
   :hidden:
   :numbered:

   user/installation_guide
   communication/code_of_conduct
   dev/contribution_guide
   user/git_guide
   powersimdata/index
   prereise/index
   postreise/index
   reisejl/index
