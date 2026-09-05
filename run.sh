#!/usr/bin/env bash

set -e

# Directory containing this script
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Find every .asm file, recursively
mapfile -d '' FILES < <(
    find "$ROOT" \
        -type f \
        -name "*.asm" \
        -not -path "$ROOT/build/*" \
        -print0 |
    sort -z
)

# Make sure there is something to run
if [ ${#FILES[@]} -eq 0 ]; then
    echo "No .asm files found."
    exit 1
fi

echo "Select an assembly file:"
echo

select FILE in "${FILES[@]#"$ROOT"/}" "Quit"; do
    if [[ "$FILE" == "Quit" ]]; then
        exit 0
    fi

    if [[ -n "$FILE" ]]; then
        break
    fi

    echo "Invalid selection."
done

# Convert relative path back into absolute path
FILE="$ROOT/$FILE"

# Output directory
BUILD="$ROOT/build"
mkdir -p "$BUILD"

# Get filename without .asm
NAME="$(basename "$FILE" .asm)"
BIN="$BUILD/$NAME.bin"

echo
echo "==> Assembling: $FILE"

nasm -f bin "$FILE" -o "$BIN"

echo "==> Created: $BIN"
echo "==> Starting QEMU..."
echo

qemu-system-i386 -drive format=raw,file="$BIN"
