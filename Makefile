all:
	@echo "Available targets:"
	@echo "- deploy"

deploy:
	zola build
