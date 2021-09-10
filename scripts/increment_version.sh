#!/usr/bin/env bash

tag=`git tag | sort --version-sort | tail -n1`

if [[ "" == "$tag" ]]
then
  next_version=0.1.0
else
  python <<END
version = "$tag"
parts = version.strip().split('.')
parts[1] = str(int(parts[1]) + 1)
print('.'.join(parts))
END
fi

git tag $next_version
git push --tags

echo $next_version
