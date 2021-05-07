Plotting Scenario Data
----------------------
The plotting functions use the analysis modules to process data. We have a `demo folder
<https://github.com/Breakthrough-Energy/PostREISE/tree/develop/postreise/plot/demo>`_
that encloses numerous notebooks that we hope will help you analyze/display your scenario data.


Single Scenario
+++++++++++++++
Transmission
############
- get a power flow snapshot (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/powerflow_snapshot_demo.py>`__)

  .. code-block:: python

      from bokeh.io import show
      import pandas as pd

      from postreise.plot.plot_powerflow_snapshot import plot_powerflow_snapshot
      from powersimdata import Scenario

      scenario = Scenario(3287)
      grid = scenario.get_grid()

      pf_map = plot_powerflow_snapshot(
        scenario, pd.Timestamp(2016, 11, 2, 22), legend_font_size=20
      )
      show(pf_map)

  .. image:: img/single/pf_snapshot_map.png


Emission
########
- show carbon emission by generator type using circles overlay on a map
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. code-block:: python

      from bokeh.io import show

      from postreise.plot.plot_carbon_map import map_carbon_emission_generator
      from powersimdata import Scenario

      scenario = Scenario(3287)

      emission_map = map_carbon_emission_generator(
        scenario, coordinate_rounding=0, scale_factor=0.75
      )
      show(emission_map)

  .. raw:: html
      :file: img/single/emission_map.html


Generator Capacity and Generation
#################################
- plot stacked generation time series in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/plot_generation_time_series_stack_demo.ipynb>`__)

  .. code-block:: python

      from postreise.plot.plot_generation_ts_stack import (
        plot_generation_time_series_stack,
      )
      from powersimdata import Scenario

      t2c = {
        "nuclear": "#173FA5",
        "hydro": "#0090FF",
        "geothermal": "#CC67F3",
        "other": "#8B36FF",
        "dfo": "#31E8CB",
        "coal": "#37404C",
        "ng": "#72818F",
        "solar": "#FFBB45",
        "wind": "#78D911",
        "solar_curtailment": "#FFBB45",
        "wind_curtailment": "#78D911",
      }

      t2l = {
          "nuclear": "Nuclear",
          "hydro": "Hydro",
          "geothermal": "Geothermal",
          "other": "Other",
          "dfo": "Distillate Fuel Oil",
          "coal": "Coal",
          "ng": "Natural Gas",
          "solar": "Solar",
          "wind": "Wind",
          "wind_offshore": "Wind Offshore",
          "biomass": "Biomass",
          "storage": "Storage",
          "solar_curtailment": "Solar Curtailment",
          "wind_curtailment": "Wind Curtailment",
          "wind_offshore_curtailment": "Offshore Wind Curtailment",
      }

      t2hc = {
          "solar_curtailment": "#996100",
          "wind_curtailment": "#4e8e0b"
      }

      scenario = Scenario(1171)

      resources = [
        "nuclear",
        "coal",
        "hydro",
        "geothermal",
        "other",
        "dfo",
        "ng",
        "solar",
        "wind",
        "storage",
        "solar_curtailment",
        "wind_curtailment",
      ]

      plot_generation_time_series_stack(
        scenario, "Western", resources, time_freq="D", normalize=True, t2c=t2c, t2l=t2l,
        t2hc=t2hc
      )

  .. image:: img/single/generation_stack_western_ts.png

