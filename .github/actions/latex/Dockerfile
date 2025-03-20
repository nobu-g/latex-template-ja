FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    python3 \
    latexmk \
    lmodern \
    texlive \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-lang-japanese \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mktexlsr
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
