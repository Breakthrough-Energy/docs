This guide will demonstrate how to regenerate the plots used in the documentation here.
The requirements are
1) Have docker installed
2) Download the [PlotData] zip file containing the scenarios used

Next, extract the data to your home directory, or change the expected location in the
docker-compose.yml file.


Start the container, which will provide a notebook environment for running the code
snippets.
```
docker compose up
```

After copying the notebook url from the output, start the `run_snippets.ipynb` notebook
and run through it. For the most part, no interaction is required. The exception is any
bokeh plots which must be manually saved as png (currently only the powerflow snapshot). 

One may notice that the first part of the notebook contains code to generate the cells
used subsequently. This is due to (as far as I know) lack of support in jupyterlab for
programmatically adding new cells, so as a result, any changes to the configuration may
require a developer to rerun this part and copy/paste the output as needed. In most
cases, one can simply run it with no changes, since the notebook is pre-populated.

The output from each snippet will be saved in the `img2/` directory, similar to `img/` which 
is checked into git. From here, it's up to the user to compare results and commit the new plots if they look
good.

[PlotData]: https://besciences.blob.core.windows.net/snapshots/PlotData.zip
