#!/bin/bash
set -x
set -e

export PATH=/opt/conda/bin:$PATH

pip install -U jupyterhub==0.8.1