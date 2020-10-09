# Sphinx docstring format

We recommend reading the [Sphinx tutorial]. It is very short and it lists all the scenario you are likely to encounter when writing code.

That said, we do format the docstring in a slightly more compact way than what is presented in the tutorial. The type of the parameters and returned variable is encapsulated in the description as follows:
```python
"""
:param [ParamType] [ParamName]: [ParamDescription], defaults to [DefaultParamVal]
:return: (*[ReturnType]*) -- [ReturnDescription]
"""
```

When functions or methods are mentioned in the docstring, those should be referenced. For example, the description of the `uv1` parameter in the `angular_distance` function located in the `powersimdata.utility.distance` module refers to the `ll2uv` function defined in the same module.
```python
def angular_distance(uv1, uv2):
    """Calculate the angular distance between two vectors.

    :param list uv1: 3-components vector as returned by :func:`ll2uv`.
    :param list uv2: 3-components vector as returned by :func:`ll2uv`.
    :return: (*float*) -- angle (in degrees).
    """
    ...
```
If you refer to a function (or a class using `:py:class:`) that is defined in a different module, you will need to use the absolute path as shown below:
```python
def gaussian(data, wind_farm, inplace=True, curve="state"):
    """Impute missing data using gaussian distributions of U & V. For each
    missing entry, sample U & V based on mean and covariance of non-missing
    entries that have the same location, same month, and same hour.

    :param pandas.DataFrame data: data frame as returned by
        :py:func:`prereise.gather.winddata.rap.rap.retrieve_data`.
    :param pandas.DataFrame wind_farm: data frame of wind farms.
    :param bool inplace: should the imputation be done in place.
    :param str curve: 'state' to use the state average, otherwise named curve.
    :return: (*pandas.DataFrame*) -- data frame with missing entries imputed.
    """
    ...
```
The function `gaussian` is defined in the `prereise.gather.winddata.rap.impute` module and refers to the `retrieve_data` function in a different module.

Finally, you can use an external link in your docstring. It will be active in the generated documentation if formatted as follows
```python
class EIAgov(object):
    """Copied from `this link <https://quantcorner.wordpress.com/2014/11/18/downloading-eias-data-with-python/>`_.

    :param str token: EIA token.
    :param list series: id code(s) of the series to be downloaded.
    """
    ...
```
In other words, it will be shown as [this link](https://quantcorner.wordpress.com/2014/11/18/downloading-eias-data-with-python/).


[Sphinx tutorial]: https://sphinx-rtd-tutorial.readthedocs.io/en/latest/docstrings.html
