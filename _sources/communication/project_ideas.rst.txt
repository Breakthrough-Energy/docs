:orphan:

Mentored Project Ideas
======================
Breakthrough Energy Sciences (BES) is actively developing tools to carry out realistic power flow study in the U.S. electric grid and thus support Breakthrough Energy's mission of helping the world to get to net-zero greenhouse gases emission.

If you are new to BES, visit our `website <https://science.breakthroughenergy.org>`_ to
learn more about our organization.

There is no shortage of work. If you have some free time and want to contribute to an open source project aiming at decarbonizing the grid, please reach out.


Getting in Touch
----------------
We are active on Slack and this is the best way to reach us. Join us by filling out
this `form <http://science.breakthroughenergy.org/#get-updates>`_, introduce yourself,
discuss your potential project in the #ideas channel, and let us know if you have any
questions. If you need to reach us via email please use sciences@breakthroughenergy.org.

Please review our :doc:`code_of_conduct` before joining the community.


Idea list
---------
You will find below a list of projects we will be excited to work on with you. For each project, we provide prerequisites along with a level of difficulty that should
assist you in your decision. If you can’t find your ideal project on this list but you
have something else in mind that would benefit our open source project, let's discuss it
in the #ideas channel on Slack.

Also keep in mind when planning out your work that for each project we expect you to follow our :doc:`../dev/contribution_guide`.


Project 1. - Simulation Data Manager
++++++++++++++++++++++++++++++++++++
To run energy system simulations we need input data such as electrical demand, hydro
flow, solar irradiance, and wind speed time series data among others. You can read the
`README of the PreREISE package
<https://github.com/Breakthrough-Energy/PreREISE#2-gather-data-for-simulation>`_ for
more details.

Currently the data is collected by using the package when needed. There is still a lot
of manual labor involved in collecting and cleaning the data. Besides that the data
source or APIs may change.

We propose three projects that will improve the user experience when gathering data and
generating time series for our simulation framework. These projects can be carried out
independently.


Project 1a. - Download Manager
******************************
The goal is to encapsulate the existing code for downloading external resources into a
single library and Command Line Interface (CLI).

The result of this project will be a single CLI tool that we can use to download
external resources, either manually, or by integrating into an orchestration/workflow
system such as Apache Airflow.

+ Write a Python library and CLI that downloads external data sources
+ The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**
`Todd <https://github.com/ToddG>`_, `Jon <https://github.com/jon-hagg>`_ and
`Ben <https://github.com/rouille>`_


Project 1b. - Validation Manager
********************************
The goal of this project is to encapsulate the existing validation and cleaning of
external data resources into a single library and CLI.

The result of this project will be a single CLI tool that we can use to validate
external resources, either manually, or by integrating into an orchestration/workflow
system such as Apache Airflow.

+ Write a command-line tool that verifies previously downloaded external data resources
+ The tool ensures that the data is correct (format, data types, value domains, missing
  values, etc.), and either cleans the input data or responds with an error
+ The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**
`Todd <https://github.com/ToddG>`_, `Ben <https://github.com/rouille>`_ and
`Jon <https://github.com/jon-hagg>`_


Project 1c. - Ingestion Pipeline
********************************
The goal of this project is to automate the download, validation, and archival of
external resources using industry standard components such as Apache Airflow, InfluxDB,
Grafana, Blob Stores, etc.

Note that this project will eventually incorporate the work of the Validation Manager
and Download Manager projects. However, each of these projects can proceed in parallel.

+ Write Apache Airflow workflows that periodically
    + Query external data sources for availability
    + Download external data sources
    + Validate and clean the downloaded resources
    + Archive downloaded resources to a blob store
+ Workflows are instrumented with telemetry
+ Telemetry are aggregated in InfluxDB
+ Metrics are displayed in a Grafana dashboard
+ If a data source is down, we throw an alarm

The workflows should be well documented with a focus on code quality, and use
best-of-breed current technology stacks (Apache Airflow, Kubernetes, Helm, Docker,
Python, Grafana, etc.)

**Requirements:**
Docker, Python, Grafana, PAAS, Apache Airflow

**Level:**
Medium to Hard

**Mentor:**
`Todd <https://github.com/ToddG>`_ and `Jon <https://github.com/jon-hagg>`_


Project 2. - Test system for end-to-end testing of the simulation framework
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Use `existing power systems test grids <http://labs.ece.uw.edu/pstca/>`_ in order to
benchmark our simulation framework. Generate input data to feed to the simulation engine
using data science techniques. Write integration tests and produce documentation to
showcase our open source software.

+ Collect data
+ Generate time series for demand, hydro, solar and wind matching the test grid
+ Integrate the test model in our `simulation framework
  <https://github.com/Breakthrough-Energy/PowerSimData>`_
+ Write end-to-end tests
+ Write GitHub actions to test changes of the framework when pushed on GitHub
+ Write documentation for the community

**Requirements:**
Object Oriented Programming in Python, Data analysis/plotting in Python (pandas, numpy, matplotlib, etc.), docker and sphinx

**Level:**
Easy

**Mentor:**
`Ben <https://github.com/rouille>`_ and `Todd <https://github.com/ToddG>`_


Project 3. - Time-Series Modeling of Missing Energy Industry Data and Weather Data
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
A significant barrier to realistic modeling of the power grid is missing data from
public data sources. This project is to use statistical and ML models to fill in missing
energy demand and renewable energy profile information in a way which mimics the real
data as close as possible. In our current data sets of regional energy demand, we have
used averaging of adjacent days to fill in our missing data, as described `here
<https://github.com/Breakthrough-Energy/PreREISE#d-demand-data>`_

We propose the following steps for this project:

+ Understand the data set and the `current methodology
  <https://github.com/Breakthrough-Energy/PreREISE#d-demand-data>`_
+ Literature review to understand prediction models for time series data
+ Collect data to build training/testing sets
+ Evaluate algorithms using cross validation or other metrics
+ Integrate most suitable algorithm(s) in our code base and generate new time series for our power system model

**Requirements:**
Python (pandas), understanding of statistics and ML concepts

**Level:**
Medium

**Mentor:**
`Daniel Muldrew <https://github.com/dmuldrew>`_ and `Ben <https://github.com/rouille>`_


Project 4. - Improve data visualization toolset
+++++++++++++++++++++++++++++++++++++++++++++++
Visualization of complex systems like the power grid is essential for people to be more
engaged and truly understand the impact of different policies. The current
visualizations are split between matplotlib and nivo, each being used by different
teams. The goal of this project is to re-create these visualizations in a single,
unified platform.

+ Convert `matplotlib <https://matplotlib.org/stable/index.html>`_ graphs used by the research team to `plotly <https://plotly.com/python/>`_
+ Convert `nivo <https://nivo.rocks/>`_ graphs used by the website team to plotly
+ Explore the data and generate interesting new graphs

A participant with existing expertise might:
+ Create an extensible python script to automate the creation of plotly graphs that is triggered whenever new data is available from the research team.
+ Stand up a local endpoint to serve as a dashboard completed graphs
+ Generate more complex visualizations such as map graphs with available mapbox tools

**Requirements:**
Python (pandas)

**Level:**
Easy to Medium

**Mentor:**
`Merrielle <https://github.com/merrielle>`_
