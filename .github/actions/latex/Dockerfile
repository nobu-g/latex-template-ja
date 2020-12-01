FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
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
  && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN mktexlsr
COPY entrypoint.sh /
RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
