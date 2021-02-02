# Japanese LaTeX Template

## Features

- latexmk
- latexdiff
- GitHub Actions
  - build pdf
  - release pdf
  - deploy pdf to a specific server over ssh

## Requirements
- TexLive
  - (macOS) `brew install --cask mactex-no-gui`

## Setup

```
$ git config --local include.path ../.gitconfig
```

If you want to deploy compiled pdf files to a specific server,
add following line to `.github/workflows/main.yml`.
```
rsync -acvz --delete ./build/main.pdf user@remote:/path/to/deploy/
```

Also, you need to add `KNOWN_HOSTS` and `SSH_KEY` secret entries to your repository (Repository->Settings->Secrets).
For details, see instructions of [Install SSH Key](https://github.com/marketplace/actions/install-ssh-key)
