#!/bin/bash

# build ulmo dependencies on one platform, convert them to other platforms using conda 
# convert and upload them to the binstar ulmo organization
# Note: this is possible because major ulmo dependencies are already available in conda, the 
# ones in this package are pure python and can be converted with conda convert.

# order of pkgs matters for dependency resolution
declare -a pkgs=('appdirs' 'beautifulsoup4' 'isodate' 'python-dateutil' 'urllib3' 'httpretty' 'freezegun' 'suds' 'ulmo')

for pkg in "${pkgs[@]}"
do
    echo 'Building' $pkg
    pkg_path=`conda build $pkg --output`
    conda build $pkg
    echo 'Converting to other platforms'
    conda convert $pkg_path -o ./build -p all
done

#upload files to binstar ulmo organization
for file in `find ./build -name '*.tar.bz2'`
do
    echo 'Uploading' $file
    binstar upload -u ulmo $file --force
done