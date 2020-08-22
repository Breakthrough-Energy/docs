# docs
Documentation

## Requirements
To build the docs locally you'll need `tox` installed. It's recommended to have
it in a global pyenv environment so it can be used across projects.

Now, you can create all the docs by just running `tox` or create docs for a
specific package: `tox -e [package]`. The `package` argument should be one of
(prereise,powersimdata,postreise) which can be seen by running `tox -l` to list
possibilities.

