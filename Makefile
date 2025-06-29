.PHONY: setup install clean run test help server server-debug

# Default target
help:
	@echo "Available commands:"
	@echo "  setup        - Install uv and set up the project environment"
	@echo "  install      - Install project dependencies using uv"
	@echo "  run          - Run the hello_world.py script"
	@echo "  server       - Run the MCP server"
	@echo "  server-debug - Run the MCP server with debug output"
	@echo "  test         - Run tests (if any)"
	@echo "  clean        - Clean up generated files"
	@echo "  help         - Show this help message"

# Setup uv and project environment
setup:
	@echo "Setting up uv and project environment..."
	@if ! command -v uv > /dev/null 2>&1; then \
		echo "Installing uv..."; \
		curl -LsSf https://astral.sh/uv/install.sh | sh; \
		echo "Please restart your shell or run 'source ~/.bashrc' to use uv"; \
	else \
		echo "uv is already installed"; \
	fi
	@echo "Creating pyproject.toml if it doesn't exist..."
	@if [ ! -f pyproject.toml ]; then \
		uv init --name mcp_playground --python 3.11; \
	fi
	@echo "Setup complete! Run 'make install' to install dependencies."

# Install dependencies
install:
	@echo "Installing dependencies with uv..."
	uv sync

# Clean up generated files
clean:
	@echo "Cleaning up..."
	rm -rf __pycache__/
	rm -rf .pytest_cache/
	rm -rf .uv/
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true 