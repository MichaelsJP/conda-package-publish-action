FROM continuumio/miniconda3:4.9.2

LABEL "repository"="github.com/MichaelsJP/conda-package-publish-action"
LABEL "maintainer"="Julian Psotta <julianpsotta@gmail.com>"

RUN conda install -y anaconda-client conda-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
