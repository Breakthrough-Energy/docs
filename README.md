# docs
Documentation

## Requirements

This repository combines documentation from [PreREISE], [PowerSimData],
[PostREISE], and [REISE.jl] so in order to build locally, clone those first -
into the *same directory* as this repo such that your file structure looks like
this:

`root directory:`

```bash
    .
    ├── docs
    ├── PostREISE
    ├── PowerSimData
    ├── PreREISE
    └── REISE.jl
```

Additionally, you'll need [tox] installed. It's recommended to have
it in a global [pyenv] environment so it can be used across projects.

Now, you can create all the docs by just running `tox` or create docs for a
specific package: `tox -e [package]`. The `package` argument should be one of
(prereise,powersimdata,postreise) which can be seen by running `tox -l` to list
possibilities.

## Docker
It may be easier to build locally using docker due to mac os issues.

```
docker-compose up --build
```

[PreREISE]: https://github.com/Breakthrough-Energy/PreREISE
[PowerSimData]: https://github.com/Breakthrough-Energy/PowerSimData
[PostREISE]: https://github.com/Breakthrough-Energy/PostREISE
[REISE.jl]: https://github.com/Breakthrough-Energy/REISE.jl
[tox]: https://tox.readthedocs.io/en/latest/ 
[pyenv]: https://github.com/pyenv/pyenv
