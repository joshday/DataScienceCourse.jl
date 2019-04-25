#!/bin/bash

for file in notebooks/*.ipynb
do
    jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace $file
done