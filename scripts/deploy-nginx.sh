#!/bin/bash
env="$1"
server=root@v1
remote=/etc/nginx/conf.d;

pushd .
cd `dirname $0`/..
echo "scp nginx conf to ${server} ..."
ssh $server "mkdir -p /logs/huan9huan"
scp conf/${env}/blog.conf ${server}:${remote}

echo "reload the nginx..."
ssh ${server} "/etc/init.d/nginx reload"

echo "reload the nginx..."
ssh ${server} "/etc/init.d/nginx reload"
echo "done!"
popd