- plot capacity vs capacity factor of generators in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/scatter_capacity_vs_capacity_factor_demo.ipynb>`__)

  .. code-block:: python

      from powersimdata.scenario.scenario import Scenario
      from powersimdata.utility.helpers import PrintManager
      from postreise.plot.plot_scatter_capacity_vs_capacity_factor import (
        plot_scatter_capacity_vs_capacity_factor
      )

      with PrintManager():
        scenario = Scenario(1171)

        plot_scatter_capacity_vs_capacity_factor(
          scenario, "Western", "solar", percentage=True
        )

  .. image:: img/single/capacity_vs_cf_solar_western_scatter.png

- plot capacity vs cost curve slope of generators in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/scatter_capacity_vs_cost_curve_slope_demo.ipynb>`__)

  .. code-block:: python

      from powersimdata.scenario.scenario import Scenario
      from powersimdata.utility.helpers import PrintManager
      from postreise.plot.plot_scatter_capacity_vs_cost_curve_slope import (
          plot_scatter_capacity_vs_cost_curve_slope
      )

      with PrintManager():
        scenario = Scenario(3287)

        plot_scatter_capacity_vs_cost_curve_slope(scenario, "Eastern", "coal")

  .. image:: img/single/capacity_vs_cost_curve_slope_coal_eastern_scatter.png


Curtailment
###########
- plot renewable generators curtailment time series in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/plot_curtailment_time_series_demo.ipynb>`__)

  .. code-block:: python

      import matplotlib.pyplot as plt

      from postreise.plot.plot_curtailment_ts import plot_curtailment_time_series
      from powersimdata import Scenario

      scenario = Scenario(403)

      t2c = {"wind_curtailment": "blue", "solar_curtailment": "blue"}

      plot_curtailment_time_series(
        scenario, "Eastern", ["wind","solar"], time_freq='D', t2c=t2c,
        label_fontsize=30, title_fontsize=35, tick_fontsize=25, legend_fontsize=25,
      )
      plt.show()

  .. image:: img/single/curtailment_solar_eastern_ts.png
  .. image:: img/single/curtailment_wind_eastern_ts.png


Price
#####
- map locational marginal price (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/lmp_map_demo.ipynb>`__)

  .. code-block:: python

      from bokeh.io import show

      from postreise.plot.plot_lmp_map import map_lmp
      from powersimdata import Scenario

      scenario = Scenario(3287)

      lmp_map = map_lmp(scenario)
      show(lmp_map)

  .. raw:: html
      :file: img/single/lmp_usa_map.html


General
#######
- plot any time-series values using a heatmap where each column is one color-coded day
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/heatmap_demo.ipynb>`__)

  .. code-block:: python

      import matplotlib.pyplot as plt
      from powersimdata import Scenario

      from postreise.analyze.generation.curtailment import (
        calculate_curtailment_time_series,
      )
      from postreise.plot.plot_heatmap import plot_heatmap

      scenario = Scenario(3287)
      curtailment = calculate_curtailment_time_series(scenario).sum(axis=1)

      plot_heatmap(
          curtailment,
          cmap="PiYG_r",
          scale=1e-3,
          cbar_label="GW",
          vmin=0,
          vmax=250,
          cbar_tick_values=[0, 50, 100, 150, 200, 250],
          cbar_tick_labels=['0', '50', '100', '150', '200', '≥250'],
          time_zone="ETC/GMT+6",
          time_zone_label="(CST)",
          contour_levels=[250],
      )

  .. image:: img/single/curtailment_usa_heatmap.png

- map transmission lines color coded by interconnection

  .. code-block:: python

      from bokeh.io import show

      from postreise.plot.plot_interconnection_map import map_interconnections
      from powersimdata import Scenario

      scenario = Scenario(3287)
      grid = scenario.get_grid()

      transmission_map = map_interconnections(grid)
      show(transmission_map)

  .. raw:: html
      :file: img/other/interconnection_map.html


Scenarios Comparison
++++++++++++++++++++
Generator Capacity and Generation
#################################
- compare generation and capacity in various scenarios through bar charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/bar_generation_vs_capacity_demo.ipynb>`__)

  .. code-block:: python

      from postreise.plot.plot_bar_generation_vs_capacity import (
        plot_bar_generation_vs_capacity,
      )
      from powersimdata.utility.helpers import PrintManager

      with PrintManager():
          plot_bar_generation_vs_capacity(
              areas=["CA", "Western"],
              scenario_ids=[2497, 3101],
              scenario_names=[
                  "Western 90% clean and 10% nuclear",
                  "Western 90% clean and 10% nuclear with transmission upgrade",
              ],
          )

  .. image:: img/comp/capacity_vs_generation_ca_bar.png
  .. image:: img/comp/capacity_vs_generation_western_bar.png

