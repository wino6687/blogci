#!/bin/bash

# we don't need to distinguish between osx and linux 
# actions are same for both OS's 
source $HOME/miniconda/bin/activate
export PATH="$HOME/miniconda/bin:$PATH"
conda activate env
python -m pytest -v --cov=test_module