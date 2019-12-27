#!/bin/bash

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

kubectl delete --all pods --force --grace-period=0

cd /home/oskar/gowork/src/github.com/smart-evolution/shapi

if [ ! -z "$SHAPI_V"  ]
then
        echo "===> updating shapi to verion=$SHAPI_V"
        sudo docker pull oszura/sh-panel-prod:$SHAPI_V
        git pull origin master
        git fetch --tags
        git checkout tags/$SHAPI_V
fi

make deploy

cd /home/oskar/gowork/src/github.com/smart-evolution/shpanel

if [ ! -z "$SHPANEL_V" ]
then
        echo "===> updating shpanel to verion=$SHPANEL_V"
        sudo docker pull oszura/sh-panel-prod:$SHPANEL_V
        git pull origin master
        git fetch --tags
        git checkout tags/$SHPANEL_V
fi

make deploy