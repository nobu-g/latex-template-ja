# Japanese LaTeX Template

## Features

- latexmk
- latexdiff
- tex-fmt
- GitHub Actions
  - build pdf
  - release pdf
  - deploy pdf to a specific server over ssh
  - build and push Docker image to GitHub Container Registry

## Requirements

- TexLive
  - (macOS) `brew install --cask mactex-no-gui`
- [tex-fmt](https://github.com/WGUNDERWOOD/tex-fmt) (optional)
  - (macOS) `brew install tex-fmt`
- [pre-commit](https://github.com/pre-commit/pre-commit) (optional)
  - (macOS) `brew install pre-commit`

## Setup

```shell
git config --local include.path ../.gitconfig
pre-commit install
```

## Uploading Compiled PDF Files to Some Server

1. Add the following line to `.github/workflows/main.yml`.

```shell
rsync -acvz --delete ./build/main.pdf user@remote:/path/to/deploy/
```

1. Add `KNOWN_HOSTS` and `SSH_KEY` secret entries to your repository (Repository->Settings->Secrets).

For details, see the instructions in [Install SSH Key](https://github.com/marketplace/actions/install-ssh-key).

- `KNOWN_HOSTS`: Host information whose format is the same as `known_hosts` file. Run `ssh-keyscan <host>` to get value.
- `SSH_KEY`: A decrypted SSH private key. To decrypt an encrypted private key, run `openssl rsa -in <encrypted private key> -out <decrypted private key>` or `ssh-keygen -p -f <encrypted private key>`.

1. Change repository permission

Make sure the workflow permission setting (Settings > Actions > General > Workflow permissions) is set to "Read and write permissions".

## Docker Image

This repository includes a GitHub Actions workflow that automatically builds and pushes the Docker image defined in `.devcontainer/Dockerfile` to GitHub Container Registry (ghcr.io).

### Accessing the Docker Image

Once built, the Docker image will be available at:

```text
ghcr.io/nobu-g/latex-template-ja/latex-ja:latest
```

You can pull it with:

```bash
docker pull ghcr.io/nobu-g/latex-template-ja/latex-ja:latest
```

### Building Locally

If you need to build the image locally (e.g., for development or if the pre-built image doesn't work for your architecture), you can:

1. Uncomment the `build: .` line and comment out the `image:` line in `.devcontainer/compose.yaml`
2. Run `docker-compose up -d` in the `.devcontainer` directory

```yaml
services:
  latex-ja:
    # image: ghcr.io/nobu-g/latex-template-ja/latex-ja:latest
    build: . # build the image locally
    # ...
```

### Requirements for GitHub Actions

- The repository must have "Read and write permissions" for GitHub Actions (Settings > Actions > General > Workflow permissions)
- For pull requests, the image will be built but not pushed to the registry

## Usage

- build

    ```shell
    latexmk
    ```

## FAQ

### Q1. LaTeX indent not working

A1. Run the following commands.

```shell
brew install perl
brew install cpanm
cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString
```
