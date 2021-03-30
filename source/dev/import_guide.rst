:orphan:

Import Statement Guide
======================
We follow `PEP 8`_ when importing modules. In short, the following rules must be
followed:


Format
------
Imports should be on separate lines:

.. code-block:: python

    import numpy
    import pandas
    import pytest

However, when importing modules from the same package or functions/classes/variables from the same module, it is ok to write:

.. code-block:: python

    from powersimdata.input import grid, change_table
    from postreise.analyze.time import change_time_zone, resample_time_series

where ``grid`` and ``change_table`` are modules whereas ``change_time_zone`` and
``resample_time_series`` are functions defined in the ``time`` module.

Also, import statements are always put at the top of the file. We require that imports
are alphabetically sorted, and automatically separated into sections and by type. If
you run:

.. code-block:: console

    tox -e checkformatting

in the directory enclosing the **tox.ini** file, you will be notified of any
irregularity. It is the `isort`_ package that accomplishes this task.


Path
----
Use absolute import statements. For example, if you need to create a ``Grid`` object
in a module located at the same level as the `grid` module, use:

.. code-block:: python

    from powersimdata.input.grid import Grid
    grid = Grid("Western")

and not:

.. code-block:: python

    from grid import Grid
    grid = Grid("Western")


Be Specific
-----------
Don't use wildcards import, e.g.:

.. code-block:: python

    from powersimdata.network.usa_tamu.constants.zones import *

since it will be unclear which names are present in the namespace, confusing both
readers and many automated tools. Another good reason to avoid wildcards is to prevent
collisions. Finally, even if we don't use wild cards, we list the modules by setting the
``__all__`` variable in an **\_\_init\_\_.py** file.


.. _PEP 8: https://www.python.org/dev/peps/pep-0008/#imports
.. _isort: https://pycqa.github.io/isort/
