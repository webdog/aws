#!/bin/sh

set -e

# Respect AWS_DEFAULT_REGION if specified
[ -n "$AWS_DEFAULT_REGION" ] || export AWS_DEFAULT_REGION=us-east-1

# Respect AWS_DEFAULT_OUTPUT if specified
[ -n "$AWS_DEFAULT_OUTPUT" ] || export AWS_DEFAULT_OUTPUT=json

# Execute and preserve output
sh -c "aws $*" > "${HOME}/${GITHUB_ACTION}.${AWS_DEFAULT_OUTPUT}"

# Capture exit code
status=$?

# Echo the preservered output
cat "${HOME}/${GITHUB_ACTION}.${AWS_DEFAULT_OUTPUT}"

# Exit with captured exit code
exit $status