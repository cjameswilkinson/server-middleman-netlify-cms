#!/bin/bash

cd /var/www/--directory of your middleman site--

git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

if [ "$HEADHASH" != "$UPSTREAMHASH" ]
then
  git reset origin/master --hard
  echo '****STARTING DEPLOY****'
  echo `date '+%Y-%m-%d %H:%M:%S'`
  git pull 2>&1
  /home/ec2-user/.rvm/gems/ruby-2.4.5/wrappers/middleman build 2>&1
  echo '****ENDING DEPLOY****'
  exit 0
fi
