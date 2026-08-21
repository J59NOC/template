#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]
then
	echo "Usage: $0 {repository_name}" 1>&2
	echo "ex. $ $0 overall" 1>&2
	exit 1
fi

REPO="J59NOC/$1"
gh repo view "${REPO}" --json nameWithOwner --jq '.nameWithOwner' >/dev/null

echo "Adding J59NOC/j59noc team to ${REPO}..."
gh api \
	--method PUT \
	-H 'Accept: application/vnd.github+json' \
	"/orgs/J59NOC/teams/j59noc/repos/${REPO}" \
	-f permission='maintain'

echo "J59NOC/j59noc team was added to ${REPO}."
