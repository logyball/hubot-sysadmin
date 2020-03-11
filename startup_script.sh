#!/bin/bash

HUBOT_SLACK_TOKEN=$(/usr/bin/jq -r .key /home/pi/hubot-sysadmin/slack_api_key.json) /home/pi/hubot-sysadmin/bin/hubot --adapter slack
