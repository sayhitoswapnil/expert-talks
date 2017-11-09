#!/bin/bash
cd /usr/local/src/myscripts/misc-scripts
echo "Checkout branch:$1"
git checkout -b $1
git pull origin $1
echo "Pulling for SHA code:$2"
git checkout $2
echo "Starting execution for R script:$3"
echo "Input Path:$4"
echo "Output path:$5"
Rscript $3 $4 $5
