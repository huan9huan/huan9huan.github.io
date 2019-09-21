cd /root
./certbot-auto certonly --webroot -w /var/www/huan9huan/build/ -d huan9huan.com

## verify
ls /etc/letsencrypt/live/huan9huan.com/
