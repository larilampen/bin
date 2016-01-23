#!/bin/bash

# Fix special characters often broken in filenames from certain file hosting sites.

mv -i $1 `echo $1 | sed 's/[_\%]28/\(/g' | sed 's/[_\%]29/\)/g' | sed "s/[_\%]27/\'/g"`
