#!/bin/bash

if [ $# -ne 2 ]
	then
		echo 'Needs to supply argument'
    echo '  $1 = Snyk username (i.e. "Masa Ito")'
		echo '  $2 = SBOM file'
		exit 1
fi

# set -x

USERNAEME=${1}
SBOM=${2}

bomber scan --token=$(snyk config get api) --provider=snyk --username "${USERNAME}" ${SBOM}
