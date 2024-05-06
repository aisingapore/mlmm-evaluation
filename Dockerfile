FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime

ARG DEBIAN_FRONTEND=noninteractive

RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash
RUN apt-get update && \
    apt-get install -y \
        git \
        git-lfs

RUN git clone -b feat-docker https://github.com/aisingapore/mlmm-evaluation.git mlmm_evaluation
WORKDIR /workspace/mlmm_evaluation
RUN pip install -r requirements.txt

ENTRYPOINT ["/workspace/mlmm_evaluation/entrypoint.sh"]
