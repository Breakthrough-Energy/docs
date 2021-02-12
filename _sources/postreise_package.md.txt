[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
![Tests](https://github.com/Breakthrough-Energy/PostREISE/workflows/Pytest/badge.svg)

# PostREISE
This package is dedicated to the analysis and plotting of the output data.

PostREISE is part of a set of packages representing Breakthrough Energy's power system model.
More information regarding the installation of the model as well as the contribution guide can be found [here](https://breakthrough-energy.github.io/docs/).


## 1. Setup/Install
Here are the instructions to install the **PostREISE** package. We strongly recommend that you pick one of the following options.


### A. Using pipenv
If not already done, install `pipenv` (see their [webpage](https://pipenv.pypa.io/en/latest/)) and run:
```bash
pipenv sync
pipenv shell
```
in the root folder of the package. The first command will create a virtual environment and install the dependencies. The second command will activate the environment.


### B. Using the ***requirements.txt*** file
First create an environment using `venv` (more details [here](https://docs.python.org/3/library/venv.html)). Note that `venv` is included in the Python standard library and requires no additional installation. Then, activate your environment and run:
```bash
pip install -r requirements.txt
```
in the root folder of the package.


### C. Path
Whatever method you choose, if you wish to access the modules located in **PostREISE** from anywhere on your machine, do:
```bash
pip install .
```
in the root folder of your package or alternatively, setup the `PYTHONPATH` global variable.


## 2. Analysis
The `postreise.analyze` module encloses several analysis modules.


### A. Transmission Congestion (Utilization) Analysis
To carry out transmission congestion analyses per scenario:
1. download the power flow output;
2. calculate congestion statistics;
3. display the data.

The ***[utilization_demo.ipynb][utilization]*** notebook shows the steps for
downloading, calculating and plotting the various statistics. Note that since
the plot outputs are meant to be interactive, they may not render on GitHub.


### B. Transmission Congestion (Surplus) Analysis
The congestion surplus for each hour can be calculated by calling
```python
postreise.analyze.transmission.congestion.calculate_congestion_surplus(scenario)
```
where `scenario` is a powersimdata.scenario.scenario.Scenario object in Analyze state.


### C. Emissions Analysis
The hourly CO<sub>2</sub>, NO<sub>x</sub> and SO<sub>2</sub> emissions from a scenario may be analyzed by calling:
```python
postreise.analyze.generation.emissions.generate_emissions_stats(scenario)
```
where `scenario` is a `powersimdata.scenario.scenario.Scenario` object in the analyze state.

The resulting data frame can be summed by generator type and bus by calling
```python
postreise.analyze.generation.emissions.summarize_emissions_by_bus(emissions, plant)
```
where `emissions` is a `pandas.DataFrame` as returned by `generate_emissions_stats` and `grid` is a `powersimdata.input.grid.Grid` object.


### D. Curtailment Analysis
The level of curtailment for a Scenario may be calculated in several ways.


#### I. Calculating Time Series
To calculate the time-series curtailment for each solar and wind generator, call:
```python
from postreise.analyze.generation.curtailment import calculate_curtailment_time_series
calculate_curtailment_time_series(scenario)
```
where `scenario` is a `powersimdata.scenario.scenario.Scenario` object in the analyze state. If you call:
```python
postreise.analyze.generation.curtailment import calculate_curtailment_time_series_by_resources
calculate_curtailment_time_series_by_resources(scenario, resources={"solar", "wind"})
```
you will obtain a dictionary where the keys are solar and wind and the values are the curtailment time-series for the associated resource.

You can also get the curtailment time-series by areas by calling:
```python
from postreise.analyze.generation.curtailment import calculate_curtailment_time_series_by_areas
calculate_curtailment_time_series_by_areas(scenario,
  areas={"interconnect": {"Western", "Texas"},
         "state": {"Washington", "California", "Idaho"},
         "loadzone": {"Bay Area", "El Paso", "Far West"}})
```
this returns a dictionary where the keys are the areas and the values are the curtailment time-series for solar and wind in the associated area.

Finally, you can group the curtailment time-series by areas and resources as follows:
```python
postreise.analyze.generation.curtailment import calculate_curtailment_time_series_by_areas_and_resources
calculate_curtailment_time_series_by_areas_and_resources(scenario,
  areas={"interconnect": {"Western", "Texas"},
         "state": {"Washington", "California", "Idaho"},
         "loadzone": {"Bay Area", "El Paso", "Far West"}},
  resources={"solar", "wind"})
```
in that case the it returns a dictionary where the keys are the areas and the values are a dictionary where the keys are the resources and the values the curtailment time-series for the associated area-resource pair.


#### II. Summarizing Time Series: Plant => Bus/Location
A curtailment data frame with plants as columns can be further summarized by bus or by location (substation) with:
```python
postreise.analyze.generation.curtailment.summarize_curtailment_by_bus(scenario)
```
or
```python
postreise.analyze.generation.curtailment.summarize_curtailment_by_location(scenario)
```


#### III. Calculating Annual Curtailment Percentage
An annual average curtailment value can be found for all wind/solar plants with:
```python
postreise.analyze.generation.curtailment.calculate_curtailment_percentage(scenario)
```
where `scenario` is a `powersimdata.scenario.scenario.Scenario` object in the analyze state. To calculate the average curtailment just for wind or solar, call
```python
from postreise.analyze.generation.curtailment import calculate_curtailment_percentage
calculate_curtailment_percentage(scenario, resources={'wind'})
```
or
```python
from postreise.analyze.generation.curtailment import calculate_curtailment_percentage
calculate_curtailment_percentage(scenario, resources={'solar'})
```


## 3. Plotting
### A. Time Series, Bars, Pie, Whisker Plots and so Forth
The `postreise.plot.analyze_pg` module is dedicated to the analysis of the generation and plotting. These include:
* Calculate the time series of the generation and demand per zone and fuel type - Plot the time series for each zone using stacked color areas for each fuel type
* Calculate time series of the curtailment for renewables in one zone
* Break down generation and capacity per fuel type and zone - Bar charts are used for display
* Calculate the capacity factor of renewables in one zone and display the result using whisker plots

You can also compare side by side the generation and capacity in zones for multiple scenarios using the modules in **postreise/plot/multi/**.

The `postreise.plot.plot_energy_carbon_stack` module allow to compare generation and emission for multiple scenarios.

We have also implemented a tornado plot (horizontal bar chart styled) to show both positive and negative values cleanly. The code lives in the `plot_tornado` module.


### B. Maps
These include:
* The shadow price and congested branches for a given hour
* Carbon emissions per bus for a given scenario using glyph whose size and color reflect emissions quantity (tons) and fuel type, respectively
* Difference in carbon emissions between two scenarios per bus using glyph whose size and color reflect the magnitude of the relative increase/decrease in emission

Check out the notebooks within the [demo][plot_notebooks] folder.


[plot_notebooks]: https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/
[utilization]: https://github.com/Breakthrough-Energy/PostREISE/tree/develop/postreise/analyze/transmission/demo/utilization_demo.ipynb
[shadowprice]: https://github.com/Breakthrough-Energy/PostREISE/tree/develop/postreise/plot/demo/shadowprice_map_demo.ipynb
