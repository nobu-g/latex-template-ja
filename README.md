# Japanese LaTeX Template

## Features

- latexmk
- latexdiff
- GitHub Actions
  - build pdf
  - release pdf
  - deploy pdf to a specific server over ssh
- textlint

## Requirements

- TexLive
  - (macOS) `brew install --cask mactex-no-gui`
- Node.js

## Setup

```shell
git config --local include.path ../.gitconfig
npm install
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

## Usage

- build

    ```shell
    latexmk
    ```

- lint

    ```shell
    npm run -s lint
    ```

## FAQ

### Q1. LaTeX indent not working

A1. Run the following commands.

```shell
brew install perl
brew install cpanm
cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString
```
