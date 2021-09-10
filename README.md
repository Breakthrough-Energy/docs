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

## Building Locally
The documentation can be built using either of the following methods. For most cases, 
docker is the recommended option since it works on any OS, however some users may find tox is faster.
The output will be in the `build/` directory, and you can browse from the homepage located
at `build/html/index.html`.

### Docker
```
docker-compose up --build
```

### Tox

Additional requirements:
* [tox]
* make (see installation guide for your specific OS)

Now, you can create all the docs by just running `tox` or create docs for a
specific package: `tox -e [package]`. The `package` argument should be one of
(prereise,powersimdata,postreise) which can be seen by running `tox -l` to list
possibilities. Lastly, if you need to clear existing build output, you can do so by running
`make clean`.


[PreREISE]: https://github.com/Breakthrough-Energy/PreREISE
[PowerSimData]: https://github.com/Breakthrough-Energy/PowerSimData
[PostREISE]: https://github.com/Breakthrough-Energy/PostREISE
[REISE.jl]: https://github.com/Breakthrough-Energy/REISE.jl
[tox]: https://tox.readthedocs.io/en/latest/ 
[pyenv]: https://github.com/pyenv/pyenv
