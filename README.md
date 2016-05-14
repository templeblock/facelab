# facelab
face filter sandbox

TRAVIS: [![Build Status](https://travis-ci.org/headupinclouds/facelab.svg?branch=master)](https://travis-ci.org/headupinclouds/facelab)

APPVEYOR: [![Build status](https://ci.appveyor.com/api/projects/status/7ulu4qwhu2fb2jsy?svg=true)](https://ci.appveyor.com/project/headupinclouds/facelab)

LICENSE
=======

This SW is released under both 3-clause BSD and Boost licenses.  Note that this SW uses OpenCV.  Please see relevant license files for that project.

HOWTO
=====

# Install latest Polly toolchains and scripts for cmake (not needed but very easy)
```
wget https://github.com/ruslo/polly/archive/master.zip
unzip master.zip
POLLY_ROOT="`pwd`/polly-master"
export PATH="${POLLY_ROOT}/bin:${PATH}"
```

# Build
```
build.py --toolchain libcxx --install --reconfig --verbose
```





