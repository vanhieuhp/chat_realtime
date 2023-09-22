#!/bin/bash

npm install

docker build . -t vanhieuit10/chat-realtime:be-v1
docker push vanhieuit10/chat-realtime:be-v1