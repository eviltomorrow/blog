build:
	rm -rf public
	hexo generate

run:
	hexo server

pub:
	@blog-deploy