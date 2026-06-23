#!/usr/bin/env bash
set -euo pipefail

export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export BUNDLE_PATH="${BUNDLE_PATH:-vendor/bundle}"

bundle exec jekyll serve --livereload
