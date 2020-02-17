#!/bin/bash

sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf

kubectl delete --all pods --force --grace-period=0

if [ ! -z "$SHAPI_V"  ]
then
        cd /home/oskar/gowork/src/github.com/smart-evolution/shapi
        echo "===> updating shapi to version=$SHAPI_V"
        sudo docker pull oszura/sh-panel-prod:$SHAPI_V
        git pull origin master
        git fetch --tags
        git checkout tags/$SHAPI_V
        sed -e "s|NOTIFIER_URL|$SLACK_NOTIFIER_URL|g;s|VERSION|$SHAPI_V|g;s|SH_PANEL_CONFIGCAT_VALUE|$SH_PANEL_CONFIGCAT_VALUE|g" ./kubernetes/deployment.yaml | kubectl apply -f -
        kubectl apply -f ./kubernetes/service.yaml
fi

if [ ! -z "$SHPANEL_V" ]
then
        cd /home/oskar/gowork/src/github.com/smart-evolution/shpanel
        echo "===> updating shpanel to version=$SHPANEL_V"
        sudo docker pull oszura/sh-panel-prod:$SHPANEL_V
        git pull origin master
        git fetch --tags
        git checkout tags/$SHPANEL_V
        sed -e "s|NOTIFIER_URL|$SLACK_NOTIFIER_URL|g;s|VERSION|$SHPANEL_V|g;s|SH_PANEL_CONFIGCAT_VALUE|$SH_PANEL_CONFIGCAT_VALUE|g" ./kubernetes/deployment.yaml | kubectl apply -f -
        kubectl apply -f ./kubernetes/service.yaml
fi
