R = require './lib/ramda.min'
{ get_property } = mp
{ join_path, read_file, write_file, getenv } = mp.utils

cache = getenv('APPDATA') or getenv('HOME') + '/.cache'
histfile = cache + '/mpv/history.json'

sortTime = R.sort (x, y) -> y.time - x.time
uniqFile = R.uniqBy R.prop 'file'

mp.register_event 'file-loaded', ->
  try
    raw = read_file histfile
  catch e
    write_file "file://#{histfile}", JSON.stringify([], null, 4)
    raw = '[]'
  log = JSON.parse raw
  file = join_path get_property('working-directory'), get_property('path')
  log.push { time: Date.now(), file }
  try
    uniqdLog = uniqFile sortTime log
    write_file "file://#{histfile}", JSON.stringify uniqdLog, null, 4
  catch e
    mp.msg.error e

mp.register_event 'idle', ->
  try
    raw = read_file histfile
  catch e
    mp.msg.error "log file doesn't exist"
    write_file "file://#{histfile}", JSON.stringify([], null, 4)
    raw = '[]'
  log = uniqFile sortTime JSON.parse raw
  log20 = log.slice 0, 20
  log20.map (el) ->
    mp.commandv 'loadfile', el.file, 'append-play'
  try
    write_file "file://#{histfile}", JSON.stringify(log20, null, 4)
  catch e
    mp.msg.error e
