.PHONY: generate test validate

generate:
	./scripts/generate.sh

validate:
	./scripts/validate.sh

test:
	./scripts/generate.sh --check
	./scripts/validate.sh
	./tests/test-external-validation.sh
