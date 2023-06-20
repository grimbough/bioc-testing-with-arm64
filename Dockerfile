FROM ghcr.io/bioconductor/bioconductor:devel-arm64

RUN Rscript -e "install.packages('tinytex')" \
            -e "tinytex::install_tinytex(extra_packages = c( \
                'bera', 'caption', 'changepage', 'enumitem', 'fancyhdr', \
                'footmisc', 'marginfix', 'mathtools', 'nowidow', 'parnotes', \
                'parskip', 'placeins', 'ragged2e', 'soul', 'titlesec', 'xstring', \
                'preprint', 'courier' \
              ))"

ENV PATH="${PATH}:/root/.TinyTex/bin/"

ENTRYPOINT ["R"]
