var R = require('./lib/ramda')
var get_property = mp.get_property

var join_path = mp.utils.join_path
var read_file = mp.utils.read_file
var write_file = mp.utils.write_file
var getenv = mp.utils.getenv

var cache = getenv('APPDATA') || getenv('HOME') + '/.cache'
var histfile = cache + '/mpv/history.json'
var filter
try {
  filter = require(cache + '/mpv/filter')
} catch (e) {
  filter = function (el) {return el}
}
dump('Loaded: ' + histfile)

var sortTime = R.sort(function(x, y) {
  return y.time - x.time
})
var uniqFile = R.uniqBy(R.prop('file'))

function writeToHistory(data) {
  if (!data) data = []
  try {
    write_file('file://' + histfile, JSON.stringify(filter(data)))
  } catch (e) {
    dump(e)
  }
}

function getFile(file) {
  var file = file || histfile
  try {
    return filter(JSON.parse(read_file(file)))
  } catch (e) {
    writeToHistory()
    return []
  }
}

mp.register_event('file-loaded', function() {
  var log = getFile(histfile)
  var wd = get_property('working-directory')
  var path = get_property('path')
  file = /^http/.test(path) ? path : join_path(wd, path)
  dump(path)
  log.push({ time: Date.now(), file: file })
  writeToHistory(uniqFile(sortTime(log)))
})

mp.register_event('idle', function() {
  var log = R.slice(0, 20, sortTime(uniqFile(getFile(histfile))))
  log.map(function(el) {
    mp.commandv('loadfile', el.file, 'append-play')
  })
  writeToHistory(log)
})
