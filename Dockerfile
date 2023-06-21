ARG BASE_IMAGE=ghcr.io/bioconductor/bioconductor
FROM ${BASE_IMAGE}:devel-arm64 AS base-arm64
FROM ${BASE_IMAGE}:devel-amd64 AS base-amd64

# Set automatically when building with --platform
ARG TARGETARCH
ENV TARGETARCH=${TARGETARCH:-amd64}

run echo ${TARGETARCH}

FROM ghcr.io/bioconductor/bioconductor:devel-${TARGETARCH}

RUN Rscript -e "install.packages('tinytex')" \
            -e "tinytex::install_tinytex(extra_packages = c( \
                'bera', 'caption', 'changepage', 'enumitem', 'fancyhdr', \
                'footmisc', 'marginfix', 'mathtools', 'nowidow', 'parnotes', \
                'parskip', 'placeins', 'ragged2e', 'soul', 'titlesec', 'xstring', \
                'preprint', 'courier' \
              ))"

ENV PATH="${PATH}:/root/.TinyTeX/bin/aarch64-linux/"

ENTRYPOINT ["R"]
