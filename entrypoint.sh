#!/bin/bash

set -euo pipefail

[ -d datasets/m_arc ] || git clone "https://${HF_USER}:${HF_TOKEN}@huggingface.co/datasets/aisingapore/m_arc" datasets/m_arc
[ -d datasets/m_hellaswag ] || git clone "https://${HF_USER}:${HF_TOKEN}@huggingface.co/datasets/aisingapore/m_hellaswag" datasets/m_hellaswag
[ -d datasets/m_mmlu ] || git clone "https://${HF_USER}:${HF_TOKEN}@huggingface.co/datasets/aisingapore/m_mmlu" datasets/m_mmlu

python main.py "$@"
