# Imports

We follow [PEP 8][PEP 8 imports] when importing modules. In short, the following rules must be followed:
* imports should be on separate lines:
```python
import numpy
import pandas
import pytest
```
however, when importing modules from the same package or functions/classes/variables from the same module, it is ok to write:
```python
from powersimdata.input import grid, change_table
from postreise.analyze.time import change_time_zone, resample_time_series
```
where `grid` and `change_table` are modules whereas `change_time_zone` and `resample_time_series` are functions defined in the `time` module.
* use absolute imports. For example, if you need to create a `Grid` object in a module located at the same level as the `grid` module, use:
```python
from powersimdata.input.grid import Grid
grid = Grid(["western"])
```
and not:
```python
from grid import Grid
grid = Grid(["western"])
```
* imports are always put at the top of the file. We require that imports are alphabetically sorted, and automatically separated into sections and by type. If you run:
```
tox -e checkformatting
```
in the directory enclosing the **tox.ini** file, you will be notified of any irregularity. Note that it is the `isort` package accomplishes this task (see the [isort] documentation for more information).
* We don't use wildcards import, e.g.:
```
from powersimdata.network.usa_tamu.constants.zones import *
```
since it will be unclear which names are present in the namespace, confusing both readers and many automated tools. Another good reason to avoid wildcards is to prevent collisions. Finally, even if we don't use wild cards, we list the modules by setting the `__all__` variable in an **\_\_init\_\_.py** file.

[PEP 8 imports]: https://www.python.org/dev/peps/pep-0008/#imports
[isort]: https://pycqa.github.io/isort/
