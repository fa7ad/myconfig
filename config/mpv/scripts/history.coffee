R = require './lib/ramda'
{ get_property } = mp
{ join_path, read_file, write_file, getenv } = mp.utils

cache = getenv('APPDATA') or getenv('HOME') + '/.cache'
histfile = cache + '/mpv/history.json'

sortTime = R.sort (x, y) -> y.time - x.time
uniqFile = R.uniqBy R.prop 'file'

writeToHistory = (data = []) ->
  try
    write_file "file://#{histfile}", JSON.stringify data
  catch e
    dump e

getFile = (file = histfile) ->
  try
    JSON.parse read_file file
  catch
    do writeToHistory
    []

mp.register_event 'file-loaded', ->
  log = getFile histfile
  [wd, path] = [get_property('working-directory'), get_property('path')]
  file = if /^http/.test path then path else join_path wd, path
  dump path
  log.push { time: Date.now(), file }
  writeToHistory uniqFile sortTime log

mp.register_event 'idle', ->
  log = R.slice 0, 20, sortTime uniqFile getFile histfile
  log.map (el) -> mp.commandv 'loadfile', el.file, 'append-play'
  writeToHistory log

