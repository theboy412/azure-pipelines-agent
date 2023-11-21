.PHONY: test lint build-docker

test:
	@echo "➡️ Running Prettier..."
	npx --yes prettier@2.8.8 --editorconfig --check .

	@echo "➡️ Running Hadolint..."
	find . -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;

lint:
	@echo "➡️ Running Prettier..."
	npx --yes prettier@2.8.8 --editorconfig --write .

	@echo "➡️ Running Hadolint..."
	find . -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;

build-docker:
	bash cicd/docker-build-local.sh
