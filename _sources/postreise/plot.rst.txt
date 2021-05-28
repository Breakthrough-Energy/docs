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

  .. include:: code/pf_snapshot_map.py
     :code: python

  .. image:: img/single/pf_snapshot_map.png

- get utilization map (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/utilization_map_demo.ipynb>`__)

  .. include:: code/utilization_map.py
     :code: python

  .. raw:: html
      :file: img/single/utilization_map.html


Emission
########
- show carbon emission by generator type using circles overlay on a map
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. include:: code/emission_map.py
     :code: python

  .. raw:: html
      :file: img/single/emission_map.html


Generator Capacity and Generation
#################################
- plot stacked generation time series in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/plot_generation_time_series_stack_demo.ipynb>`__)

  .. include:: code/generation_stack_western_ts.py
     :code: python

  .. image:: img/single/generation_stack_western_ts.png

- plot capacity vs capacity factor of generators in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/scatter_capacity_vs_capacity_factor_demo.ipynb>`__)

  .. include:: code/capacity_vs_cf_solar_western_scatter.py
     :code: python

  .. image:: img/single/capacity_vs_cf_solar_western_scatter.png


Curtailment
###########
- plot renewable generators curtailment time series in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/plot_curtailment_time_series_demo.ipynb>`__)

  .. include:: code/curtailment_eastern.py
     :code: python

  .. image:: img/single/curtailment_solar_eastern_ts.png
  .. image:: img/single/curtailment_wind_eastern_ts.png

- plot capacity vs curtailment of generators in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/scatter_capacity_vs_curtailment_demo.ipynb>`__)

  .. include:: code/capacity_vs_curtailment_solar_western_scatter.py
     :code: python

  .. image:: img/single/capacity_vs_curtailment_solar_western_scatter.png


Price
#####
- map locational marginal price (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/lmp_map_demo.ipynb>`__)

  .. include:: code/lmp_usa_map.py
     :code: python

  .. raw:: html
      :file: img/single/lmp_usa_map.html


- plot capacity vs cost curve slope of generators in an area (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/scatter_capacity_vs_cost_curve_slope_demo.ipynb>`__)

  .. include:: code/capacity_vs_cost_curve_slope_coal_eastern_scatter.py
     :code: python

  .. image:: img/single/capacity_vs_cost_curve_slope_coal_eastern_scatter.png


General
#######
- plot any time-series values using a heatmap where each column is one color-coded day
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/heatmap_demo.ipynb>`__)

  .. include:: code/curtailment_usa_heatmap.py
     :code: python

  .. image:: img/single/curtailment_usa_heatmap.png

- map transmission lines color coded by interconnection

  .. include:: code/interconnection_map.py
     :code: python

  .. raw:: html
      :file: img/other/interconnection_map.html


Scenarios Comparison
++++++++++++++++++++
Generator Capacity and Generation
#################################
- compare generation and capacity in various scenarios through bar charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/bar_generation_vs_capacity_demo.ipynb>`__)

  .. include:: code/capacity_vs_generation_bar.py
     :code: python

  .. image:: img/comp/capacity_vs_generation_ca_bar.png
  .. image:: img/comp/capacity_vs_generation_western_bar.png

- compare generation and capacity in various scenarios through pie charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/pie_generation_vs_capacity_demo.ipynb>`__)

  .. include:: code/capacity_vs_generation_pie.py
     :code: python

  .. image:: img/comp/capacity_vs_generation_wa_pie.png
  .. image:: img/comp/capacity_vs_generation_western_pie.png

- compare generation shortfall in various scenarios through bar charts (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/bar_shortfall_demo.ipynb>`__)

  .. include:: code/shortfall_nv.py
     :code: python

  .. image:: img/comp/shortfall_nv.png


Emission
########
- compare total carbon emissions by generator type for 1-to-n scenarios through bar
  charts (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. include:: code/emission_bar.py
     :code: python

  .. image:: img/comp/emission_bar.png

- compare carbon emission by generator type for two scenarios on a map (`notebook
  <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/emissions_map_demo.ipynb>`__)

  .. include:: code/emission_map_carbon_diff.py
     :code: python

  .. raw:: html
      :file: img/comp/emission_map.html

- plot stacked generation and carbon emission for 1-to-n scenarios side-by-side
  (`notebook <https://github.com/Breakthrough-Energy/PostREISE/blob/develop/postreise/plot/demo/energy_emissions_stack_bar_demo.ipynb>`__)

  .. include:: code/energy_emission_stack_bar.py
     :code: python

  .. image:: img/comp/energy_emission_stack_bar.png
