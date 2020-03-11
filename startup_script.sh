#!/bin/bash

HUBOT_SLACK_TOKEN=$(jq -r .key slack_api_key.json) ./bin/hubot --adapter slack

