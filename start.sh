#!/bin/bash
trap 'kill $TAILWIND_PID 2>/dev/null' EXIT
tailwindcss -i ./styles/input.css -o ./static/styles.css --watch &
TAILWIND_PID=$!
zola serve
