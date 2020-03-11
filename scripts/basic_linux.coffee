exec = require('child_process').exec

module.exports = (robot) ->
  robot.respond /filesystem/i, (res) ->
    res.send "Running df -h"
    exec "df -h", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)


  robot.respond /top cpu/i, (res) ->
    res.send "Showing top 20 processes by cpu usage"
    exec "top -b -n 1 -o %CPU | head -n 27", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)

  robot.respond /top mem/i, (res) ->
    res.send "Showing top 20 processes by memory usage"
    exec "top -b -n 1 -o %MEM | head -n 27", (error, stdout, stderr) ->
      res.send "err: " + error.toString() if (error != null)
      res.send stdout if (stdout != null)
      res.send "stderr: " + stderr.toString() if (stderr != null)
