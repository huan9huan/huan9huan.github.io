#!/bin/bash
env="$1"
server=root@v1
echo "use server ${server}";

echo ">>>>> Step1 : build"
pushd .
cd `dirname $0`/..
yarn build
ts=`date +%Y%m%d-%H%M%S`
zipfile=${ts}.zip

echo ">>>>> Step 2: package..."
find ./public |grep .DS_Store |xargs rm
cd public
zip -r ../${zipfile} *
cd ..

echo ">>>>> Step 3: release in remote server..."
remotedir=/var/www/huan9huan/${ts}
ssh ${server} "mkdir -p ${remotedir}"
scp ${zipfile} ${server}:${remotedir}
ssh ${server} "cd ${remotedir}; unzip ./${zipfile}; cd ..; rm ./build; ln -s ${ts} ./build"

echo ">>>> step 4: done and clean, version is ${ts}!"
rm ./${zipfile}
popd