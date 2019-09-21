#!/bin/bash
server=v1

rootdir='~/huan9huan'
workdir=${rootdir}/packages/blog

branch=`git branch |grep '*'|awk '//{print $2}'`
echo "branch as ${branch}"

re=".*/v(.*)$"
if [[ $branch =~ $re ]]; then
version=${BASH_REMATCH[1]}
else
version=0.1
fi

echo "pull code ..."
ssh ${server} "cd ${workdir}; git pull origin ${branch}:${branch};git checkout ${branch};"
echo "code done..."

echo "rebuild the static ..."
ssh ${server} "cd ${workdir}; yarn install;yarn build"
echo "build done..."

echo "link to this nginx"
ssh ${server} "rm  -fr /var/www/huan9huan/build; cd ${workdir}; cp -r ${workdir}/public /var/www/huan9huan/build"
echo "link done, please update your page"