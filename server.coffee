express = require("express")
app = express()
server = app.listen 5000
io = require("socket.io").listen server, log: false
osc = require("node-osc")

app.configure ->
  app.use express.static(__dirname + "/public")

#reverse y-pos
coordmapper =
  1:8
  2:7
  3:6
  4:5
  5:4
  6:3
  7:2
  8:1

# Setup socket listeners when a connection is opened.
io.sockets.on "connection", (socket) ->

  #init OSC client and server on socket connection
  client = new osc.Client("192.168.0.102", 9090)
  oscServer = new osc.Server(3333, "0.0.0.0")

  oscServer.on "message", (msg, rinfo) ->
    controller = msg[0]
    value = msg[1]
    message = controller.split("/")

    console.log "message:"
    console.log message

    if message[1] is "clear" # touched element "clear" in TouchOSC
      # send message via socket.io to browser
      socket.broadcast.emit "deleteSquares"

      # send osc message to TouchOSC Client
      client.send "/matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

    if message[1] is "matrix" # touched toggle button on element "matrix" in TouchOSC
      if value is 1
        # send message via socket.io to browser
        socket.broadcast.emit "addedSquare",
          x: message[3]
          y: coordmapper[message[2]]
