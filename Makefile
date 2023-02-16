.PHONY: publish
publish:
	docker run --rm -it \
		-v "$$HOME/.npmrc:/home/node/.npmrc:ro" \
		-v "$$(pwd):/app" \
		-w /app \
		--entrypoint sh \
		"$$(docker build -q .)" \
		-c 'npm ci && npm publish'
