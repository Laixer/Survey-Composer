#!/bin/bash

REPOSITORY=braynz-online-platform
BRANCH=$1
DIRREP="../$REPOSITORY"
ORIGIN="origin"

# Check if repository directory exist
if [ ! -d $DIRREP ]; then
  echo "Checkout repository before deployment"
  exit 1
fi

# Check if branch is supplied
if [ -z $BRANCH ]; then
  echo "First argument must be branch name"
  exit 1
fi

# Checkout branch
pushd $DIRREP
git fetch $ORIGIN
git checkout .
git checkout $BRANCH
git checkout .
git pull $ORIGIN $BRANCH
popd

# Denote version
rm -rf .env VERSION
GIT_VERSION=`git --git-dir="$DIRREP/.git" describe --tags --always`
echo $GIT_VERSION > VERSION
cat > .env <<EOL
# Autogenerated config file
# < DO NOT EDIT THIS FILE >
VERSION=${GIT_VERSION}
EOL
cp VERSION $DIRREP

systemctl stop docker-compose-app
/usr/local/bin/docker-compose build
systemctl start docker-compose-app

# Remove unused containers
docker image prune -f

echo ""
echo ">> Deploy done, ${GIT_VERSION} is live"

/usr/local/bin/docker-compose ps