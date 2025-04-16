.PHONY: test build upload clean

# Default Python command - using uvx for consistent environment
PYTHON_CMD := uvx

# Test target: runs the tests with pytest
test:
	$(PYTHON_CMD) pytest

# Build target: rebuilds the package (depends on test)
build: test clean
	$(PYTHON_CMD) --from build pyproject-build

# Upload target: uploads the build to PyPI
upload: build
	$(PYTHON_CMD) twine upload dist/*

# Upload to TestPyPI
upload-test: build
	$(PYTHON_CMD) twine upload --repository-url https://test.pypi.org/legacy/ dist/*

# Clean build artifacts
clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info/
	find . -type d -name __pycache__ -exec rm -rf {} +

# Install in development mode
dev:
	$(PYTHON_CMD) pip install -e .

# Help target
help:
	@echo "Available targets:"
	@echo "  test       - Run tests with pytest"
	@echo "  build      - Build package distribution files (depends on test)"
	@echo "  upload     - Upload package to PyPI (depends on build)"
	@echo "  upload-test - Upload package to TestPyPI (depends on build)"
	@echo "  clean      - Remove build artifacts"
	@echo "  dev        - Install package in development mode"
	@echo "  help       - Show this help message" 