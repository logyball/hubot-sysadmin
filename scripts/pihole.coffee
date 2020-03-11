exec = require('child_process').exec

module.exports = (robot) ->
  robot.respond /pihole status/i, (res) ->
    res.send "This is the command pihole status"
    exec "pihole status", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)


  robot.respond /pihole update subsystems/i, (res) ->
    res.send "updating subsystems for pihole (pihole -up)"
    exec "sudo apt update -y && pihole -up", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)
