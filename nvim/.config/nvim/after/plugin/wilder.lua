if vim.g.vscode then
  return
end
local wilder = require('wilder')
wilder.setup({
  modes = { ':', '/', '?' },
  next_key = '<Tab>',
  previous_key = '<S-Tab>',
  accept_key = '<C-y>',
  reject_key = '<C-e>'
})

wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', { wilder.branch(wilder.cmdline_pipeline({
  fuzzy = 1,
  fuzzy_filter = wilder.lua_fzy_filter()
}), wilder.vim_search_pipeline()) })

wilder.set_option('renderer', wilder.renderer_mux({
  [':'] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
    border = 'rounded',
    reverse = 0,
    highlighter = wilder.lua_fzy_highlighter(),
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    highlights = {
      accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }),
    },
  })),
  ['/'] = wilder.wildmenu_renderer({
    highlighter = wilder.lua_fzy_highlighter()
  })
}))
