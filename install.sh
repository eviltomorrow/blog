#!/bin/bash

npm install
npm install hexo-wordcount --save
npm uninstall hexo-renderer-marked --save
npm install hexo-renderer-kramed --save
npm uninstall hexo-math --save
npm install hexo-renderer-mathjax --save


# 文件：blog/node_modules/hexo-renderer-mathjax/mathjax.html
# 替换 
# 	<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
# 	=》 
# 	<script src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.6/MathJax.js?config=TeX-MML-AM_CHTML"></script>/g' 
