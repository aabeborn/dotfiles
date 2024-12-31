
#!/bin/bash

# Check if the system is macos
is_macos() {
    if [[ "$(uname)" == "Darwin" ]]; then
        return 0
    fi
    return 1
}

# Check if mas is installed
check_mas () {
    if command -v mas &> /dev/null; then
        return 0
    fi
    echo "❌ Error: mas is not installed."
    exit 1
}