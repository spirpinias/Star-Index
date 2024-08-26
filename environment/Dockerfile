# hash:sha256:b1bff7638f4b28deb2c11d2dee7f554115f3f29a5dd1f19e98f76015b7ff0dc2
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20211016ubuntu0.22.04.1 \
        git=1:2.34.1-1ubuntu1.8 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda --channel=conda-forge \
        star==2.7.10b \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.1.3
