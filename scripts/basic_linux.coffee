# Description:
#    Runs basic linux stuff
#
# Commands:
#    sysadmin files: outputs the file usage using `df`
#    sysadmin top [cpu|mem]: outputs processes by memory or CPU

exec = require('child_process').exec

module.exports = (robot) ->
  robot.respond /files/i, (res) ->
    res.send "Running df -h"
    exec "df -h", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)


  robot.respond /top cpu/i, (res) ->
    res.send "Showing top 10 processes by cpu usage"
    exec "top -b -n 1 -o %CPU | head -n 17", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)

  robot.respond /top mem/i, (res) ->
    res.send "Showing top 10 processes by memory usage"
    exec "top -b -n 1 -o %MEM | head -n 17", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)
