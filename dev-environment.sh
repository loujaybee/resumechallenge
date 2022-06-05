#!/bin/bash

hugo --gc --minify --buildFuture -b $(gp url 3000) \
&& python3 -m http.server 3000 --directory public