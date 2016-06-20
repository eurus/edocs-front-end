#!/bin/bash
jekyll build
qrsync ./config-qiniu.json
