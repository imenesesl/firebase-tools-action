#!/bin/sh -l

set -e

if [ -z "$FIREBASE_TOKEN" ]; then
  echo "Either FIREBASE_TOKEN is required to run commands with the firebase cli"
  exit 126
fi

if [ -z "$PROJECT_ID" ]; then
  echo "Either PROJECT_ID is required"
  exit 126
fi

if [ -n "$PROJECT_PATH" ]; then
  cd "$PROJECT_PATH"
fi

if [ -n "$PROJECT_ID" ]; then
    echo "setting firebase project to $PROJECT_ID"
    firebase use --add "$PROJECT_ID"
fi

sh -c "firebase $*"
