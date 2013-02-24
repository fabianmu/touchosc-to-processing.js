express = require("express")
app = express()
server = app.listen 5000
io = require("socket.io").listen server, log: false
osc = require("node-osc")

app.configure ->
  app.use express.static(__dirname + "/public")

#reverse ypos
coordmapper = 1:8, 2:7, 3:6, 4:5, 5:4, 6:3, 7:2, 8:1

# setup socket listeners when a connection is opened.
io.sockets.on "connection", (socket) ->

  #init OSC client and OSC server on socket connection
  oscClient = new osc.Client("192.168.0.102", 9090) # < must match "Port (incoming)" and your iPad's IP
  oscServer = new osc.Server(3333, "0.0.0.0") # must match "Port (outgoing)" in Touch OSC Settings

  oscServer.on "message", (msg) ->
    controller = msg[0]
    value = msg[1]
    message = controller.split("/")

    if message[1] is "clear" # touched element "clear" in TouchOSC
      # send message via socket.io to browser
      socket.broadcast.emit "deleteSquares"

      # send osc message to TouchOSC Client
      oscClient.send "/matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

    if message[1] is "matrix" # touched toggle button on element "matrix" in TouchOSC
      if value is 1
        # send message via socket.io to browser
        socket.broadcast.emit "addedSquare",
          x: message[3]
          y: coordmapper[message[2]]
