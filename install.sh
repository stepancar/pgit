#!/bin/bash

# pgit installer script

set -e

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="pgit"

echo "Installing pgit..."

# Check if running with sufficient privileges
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Installing to $INSTALL_DIR requires sudo privileges."
    echo "You may be prompted for your password."
    sudo cp "$SCRIPT_NAME" "$INSTALL_DIR/"
    sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
else
    cp "$SCRIPT_NAME" "$INSTALL_DIR/"
    chmod +x "$INSTALL_DIR/$SCRIPT_NAME"
fi

echo "✓ pgit installed successfully to $INSTALL_DIR"
echo ""
echo "You can now use 'pgit' from anywhere in your terminal."
echo ""
echo "Quick start:"
echo "  pgit checkout -b my-feature    # Create parallel branch"
echo "  pgit branch                    # List parallel branches"
echo ""
echo "For more information, see: https://github.com/your-repo/pgit"