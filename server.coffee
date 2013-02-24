osc = require("node-osc")

client = new osc.Client("192.168.0.102", 9090)

#elements = {}
#elements["/1/push15"] = value: 0
#console.log  elements

oscServer = new osc.Server(3333, "0.0.0.0")

oscServer.on "message", (msg, rinfo) ->
  console.log msg
  element = msg[0]
  value = msg[1]

  #console.log "element: #{element}"
  #console.log "value: #{value}"

  #if element.indexOf("/z") < 0
  #  isControlStart = true
  #else
  #  isControlStart = false

  #console.log "#############################\n"

  #console.log "isControlStart: #{isControlStart}"
