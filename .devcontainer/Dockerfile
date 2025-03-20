FROM ubuntu:24.04

LABEL description="LaTeX compilation environment with Japanese support"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir

RUN apt-get update && apt-get install -y \
    texlive-lang-japanese \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-extra-utils \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-bibtex-extra \
    texlive-humanities \
    biber \
    latexmk \
    latexdiff \
    language-pack-ja \
    evince \
    xdvik-ja \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    # wget \
    # make \
    # perl \
    # locales \

# # Set locale
# RUN locale-gen en_US.UTF-8 ja_JP.UTF-8
# ENV LANG=en_US.UTF-8
# ENV LANGUAGE=en_US:en
# ENV LC_ALL=en_US.UTF-8

# # Initialize
# RUN kanji-config-updmap-sys auto
# # RUN tlmgr init-usertree \
# #     && wget -q https://mirror.ctan.org/systems/texlive/tlnet/update-tlmgr-latest.sh \
# #     && sh update-tlmgr-latest.sh \
# #     && tlmgr update --self --all

# # install tex-fmt based on architecture
# RUN arch=$(uname -m) && \
#     if [ "$arch" = "x86_64" ]; then \
#         wget -q https://github.com/WGUNDERWOOD/tex-fmt/releases/download/v0.5.2/tex-fmt-x86_64-linux.tar.gz && \
#         tar -xzvf tex-fmt-x86_64-linux.tar.gz && \
#         mv tex-fmt /usr/local/bin/ && \
#         rm -f tex-fmt-x86_64-linux.tar.gz; \
#     elif [ "$arch" = "aarch64" ] || [ "$arch" = "arm64" ]; then \
#         echo "ARM64 architecture detected, skipping tex-fmt installation as it's not available for ARM64"; \
#     else \
#         echo "Unsupported architecture: $arch"; \
#         exit 1; \
#     fi

# VOLUME ["/workdir"]

# CMD ["bash"]

# # 必要なPerlモジュールがある場合はコメントを外す
# # RUN apt-get update && apt-get install -y cpanminus \
# #     && cpanm Log::Log4perl Log::Dispatch::File YAML::Tiny File::HomeDir Unicode::GCString \
# #     && apt-get clean \
# #     && rm -rf /var/lib/apt/lists/*
