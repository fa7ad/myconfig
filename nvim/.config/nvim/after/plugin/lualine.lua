if vim.g.vscode then
  return
end
local lualine = require('lualine')
local c = require('onedark.colors')

local cfg = vim.g.onedark_config
local colors = {
  bg = c.bg0,
  fg = c.fg,
  red = c.red,
  green = c.green,
  yellow = c.yellow,
  blue = c.blue,
  purple = c.purple,
  cyan = c.cyan,
  gray = c.grey
}

local one_dark = {
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  normal = {
    a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
    b = { fg = colors.fg, bg = c.bg3 },
    c = { fg = colors.fg, bg = cfg.lualine.transparent and c.none or c.bg1 },
  },
  visual = { a = { fg = colors.bg, bg = colors.purple, gui = 'bold' } },
  replace = { a = { fg = colors.bg, bg = colors.red, gui = 'bold' } },
  insert = { a = { fg = colors.bg, bg = colors.blue, gui = 'bold' } },
  command = { a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' } },
  terminal = { a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' } },
}

lualine.setup {
  options = {
    theme = one_dark,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'fileformat', 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { 'filename' },
    lualine_y = {},
    lualine_z = { 'tabs' }
  },
  extensions = {},
}
