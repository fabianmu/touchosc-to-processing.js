# Dirty hack to get data from TouchOSC via node.js and socket.io into processing.js

Cause it's fun!

# Installation

1. Clone
2. Run `npm install`
3. Get [TouchOSC](http://hexler.net/software/touchosc)
4. Change the IP in line 17 in `server.coffee` to match your iPad's IP
5. Start the node-server, `foreman start`
6. Sync matrix-8x8.touchosc using TouchOSC Editor to your iPad
7. Setup the "OSC" Connection, set outgoing port to 3333 and incoming port to 9090 and make sure to set your "servers" (machine where you'll run the node.js app) IP
8. Open [localhost:5000](http://localhost:5000)
9. Play!

# Example
[on vine](http://vine.co/v/bg6qQZL9UF3)