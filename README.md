# Japanese LaTeX Template

## Features

- latexmk
- latexdiff
- automatically build & deploy using GitHub Actions

## Setup

```
$ git config --local include.path ../.gitconfig
```

If you want to deploy compiled pdf files to a specific server,
add following line to `.github/workflows/main.yml`.
```
rsync -acvz --delete ./build/main.pdf user@remote:/path/to/deploy/
```

And add `KNOWN_HOSTS` and `SSH_KEY` secret entries to your repository (Repository->Settings->Secrets).
For details, see instructions of [Install SSH Key](https://github.com/marketplace/actions/install-ssh-key)
