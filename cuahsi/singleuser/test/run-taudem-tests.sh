#!/bin/bash 

# This is a script for running the taudem tests

# get the taudem test data from github
git clone https://github.com/dtarb/TauDEM-Test-Data.git; git pull

# move the custom test cases into this directory
cp taudem-tests.sh TauDEM-Test-Data/Input/taudem-tests.sh
chmod +x TauDEM-Test-Data/Input/taudem-tests.sh


docker run --rm -u root -ti -v $(pwd)/TauDEM-Test-Data:/tmp -v $(pwd)/prepare-test-env.sh:/tmp/prepare-test-env.sh cuahsi/singleuser \
/bin/bash -c "cd /tmp; ./prepare-test-env.sh; cd /tmp/Input; ./taudem-tests.sh"

# remove Testdata
rm -rf $(pwd)/TauDEM-Test-Data


