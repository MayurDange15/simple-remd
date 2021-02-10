Fast-loading cached binder: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gl/gromacs%2Fonline-tutorials%2Fumbrella-sampling/binder-cache?filepath=tutorial.ipynb)
Default binder: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gl/gromacs%2Fonline-tutorials%2Fumbrella-sampling/main?filepath=tutorial.ipynb)

# CI status

[![pipeline status](https://gitlab.com/gromacs/online-tutorials/umbrella-sampling/badges/main/pipeline.svg)](https://gitlab.com/gromacs/online-tutorials/umbrella-sampling/-/commits/main)

# Umbrella Sampling Tutorial

This repository hosts published tutorials for doing umbrella sampling with GROMACS

## Usage

1. Click on one of the above "launch binder" buttons and wait for a server to
   be provisioned.
2. Enjoy learning with the tutorial!

## Contributing

Contributions are welcome. Please open an issue on GitHub to discuss,
or make a pull request.

## For maintainers

We want the notebook to run by itself and also as a binder.

When run by itself, the `environment.yml` file is enough to build a conda environment that can run it.
Instructions for that are provided by the webpages built from https://gitlab.com/gromacs/online-tutorials/website.

When run as a binder, both we and [mybinder.org] use [repo2docker] to convert the contents of a repository checkout to a container.
We support the default mode for [mybinder.org], which is to build the container upon startup following the `environment.yml` file found in the default branch.
This can take several minutes or longer.

We also want to let binder users have fast startup by providing [mybinder.org] with a pre-built container.
We can do this via the `binder-cache` branch, that contains just the necessary `Dockerfile`.
That `Dockerfile` pulls an image that is made automatically from the `main` branch by GitLab CI.
GitLab CI's `.gitlab-ci.yml` file calls [repo2docker] to build a container image like [mybinder.org] would do.
That image is pushed to the GitLab Container registry for this GitLab project: https://gitlab.com/gromacs/online-tutorials/umbrella-sampling/container_registry.
When the user clicks on the "fast-loading cached binder" link above, the `Dockerfile` in the `binder-cache` branch directs [mybinder.org] to pull the latest container image.
This provides the same content, but starts the binder faster.

## License

See the LICENSE file.

[repo2docker]: https://repo2docker.readthedocs.io/en/latest/
[mybinder.org]: https://mybinder.org/
