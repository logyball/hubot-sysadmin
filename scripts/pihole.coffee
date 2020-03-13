# Description:
#    Runs pihole admin commands
#
# Commands:
#    sysadmin pihole status: outputs the status of the pihole
#    sysadmin pihole up: runs pihole update of subsystems
#    sysadmin pihole logs [x]: get the last X logs, where X is a number < 100

exec = require('child_process').exec

module.exports = (robot) ->
  robot.respond /pihole status$/i, (res) ->
    res.send "Pihole status: "
    exec "pihole status", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != "")


  robot.respond /pihole up$/i, (res) ->
    res.send "updating subsystems for pihole (pihole -up)"
    exec "sudo apt update -y && pihole -up", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != "")

  robot.respond /pihole logs (\d{1,2})$/i, (res) ->
    num_of_logs = res.match[1]
    res.send "Last "+ num_of_logs + " lines of the log: "
    exec "cat /var/log/pihole.log | tail -n " + num_of_logs, (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != "")
