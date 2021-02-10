[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gl/gromacs%2Fonline-tutorials%2Fumbrella-sampling/main?filepath=tutorial.ipynb)

# CI status

[![pipeline status](https://gitlab.com/gromacs/online-tutorials/umbrella-sampling/badges/main/pipeline.svg)](https://gitlab.com/gromacs/online-tutorials/umbrella-sampling/-/commits/main)

# Umbrella Sampling Tutorial

This repository hosts published tutorials for doing umbrella sampling with GROMACS

## Usage

1. Click on the above "launch binder" button and wait for a server to
   be provisioned.
2. Enjoy learning with the tutorial!

## Contributing

Contributions are welcome. Please open an issue on GitHub to discuss,
or make a pull request.

## Maintenance

We want the notebook to run by itself and also as a binder.

When run by itself, the `environment.yml` file is enough to build a conda environment that can run it.

When run as a binder, both we and [mybinder.org] use `repo2docker` to convert the contents of a repository checkout to a container.
We support the default mode for [mybinder.org], which is to build the container upon startup following the `environment.yml` file.
This can take several minutes or longer.

We also want to let binder users have fast startup by providing [mybinder.org] with a pre-built container.
We can do this via the `binder-cache` branch, that contains just the necessary `Dockerfile`.
That `Dockerfile` pulls an image that is made automatically from the `main` branch by GitLab CI.
GitLab CI's `.gitlab-ci.yml` file.

TODO The notebook is built into a binder automatically by GitLab CI via the .
It does so using an image built automatically in GitLab CI specified by the https://gitlab.com/gromacs/online-tutorials/binder-builder repository.


## License

See the LICENSE file.

[mybinder.org]: https://mybinder.org/
