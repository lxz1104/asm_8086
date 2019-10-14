#!/bin/bash

rm -rf ~/ms-dos

echo '=> The default config: '
conf_name=$(ls ~/.dosbox)
echo $conf_name


cp -f ./config/dosbox.conf.bak ~/.dosbox/$conf_name

echo '=> Uninstall success!!'
