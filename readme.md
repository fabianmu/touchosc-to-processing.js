# Dirty hack to get data from TouchOSC via node.js and socket.io into processing.js

Cause it's fun!

# Installation

1. Clone
2. Run `npm install`
3. Get [TouchOSC](http://hexler.net/software/touchosc)
4. Start the node-server, `foreman start`
5. Sync matrix-8x8.touchosc using TouchOSC Editor to your iPad
6. Setup the "OSC" Connection, set outgoing port to 3333 and incoming port to 9090 and make sure to set your "servers" (machine where you'll run the node.js app) IP
7. Open [localhost:5000](http://localhost:5000)
8. Play!