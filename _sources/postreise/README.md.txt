### Requirements
This guide will demonstrate how to regenerate the plots used in the
[documentation][docs]. The only requirement is that docker is installed. The
scenarios used will be downloaded from blob storage, which may take a while but
should happen automatically.

### Usage
First, go to this directory, then start the container, which will provide a
notebook environment for running the code snippets.
```
cd docs
docker compose up
```

Access the notebook in your browser using the localhost url given by jupyter.
NOTE: if the host port is already in use by another container, it can be
changed to one that is available (e.g. 10001). In this case, you'll need to
change the port in the url to match, since the one given by jupyter is the port
inside the container.

Now simply run the notebook to regenerate the plots. For the most part, no
interaction is required. The exception is any bokeh plots which must be
manually saved as png (currently only the powerflow snapshot). 

One may notice that the first part of the notebook contains code to generate
the cells used subsequently. This is due to (as far as I know) lack of support
in jupyterlab for programmatically adding new cells, so as a result, any
changes to the configuration may require a developer to rerun this part and
copy/paste the output as needed. In most cases, one can simply run it with no
changes, since the notebook is pre-populated.

The output from each snippet will be saved in the `img2/` directory, similar to
`img/` which is checked into git. From here, it's up to the user to compare
results and commit the new plots if they look good.

[docs]: https://breakthrough-energy.github.io/docs/postreise/index.html
