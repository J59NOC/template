#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 {repository_name}" 1>&2
	echo "ex. $ $0 overall" 1>&2
	exit
fi

# 対象のリポジトリを指定
REPO="J59NOC/$1"

for row in $(jq -r '.[] | @base64' labels.json); do
  _jq() {
    echo ${row} | base64 --decode | jq -r ${1}
  }

  name=$(_jq '.name')
  color=$(_jq '.color')
  description=$(_jq '.description')

  gh label create ${name} -c "${color}" -d "${description}" -R ${REPO}
done