- compare generation and capacity in various scenarios through pie charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/pie_generation_vs_capacity_demo.ipynb>`__)

  .. code-block:: python

      from postreise.plot.plot_pie_generation_vs_capacity import (
        plot_pie_generation_vs_capacity,
      )
      from powersimdata.utility.helpers import PrintManager

      with PrintManager():
          plot_pie_generation_vs_capacity(
              areas=["WA", "Western"],
              scenario_ids=[2497, 3101],
              scenario_names=[
                  "Western 90% clean and 10% nuclear",
                  "Western 90% clean and 10% nuclear \n with transmission upgrade",
              ],
          )
  .. image:: img/comp/capacity_vs_generation_wa_pie.png
  .. image:: img/comp/capacity_vs_generation_western_pie.png

- compare generation shortfall in various scenarios through bar charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/bar_shortfall_demo.ipynb>`__)

  .. code-block:: python

      import inspect
      import os
      from powersimdata.utility.helpers import PrintManager

      import postreise
      from postreise.plot.plot_bar_shortfall import plot_bar_shortfall
      from powersimdata.design.generation.clean_capacity_scaling import (
        load_targets_from_csv,
      )

      data = os.path.join(os.path.dirname(inspect.getfile(postreise)), "data")
      target = load_targets_from_csv(
          os.path.join(data, "2030_USA_Clean_Energy_Regular_Targets.csv")
      )
      with PrintManager():
          plot_bar_shortfall(
              "Nevada",
              [2497, 3101],
              target,
              scenario_names=[
                  "Western 90% clean and 10% nuclear",
                  "Western 90% clean and 10% nuclear"
                  + "\n"
                  + "with transmission upgrade",
              ],
              baseline_scenario=2497,
              baseline_scenario_name="Western 90% clean and 10% nuclear",
          )

  .. image:: img/comp/shortfall_nv.png


Emission
########
- compare total carbon emissions by generator type for 1-to-n scenarios through bar
  charts (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. code-block:: python

      from postreise.plot.plot_carbon_bar import plot_carbon_bar
      from powersimdata import Scenario
      from powersimdata.utility.helpers import PrintManager

      scenarioA = Scenario(2497)
      scenarioB = Scenario(3101)

      with PrintManager():
          scenarioA = Scenario(2497)
          scenarioB = Scenario(3101)

      plot_carbon_bar(
          scenarioA, scenarioB,
          labels=["Western" + "\n" + "90% clean and 10% nuclear",
                  "Western" + "\n" + "90% clean and 10% nuclear"
                  + "\n"
                  + "with transmission upgrade"]
      )


  .. image:: img/comp/emission_bar.png

- compare carbon emission by generator type for two scenarios on a map (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. code-block:: python

      from bokeh.io import show

      from postreise.plot.plot_carbon_map import map_carbon_emission_difference
      from powersimdata import Scenario

      scenarioA = Scenario(2497)
      scenarioB = Scenario(3101)

      emission_difference_map = map_carbon_emission_difference(
        scenarioA, scenarioB, coordinate_rounding=0
      )
      show(emission_difference_map)

  .. raw:: html
      :file: img/comp/emission_map.html

- plot stacked generation and carbon emission for 1-to-n scenarios side-by-side
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/energy_emissions_stack_bar_demo.ipynb>`__)

  .. code-block:: python

      from postreise.plot.plot_energy_carbon_stack import plot_n_scenarios
      from powersimdata import Scenario

      scenarioA = Scenario(2497)
      scenarioB = Scenario(3101)

      plot_n_scenarios(scenarioA, scenarioB)

  .. image:: img/comp/energy_emission_stack_bar.png
