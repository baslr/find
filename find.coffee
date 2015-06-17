
exec = require('child_process').exec

module.exports = (path, opts, cb) ->
  exec "find #{path} #{opts}", {maxBuffer:1024*1024*1024}, (e, stdout, stderr) ->
    return cb [e, stderr], [] if e?

    fileNames = []
    paths     = []
    for path in stdout.split('\n').slice(0,-1)
      fileName = path.split('/').pop()
      fileNames.push fileName
      paths.push path
    cb null, fileNames, paths
