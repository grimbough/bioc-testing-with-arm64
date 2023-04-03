FROM --platform=linux/arm64 bioconductor/bioconductor_docker:RELEASE_3_16

RUN Rscript -e "install.packages('tinytex')" \
            -e "tinytex::install_tinytex(extra_packages = c( \
                'bera', 'caption', 'changepage', 'enumitem', 'fancyhdr', \
                'footmisc', 'marginfix', 'mathtools', 'nowidow', 'parnotes', \
                'parskip', 'placeins', 'ragged2e', 'soul', 'titlesec', 'xstring', \
                'preprint', 'courier' \
              ))"

ENTRYPOINT ["R"]
