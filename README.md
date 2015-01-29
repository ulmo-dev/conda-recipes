# ulmo conda-recipes

conda recipes for ulmo and any pypi dependencies not currently
available in the anaconda distribution

running build.sh builds ulmo and dependencies for all platforms
(linux-32, linux-64, win-32, win-64 and osx-64) and uploads them
to the ulmo binstar channel: https://binstar.org/ulmo 

Building for all platforms from works because the dependencies 
are pure python. Other more complicated dependencies are already
available in conda.

Note: 
    you must be a member of the ulmo binstar org for the upload 
    to work

To install ulmo using conda type:

conda install -c https://conda.binstar.org/ulmo ulmo
