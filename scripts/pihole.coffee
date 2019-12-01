exec = require('child_process').exec

module.exports = (robot) ->

  robot.respond /ls/i, (msg) ->
    msg.send "This is the command ls"
    exec "ls", (error, stdout, stderr) ->
      msg.send "err: " + error.toString() if (error != null)
      msg.send stdout if (stdout != null)
      msg.send "stderr: " + stderr.toString() if (stderr != null)

  robot.respond /pihole status/i, (msg) ->
    msg.send "This is the command pihole status"
    exec "pihole status", (error, stdout, stderr) ->
      msg.send "err: " + error.toString() if (error != null)
      msg.send stdout if (stdout != null)
      msg.send "stderr: " + stderr.toString() if (stderr != null)
