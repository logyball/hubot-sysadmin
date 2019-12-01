exec = require('child_process').exec

module.exports = (robot) ->

  robot.respond /echo/i, (msg) ->
    msg.send "This is the command dir"
    exec "dir", (error, stdout, stderr) ->
      msg.send error if (error != null)
      msg.send stdout if (stdout != null)
      msg.send stderr if (stderr != null)
