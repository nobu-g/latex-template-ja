FROM ubuntu:24.04

LABEL description="LaTeX compilation environment with Japanese support"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-lang-japanese \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-humanities \
    latexmk \
    latexdiff \
    language-pack-ja \
    evince \
    xdvik-ja \
    git \
    wget \
    make \
    perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Initialize
RUN kanji-config-updmap-sys ipaex \
    && tlmgr init-usertree \
    && wget -q https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh \
    && sh update-tlmgr-latest.sh \
    && tlmgr update --self --all

# install tex-fmt
RUN wget -q https://github.com/WGUNDERWOOD/tex-fmt/releases/download/v0.5.2/tex-fmt-x86_64-linux.tar.gz \
    && tar -xzvf tex-fmt-x86_64-linux.tar.gz \
    && mv tex-fmt /usr/local/bin/ \
    && rm -f tex-fmt-x86_64-linux.tar.gz

VOLUME ["/workdir"]

CMD ["bash"]

# 必要なPerlモジュールがある場合はコメントを外す
# RUN apt-get update && apt-get install -y cpanminus \
#     && cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
