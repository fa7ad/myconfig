R = require './lib/ramda.min'
{ get_property } = mp
{ join_path, read_file, write_file, getenv } = mp.utils

cache = getenv('APPDATA') or getenv('HOME') + '/.cache'
histfile = cache + '/mpv/history.json'

sortTime = R.sort (x, y) -> y.time - x.time
uniqFile = R.uniqBy R.prop 'file'

writeToHistory = (data = []) ->
  write_file "file://#{histfile}", JSON.stringify(data, null, 4)

mp.register_event 'file-loaded', ->
  try
    raw = read_file histfile
  catch e
    do writeToHistory
    raw = '[]'
  log = JSON.parse raw
  file = join_path get_property('working-directory'), get_property('path')
  log.push { time: Date.now(), file }
  try
    writeToHistory uniqFile sortTime log
  catch e
    dump e

mp.register_event 'idle', ->
  try
    raw = read_file histfile
  catch e
    print "log file doesn't exist"
    do writeToHistory
    raw = '[]'
  log = uniqFile sortTime JSON.parse raw
  log20 = log.slice 0, 20
  log20.map (el) -> mp.commandv 'loadfile', el.file, 'append-play'
  try
    writeToHistory log20
  catch e
    dump e
