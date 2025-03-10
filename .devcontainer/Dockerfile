FROM ubuntu:24.04

LABEL description="LaTeX compilation environment with Japanese support"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    texlive-lang-japanese \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    latexmk \
    language-pack-ja \
    evince \
    xdvik-ja \
    git \
    make \
    perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# RUN tlmgr init-usertree
RUN kanji-config-updmap-sys ipaex

WORKDIR /workdir

VOLUME ["/workdir"]

CMD ["bash"]

# 必要なPerlモジュールがある場合はコメントを外す
# RUN apt-get update && apt-get install -y cpanminus \
#     && cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
