#!/bin/bash

#if [ $# -ne 0 ]
#	then
#		echo 'Needs to supply argument'
#		echo '  $1 = <arg>'
#		exit 1
#fi

set -x

bomber scan --token=$(snyk config get api) --provider=snyk --username "Masa Ito" test.json 
