Contribution Guide
==================
We are thrilled that you have decided to join the Breakthrough Energy Sciences (BES)
community and help develop and improve this software! We wrote the following guidelines
to ensure that your contribution is consistent with our coding standards and hence
facilitate its merging into the code base.

There are several ways to contribute to this project. You can report bugs, file feature
requests, work on existing issues, etc. In order to keep the code base well structured,
documented and testable we have written guidelines. When creating a pull request the
following items should be addressed. The reviewer will make sure the guidelines are
followed.

Thank you for joining the BES community!


How to Contribute
-----------------
#. First things first, go to the :doc:`../user/installation_guide` to get the software
   up and running
#. Get familiar with our Git/GitHub workflow (see our :doc:`../user/git_guide` for more
   details)
#. Reporting a bug or have a feature request? (see the `Bug Report and Feature Request`_ section)
#. Does your feature require external data? (see the `Data Intake Procedure`_
   section)
#. Develop your feature (go to the `Develop your Feature`_ section)
#. Format your code (as explained in the `Format your Code`_ section)
#. Document your code (see the `Document your Code`_ section)
#. Make a pull request (see our :doc:`../user/git_guide` page)

Bug Report and Feature Request
++++++++++++++
Thank you for reporting your bug or requesting a feature. Navigate to the repository you have identified
as the most likely source of your bug or where you think your feature may belong to.

If you are not sure if your bug is really a bug, but rather stems from you individual setup or installation,
then use the `#questions <https://besciencescommunity.slack.com/archives/C01CBTRQQF9>`_ slack channel
to discuss your issue. If you want to discuss your feature request first with the team, feel free to connect with us
via the `#request_software <https://besciencescommunity.slack.com/archives/C01D594JXK3>`_ slack channel.

If you are clear about your bug or feature request, choose the **Issues** tab on the repository and
create a **New Issue**. If available, choose the **Bug report** or **Feature request** template and
select **Get started**. Please fill out the template and provide as much information regarding your
bug or feature request. Click on **Submit new issue** and the team will get back to you regarding your issue.


Data Intake Procedure
+++++++++++++++++++++
Before using any external dataset in your project, we must be absolutely certain that it
can be redistributed. This applies to both data obtained via an API and data files that
are first downloaded and then uploaded to one of our repository on GitHub or any public
storage.

A feature relying on external data will not be merged to the code base unless those can
be redistributed; therefore it would be a waste of time to write code centered around an
external dataset before knowing if it can be used. For this reason, we ask you to follow
the below procedure if you should need external data to develop your feature:

#. Create an issue on GitHub using the **data intake** template, available in **PreREISE**, **PowerSimData** and **PostREISE** repositories. Fill out all the fields. Make sure the issue has **data intake** as label and that *Daniel Olsen* and *Benjamin Rouillé d'Orfeuil* are assigned to the issue.
#. The BES team makes sure the data can be used/redistributed.
#. If the data can be used *Daniel* and/or *Ben* communicate the eventual legal note to
   be added to the ATTRIBUTION file, located in the root directory of the repository, to the collaborator.
#. *Daniel* and *Ben* will review the ATTRIBUTION file and hence should be added as
   reviewers of your Pull Request.


Develop your Feature
++++++++++++++++++++
First, we recommend reading the :doc:`coding_guide` to ensure your code is well
designed.

Second, test your feature. The unit tests for our code are grouped locally in a
**tests** folder located at the same level as the module being tested. All the tests of
a package can be run using:

.. code-block:: console

    pytest -m "not integration"

at the base directory of the repository. The marker in the above command line is used to
deselect tests that rely on internal infrastructure.

Best practices for writing tests with `pytest`_ and a presentation of the mock objects
can be found in our :doc:`testing_guide`.


Format your Code
++++++++++++++++
Below are the rules:

+ Do not use wildcard imports
+ Do use absolute imports
+ Code is formatted according to the `black`_ code style and imports are arranged using
  `isort`_. This is automatically done running:

  .. code-block:: console

     tox -e format

More context and examples about imports can be found in the :doc:`import_guide`.


Document your Code
++++++++++++++++++
All functions and methods of classes must be documented following `PEP 257
<https://www.python.org/dev/peps/pep-0257/>`_.

There are multiple docstring formats. For this project, we adopted the Sphinx docstring
format which allows us to generate documentation for the code together with this
website.

You can learn about our docstring convention in the :doc:`docstring_guide`.


Communication
-------------
Use `GitHub`_ to report bugs and propose features. Also, do not hesitate to `subscribe
<http://science.breakthroughenergy.org#get-updates>`_ to our email list and join our
Slack workspace in order to stay updated and reach us if you should have any questions.

We have a :doc:`../communication/code_of_conduct` that we ask you to review before
communicating on these channels.


.. _black: https://github.com/psf/black
.. _GitHub: https://github.com/Breakthrough-Energy
.. _pytest: https://docs.pytest.org/en/stable/getting-started.html
.. _isort: https://github.com/PyCQA/isort
