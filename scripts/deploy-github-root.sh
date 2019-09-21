#!/bin/bash
server=root@d2
remote=/etc/nginx/conf.d;
conf=huan9huan.com.conf

pushd .
echo "scp nginx conf to ${server} ..."
ssh $server "mkdir -p /logs/huan9huan;mkdir -p /var/www/huan9huan/build/"
scp conf/${conf} ${server}:${remote}

echo "reload the nginx..."
ssh ${server} "/etc/init.d/nginx reload"

popd