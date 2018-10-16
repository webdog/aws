#!/usr/bin/env bats

function setup() {
  export KUBE_CONFIG_DATA=aGVsbG8gd29ybGQK
  # Override PATH to mock out the aws cli
  export PATH="$BATS_TEST_DIRNAME/bin:$PATH"
  # Ensure GITHUB_WORKSPACE is set
  export GITHUB_WORKSPACE="."
  export HOME="."
}

@test "entrypoint runs successfully" {
  run $GITHUB_WORKSPACE/entrypoint.sh
  [ "$status" -eq 0 ]
}
