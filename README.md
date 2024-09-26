# Machine Learning Elements

> **Author**: [Riccardo Finotello](riccardo.finotello@cea.fr) (CEA Paris-Saclay)
>
> **Event**: _Artificial Intelligence and Modern Physics. A Two-Way Connection._

The repository contains the presentation given in the context of the doctoral school _AIPHY_, from 30/09/2024 to 04/10/2024, for the course of **Machine Learning Elements**.
Hands-on sessions are presented as _Jupyter_ notebooks.

## Installation

The simplest installation is via the [**Dockerfile**](./aiphyintroml.dockerfile) in the repository:

- under _Linux_ or _MacOS_: download and execute the [script](./aiphyintroml.sh),
- under _Windows_: download, build, and run the Docker image using the [Dockerfile](./aiphyintroml.dockerfile).

Alternatively, you can clone (or download) the repository, and install the dependencies yourself:

```bash
python -m venv .venv
source .venv/bin/activate
python -m ensurepip --upgrade
python -m pip install -r requirements.txt
```

## Contributing

Everyone is welcome to share their suggestions by **forking** the repository and submitting a **pull request**.
