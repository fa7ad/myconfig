#!/usr/bin/env node
const os = require('os')
const path = require('path')
const cp = require('child_process')
const defaults = require(path.resolve(
  os.homedir(),
  '.config',
  'i3',
  'defaults.json'
))

cp.execFile('i3-msg', ['-t', 'get_workspaces'], (err, stdout, stderr) => {
  if (err || stderr.trim() !== '') return process.exit(1)

  const output = JSON.parse(stdout)
  const [active] = output.filter(x => x.focused)
  cp.execFileSync(...defaults[active.name])
})
