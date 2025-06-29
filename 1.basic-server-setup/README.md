# MCP Basic Server Setup

This folder contains a basic Model Context Protocol (MCP) server and client implementation demonstrating how to create and interact with MCP tools and resources.

## Technology Stack

- **MCP (Model Context Protocol)**: A protocol for AI assistants to interact with external data sources and tools
- **FastMCP**: A Python library for quickly building MCP servers
- **Python 3.11+**: Required for async/await support and modern Python features
- **uv**: Fast Python package manager and installer
- **asyncio**: For asynchronous programming and handling concurrent operations
- **nest_asyncio**: For running asyncio in environments that already have an event loop

## Project Structure

```
1.basic-server-setup/
├── server.py          # MCP server with tools and resources
├── client_stdio.py    # Client that connects to the server
└── README.md          # This file
```

## Setup Instructions

### 1. Install Dependencies

Using `uv` to install the project dependencies:

```bash
# Install uv if you haven't already
pip install uv

# Install project dependencies
uv sync
```

### 2. Run the MCP Server

The server provides:
- **Tools**: Functions that can be called by clients (e.g., `add` function)
- **Resources**: Dynamic content that can be accessed via URIs (e.g., `greeting://{name}`)

```bash
cd 1.basic-server-setup
uv run server.py
```

The server will start and listen for client connections via stdio.

### 3. Run the Client

In a separate terminal, run the client to interact with the server:

```bash
cd 1.basic-server-setup
uv run client_stdio.py
```

The client will:
1. Connect to the server via stdio
2. Initialize the connection
3. List available tools
4. Call the `add` tool with arguments `a=2` and `b=3`
5. Display the result

## How It Works

### Server (`server.py`)

The server uses FastMCP to create an MCP server with:

1. **Tools**: The `add` function that takes two integers and returns their sum
2. **Resources**: A dynamic greeting resource that generates personalized greetings

```python
@mcp.tool()
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b

@mcp.resource("greeting://{name}")
def get_greeting(name: str) -> str:
    """Get a personalized greeting"""
    return f"Hello, {name}!"
```

### Client (`client_stdio.py`)

The client demonstrates how to:

1. **Connect**: Establish a connection to the MCP server via stdio
2. **Initialize**: Set up the MCP session
3. **Discover**: List available tools and resources
4. **Execute**: Call tools with specific arguments
5. **Handle Results**: Process and display tool outputs

## Key Features

- **Asynchronous Communication**: Uses asyncio for non-blocking I/O
- **Type Safety**: Leverages Python type hints for better development experience
- **Extensible**: Easy to add new tools and resources
- **Standard Protocol**: Follows the MCP specification for interoperability

## Next Steps

- Add more complex tools with different parameter types
- Implement resource providers for external data sources
- Add error handling and validation
- Create a more sophisticated client with interactive features
- Explore other MCP transport methods (TCP, WebSocket, etc.)

## Troubleshooting

- **Python Version**: Ensure you're using Python 3.11 or higher
- **Dependencies**: Run `uv sync` to ensure all dependencies are installed
- **Permissions**: Make sure you have execute permissions on the Python files
- **Working Directory**: Run commands from the `1.basic-server-setup` directory
- **uv Environment**: Use `uv run` instead of `python` to execute scripts within the uv environment

## Learn More

- [MCP Specification](https://modelcontextprotocol.io/)
- [FastMCP Documentation](https://github.com/jlowin/fastmcp)
- [Python asyncio Documentation](https://docs.python.org/3/library/asyncio.html) 