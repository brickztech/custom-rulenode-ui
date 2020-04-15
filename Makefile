# Import and expose environment variables
cnf ?= .env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))


.PHONY: init-purge

help:
	@echo
	@echo "Usage: make TARGET"
	@echo
	@echo "$(APP_NAME) project automation helper"
	@echo
	@echo "Targets:"
	@echo "    init-purge    clean up generated code"
	@echo "    dev-build     build development image"
	@echo "    prod-build    build production files"



# Remove the generated code, use this before re-running the `init` target
init-purge:
	sudo rm -rf ./target/generated-resources


# Build development image
dev-build:
	docker build --build-arg app_name=$(APP_NAME) -t $(IMAGE_NAME) .

# Build production
prod-build:
	docker run --rm -v $(PWD):/usr/src/$(APP_NAME) -v /usr/src/$(APP_NAME)/node_modules $(IMAGE_NAME) npm run build
	cp ./target/generated-resources/public/static/custom-nodes-config.js $(TARGET_DIR)