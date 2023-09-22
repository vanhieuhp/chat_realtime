#!/bin/bash

npm install
npm run build

docker build . -t vanhieuit10/chat-realtime:fe-v1
docker push vanhieuit10/chat-realtime:fe-v1