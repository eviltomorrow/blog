build:
	rm -rf public
	hexo generate

server: build
	hexo server