# Google Summer of Code 2021
Breakthrough Energy Sciences (BES) has applied to serve as a mentoring organization for Google Summer of Code (GSoC).
The GSoC program offers each student a stipend to work on open source code during the summer.
If you are interested in the program you can find more information [here](https://summerofcode.withgoogle.com/).

If you are a student and new to GSoC, please read the following [guide](https://google.github.io/gsocguides/student/).
If you are new to BES, [visit our website](https://science.breakthroughenergy.org/) to learn more about our organization.


## Community and Communication
We are active on Slack and this is the best way to reach us.
[Join us here](http://science.breakthroughenergy.org/#get-updates), introduce yourself, discuss your potential project in the #ideas channel, and let us know if you have any questions.

If you need to reach us via email please use sciences@breakthroughenergy.org

Please review our [code of conduct](code_of_conduct.md) before joining the community.

## Application
If you are a student and applying for GSoC find bellow the idea list and explore the projects we would like to accomplish with you this summer.

When applying please provide:

- A project proposal in markdown following the [Elements of a Quality Proposal guide](https://google.github.io/gsocguides/student/writing-a-proposal#elements-of-a-quality-proposal)
- Motivation for why you choose this particular project
- Your resume with relevant experience in PDF format

## Idea list
For each project, we provide prerequisites along with a level of difficulty that should assist you in your decision.
If you can’t find your ideal project on this list
but you have something else in mind that would benefit our open source project,
let's discuss it in the #ideas channel on Slack.

Also keep in mind when planning out your work that for each project we expect you to follow our [contribution guide](contribution_guide.md).

### Project 1. - Simulation Data Manager
To run energy system simulations we need input data such as electrical demand, hydro flow, solar irradiance, and wind speed time series data among others. You can read the  the [README of the PreREISE package](https://github.com/Breakthrough-Energy/PreREISE#2-gather-data-for-simulation) for more details.

Currently the data is collected by using the package when needed. There is still a lot of manual labor involved in collecting and cleaning the data. Besides that the data source or APIs may change.

We propose three projects that will improve the user experience when gathering data and generating time series for our simulation framework. These projects can be carried out independently.

#### Project 1a. - Download Manager
The goal is to encapsulate the existing code for downloading external resources into a single library and Command Line Interface (CLI).

The result of this project will be a single CLI tool that we can use to download external resources, either manually, or by integrating into an orchestration/workflow system such as Apache Airflow.

- Write a Python library and CLI that downloads external data sources
- The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**

#### Project 1b. - Validation Manager
The goal of this project is to encapsulate the existing validation and cleaning of external data resources into a single library and CLI.

The result of this project will be a single CLI tool that we can use to validate external resources, either manually, or by integrating into an orchestration/workflow system such as Apache Airflow.

- Write a command-line tool that verifies previously downloaded external data resources
- The tool ensures that the data is correct (format, data types, value domains, missing values, etc.), and either cleans the input data or responds with an error
- The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**

#### Project 1c. - Ingestion Pipeline
The goal of this project is to automate the download, validation, and archival of external resources using industry standard components such as Apache Airflow, InfluxDB, Grafana, Blob Stores, etc.

Note that this project will eventually incorporate the work of the Validation Manager and Download Manager projects. However, each of these projects can proceed in parallel.

- Write Apache Airflow workflows that periodically
    - Query external data sources for availability
    - Download external data sources
    - Validate and clean the downloaded resources
    - Archive downloaded resources to a blob store
- Workflows are instrumented with telemetry
- Telemetry are aggregated in InfluxDB
- Metrics are displayed in a Grafana dashboard
- If a data source is down, we throw an alarm

The workflows should be well documented with a focus on code quality, and use best-of-breed current technology stacks (Apache Airflow, Kubernetes, Helm, Docker, Python3, Grafana, etc.)

**Requirements:**
Docker, Python, Grafana, PAAS, Apache Airflow

**Level:**
Medium to Hard

**Mentor:**
[Todd](https://github.com/ToddG)
[Jon](https://github.com/jon-hagg)

### Project 2. - Test system for end-to-end testing of the simulation framework
Use [existing power systems test grids](http://labs.ece.uw.edu/pstca/) in order to to benchmark our simulation framework
Generate input data to feed to the simulation engine using data science techniques.
Write integration tests and produce documentation to showcase our open source software.

- Collect data (python scripting)
- Generate time series for demand, hydro, solar and wind matching the test grid (python data analysis)
- Integrate the test model in our [simulation framework](https://github.com/Breakthrough-Energy/PowerSimData) (python)
- Write end-to-end tests (in docker container)
- Write GitHub actions to test changes of the framework when pushed on GitHub
- Write documentation for the community (sphinx)

**Requirements:**
Object Oriented Programming in Python, Data analysis/plotting in Python (pandas, numpy, matplotlib, etc.) and docker

**Level:**
Easy

**Mentor:**
[Ben](https://github.com/rouille)
[Todd](https://github.com/ToddG)

### Project 3. - Time-Series Modeling of Missing Energy Industry Data and Weather Data
A significant barrier to realistic modeling of the power grid is missing data from public data sources.
This project is to use statistical and ML models to fill in missing energy demand and renewable energy profile information in a way which mimics the real data as close as possible.
In our current data sets of regional energy demand, we have used averaging of adjacent days to fill in our missing data, as described [here](https://github.com/Breakthrough-Energy/PreREISE#d-demand-data)

We propose the following steps for this project:

- Understand the data set and the [current methodology](https://github.com/Breakthrough-Energy/PreREISE#d-demand-data)
- Literature review to understand prediction models for time series data
- Collect data to build training/testing sets
- Evaluate algorithms using cross validation or other metrics
- Integrate most suitable algorithm(s) in our code base and generate new time series for our power system model

**Requirements:**
Python, Pandas, understanding of statistics and ML concepts

**Level:**
Medium

**Mentor:**
[Daniel Muldrew](https://github.com/dmuldrew)

### Project 4. - Improve data visualization toolset
Visualization of complex systems like the power grid is essential for people to be more engaged and truly understand the impact of different policies. 
The current visualizations are split between matplotlib and nivo, each being used by different teams.
The goal of this project is to re-create these visualizations in a single, unified platform.

- Convert [matplotlib](https://matplotlib.org/stable/index.html) graphs used by the research team to [plotly](https://plotly.com/python/)
- Convert [nivo](https://nivo.rocks/) graphs used by the website team to plotly
- Explore the data and generate interesting new graphs

A participant with existing expertise might:
- Create an extensible python script to automate the creation of plotly graphs that is triggered whenever new data is availible from the research team.
- Stand up a local endpoint to serve as a dashboard completed graphs
- Generate more complex visualizations such as map graphs with availible mapbox tools

**Requirements:**
Python, Pandas

**Level:**
Easy - Medium

**Mentor:**
[Merrielle](https://github.com/merrielle)
