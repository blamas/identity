#!/usr/bin/env -S just --justfile

set quiet
set shell := ['bash', '-euo', 'pipefail', '-c']

[doc('Serve the site locally with live reload')]
serve:
    zola serve

[doc('Build the site into public/')]
build:
    zola build

[doc('Check internal links and templates')]
check:
    zola check --skip-external-links

[doc('Format and lint the whole repo')]
fmt:
    lefthook run pre-commit --all-files --no-stage-fixed

[doc('Lint the whole repo and fail if any formatter changes a file')]
lint:
    lefthook run pre-commit --all-files --no-stage-fixed --fail-on-changes

[private]
default:
    just --list
