# Google Summer of Code 2021
Breakthrough Energy Sciences (BES) has applied to serve as a mentoring organization for Google Summer of Code (GSoC).
The GSoC program offers each student a stipend to work on open source code during the summer. 
If you are interested in the program [here](https://summerofcode.withgoogle.com/) you can find more information.

If you are a student and new to GSoC, please read the following [guide](https://google.github.io/gsocguides/student/).
If you are new to BES, look [here](https://science.breakthroughenergy.org/) to learn more about our organization.


## Community and Communication
We are active on Slack and this is the best way to reach us.
[Join us here](http://science.breakthroughenergy.org/#get-updates), introduce yourself, discuss your potential project in the #ideas channel, and let us know if you have any questions.

If you need to reach us via email, here you go: sciences@breakthroughenergy.org

Please review our [code of conduct](code_of_conduct.md) before joining the community.
## Application
If you are a student and applying for GSoC find bellow the idea list and explore the projects we would like to accomplish with you this summer.

When applying please provide:

- A project proposal in markdown following the [Elements of a Quality Proposal guide](https://google.github.io/gsocguides/student/writing-a-proposal#elements-of-a-quality-proposal)
- Motivation why you choose this particular project?
- Your resume with relevant experience in PDF format
## Idea list
If you can’t find your ideal project on this list,
but you have something else in mind that would enhance our open source project,
let's discuss it the #ideas channel on Slack.
For each project we provided various scales to adapt to your skill, ambition or individual situation.

Also keep in mind when planning out your work that for each project we expect you to follow our [contribution guide](contribution_guide.md).
### Project 1. - Simulation Data Download Manager
To run energy system simulations we need input data such as electrical demand, hydro flow, solar irradiance, and wind speed time series data among others. See here for [more details](https://github.com/Breakthrough-Energy/PreREISE#2-gather-data-for-simulation). 
Currently the data is collected by using the package when needed. There is still a lot of manual labor involved in collecting and cleaning the data. Besides that the data source or API’s may change.

The goal of this project is to encapsulate the existing code for downloading external resources into a single library and Command Line Interface (CLI).
The result of this project will be a single CLI tool that we can use to download external resources, either manually, or by integrating into an orchestration/workflow system such as Apache Airflow.

- Write a Python library and CLI that downloads external data sources
- The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**

### Project 2. - Simulation Data Validation Manager 
To run energy system simulations we need input data such as electrical demand, hydro flow, solar irradiance, and wind speed time series data among others. See here for [more details](https://github.com/Breakthrough-Energy/PreREISE#2-gather-data-for-simulation). 
Currently the data is collected by using the package when needed. There is still a lot of manual labor involved in collecting and cleaning the data. Besides that the data source or API’s may change.

The goal of this project is to encapsulate the validation and cleaning of external data resources in a into a single library and CLI. 
The result of this project will be a single CLI tool that we can use to validate external resources, either manually, or by integrating into an orchestration/workflow system such as Apache Airflow.

- Write a command-line tool that verifies previously downloaded external data resources
- The tool ensures that the data is correct (format, data types, value domains, missing values, etc.), and either cleans the input data or responds with an error
- The tool should be well documented with a focus on code quality

**Requirement:** Python

**Level:** Easy

**Mentor:**

### Project 3. - Simulation Data Ingestion Pipeline
To run energy system simulations we need input data such as electrical demand, hydro flow, solar irradiance, and wind speed time series data among others. See [here](https://github.com/Breakthrough-Energy/PreREISE#2-gather-data-for-simulation) for more details . 
Currently the data is collected by using the package when needed. There is still a lot of manual labor involved in collecting and cleaning the data. Besides that the data source or API’s may change.

The goal of this project is to automate the download, validation, and archival of external resources using industry standard components such as Apache Airflow, InfluxDB, Grafana, Blob Stores, etc. 

Note that this project will eventually incorporate the work of the Simulation Data Validation Manager and Simulation Data Download Manager projects. However, each of these projects can proceed in parallel.

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

### Project 4. - Test system for end-to-end testing of the simulation framework 
Use [existing test power systems](http://labs.ece.uw.edu/pstca/) that will be used in our simulation framework. 
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

### Project 5. - Time-Series Modeling of Missing Energy Industry Data
A significant barrier to realistic modeling of the power grid is missing data from public data sources.
This project is to use statistical and ML models to fill in missing energy demand and renewable energy profile information in a way which mimics the real data as close as possible.
In our current data sets of regional energy demand, we have used averaging of adjacent days to fill in our missing data, as described [here](https://github.com/Breakthrough-Energy/PreREISE#d-demand-data)

We propose the following steps for this project:

- Understand the data set and the [current methodology](https://github.com/Breakthrough-Energy/PreREISE#d-demand-data)
- Literature review to understand prediction models for time series data
- Collect data to build training/validation/testing sets to rank algorithms using various metrics
- Setup platform to cross-validate with the data in order to evaluate algorithm performance
- Integrate most suitable algorithm(s) in our code base and generate new time series for our power system model
    
**Requirements:**
Python, Pandas, understanding of statistics and ML concepts

**Level:** 
Medium

**Mentor:**

### Project 6. - Visualization
Visualization of the power systems output data is essential for users to intepret the simulations results.
Our current plotting functions are base on matplotlib and bokeh.
 
**Requirements:**

**Level:** 

**Mentor:**



