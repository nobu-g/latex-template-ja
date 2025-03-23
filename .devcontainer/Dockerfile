FROM ubuntu:24.04

ARG USERNAME=ubuntu

LABEL description="LaTeX compilation environment with Japanese support"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q && apt-get install -y --no-install-recommends \
    texlive-lang-japanese \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    # texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-humanities \
    biber \
    latexmk \
    latexdiff \
    language-pack-ja \
    git \
    wget \
    make \
    perl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure Japanese locale
RUN apt-get -q update && apt-get install -yq --no-install-recommends \
    locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="en_US" \
    LC_ALL="ja_JP.UTF-8"
RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

# install tex-fmt based on architecture
RUN arch=$(uname -m) && \
    if [ "$arch" = "x86_64" ]; then \
        wget -q https://github.com/WGUNDERWOOD/tex-fmt/releases/download/v0.5.2/tex-fmt-x86_64-linux.tar.gz && \
        tar -xzvf tex-fmt-x86_64-linux.tar.gz && \
        mv tex-fmt /usr/local/bin/ && \
        rm -f tex-fmt-x86_64-linux.tar.gz; \
    elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then \
        echo "ARM64 architecture detected, skipping tex-fmt installation as it's not available for ARM64"; \
    else \
        echo "Unsupported architecture: $arch"; \
        exit 1; \
    fi

# Install Perl modules
RUN apt-get update -q && apt-get install -y cpanminus \
    && cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Initialize
RUN kanji-config-updmap-sys auto
# RUN tlmgr init-usertree \
#     && wget -q https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh \
#     && sh update-tlmgr-latest.sh \
#     && tlmgr update --self --all

# Switch to non-root user
USER $USERNAME
WORKDIR /home/$USERNAME

CMD ["bash"]
