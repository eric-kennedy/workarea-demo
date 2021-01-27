#!/bin/bash

yarn run stylelint app/assets/stylesheets/**/*.scss --formatter json -o test.json || status=$?
cat test.json | node json-parser.js
exit $status