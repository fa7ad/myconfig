local wilder = require('wilder')
wilder.setup({
    modes = {':', '/', '?'},
    next_key = '<Tab>',
    previous_key = '<S-Tab>',
    accept_key = '<C-y>',
    reject_key = '<C-e>'
})

wilder.set_option('use_python_remote_plugin', 0)

wilder.set_option('pipeline', {wilder.branch(wilder.cmdline_pipeline({
    fuzzy = 1,
    fuzzy_filter = wilder.lua_fzy_filter()
}), wilder.vim_search_pipeline())})

wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
        border = 'rounded',
        max_height = '75%',
        min_height = 0,
        prompt_position = 'top',
        reverse = 0,
        highlighter = wilder.lua_fzy_highlighter(),
        left = {' ', wilder.popupmenu_devicons()},
        right = {' ', wilder.popupmenu_scrollbar()}
    })),
    ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.lua_fzy_highlighter()
    })
}))
-- Path: after/plugin/wilder.lua
-- local wilder = require('wilder')
--
-- wilder.setup({
--   modes = { ':', '/', '?' },
--   next_key = '<Tab>',
--   previous_key = '<S-Tab>',
--   accept_key = '<C-y>',
--   reject_key = '<C-e>'
-- })
--
-- wilder.set_option('pipeline', {
--   wilder.branch(
--     wilder.cmdline_pipeline({
--       language = 'python',
--       fuzzy = 1,
--       sorter = wilder.python_difflib_sorter(),
--       debounce = 30,
--     }),
--     wilder.python_search_pipeline({
--       pattern = wilder.python_fuzzy_pattern(),
--       sorter = wilder.python_difflib_sorter(),
--       engine = 're',
--       debounce = 30,
--     })
--   ),
-- })
--
-- local hl = wilder.make_hl('WilderAccent', 'Pmenu', { {}, {}, { foreground = '#f4468f' } })
-- wilder.set_option('renderer', wilder.popupmenu_renderer({
--   highlighter = wilder.basic_highlighter(),
--   max_height = 15,
--   highlights = {
--     accent = hl,
--   },
--   left = { ' ', wilder.popupmenu_devicons(), },
--   right = { ' ', wilder.popupmenu_scrollbar(), },
--   apply_incsearch_fix = 0,
-- }))