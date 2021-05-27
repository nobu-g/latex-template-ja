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

```
$ git config --local include.path ../.gitconfig
$ npm install
```

If you want to deploy compiled pdf files to a specific server,
add following line to `.github/workflows/main.yml`.
```
rsync -acvz --delete ./build/main.pdf user@remote:/path/to/deploy/
```

Also, you need to add `KNOWN_HOSTS` and `SSH_KEY` secret entries to your repository (Repository->Settings->Secrets).
For details, see instructions of [Install SSH Key](https://github.com/marketplace/actions/install-ssh-key)
- `KNOWN_HOSTS`: Host information whose format is the same as known_hosts file. Run `ssh-keyscan <host>` to get value.
- `SSH_KEY`: SSH private key.

## Usage
- build
    ```
    $ latexmk
    ```
- lint
    ```
    $ npm run -s lint
    ```


## FAQ
- LaTeX indent not working
  - Run:

    ```
    brew install perl
    brew install cpanm
    cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString
    ```
