#!/bin/bash

npm install
npm install hexo-wordcount --save
npm uninstall hexo-renderer-marked --save
npm install hexo-renderer-kramed --save
npm uninstall hexo-math --save
npm install hexo-renderer-mathjax --save

sed -i 's/<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>/<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.6/MathJax.js?config=TeX-MML-AM_CHTML"></script>/g' blog/node_modules/hexo-renderer-mathjax/mathjax.html