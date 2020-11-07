#!/bin/bash

RG="openhack8pm8c3y5rg"
AZURE_WEBAPP_NAME="openhack8pm8c3y5userprofile"   # set this to your application's name

time az webapp deployment slot swap -g $RG -n $AZURE_WEBAPP_NAME  \
             --slot staging  --target-slot production