return {{
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    opts = {
        style = 'darker',
        transparent = true
    }
}, {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        sort_by = "case_sensitive",
        renderer = {
            group_empty = true
        },
        filters = {
            dotfiles = false,
            custom = {"^.git$"}
        },
        actions = {
            open_file = {
                quit_on_open = true
            }
        }
    },
    init = function()
        local nvimTreeApi = require("nvim-tree.api")

        vim.keymap.set("n", "<C-e>", nvimTreeApi.tree.toggle, {
            silent = true,
            noremap = true
        })

    end
}, {
    "nvim-tree/nvim-web-devicons",
    lazy = true
}, {
    'romgrk/fzy-lua-native',
    lazy = true,
    config = false
}, {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
    config = false
}, {
    'nixprime/cpsm',
    lazy = true,
    config = false
}, {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
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
                a = {
                    fg = colors.gray,
                    bg = colors.bg,
                    gui = 'bold'
                },
                b = {
                    fg = colors.gray,
                    bg = colors.bg
                },
                c = {
                    fg = colors.gray,
                    bg = cfg.lualine.transparent and c.none or c.bg1
                }
            },
            normal = {
                a = {
                    fg = colors.bg,
                    bg = colors.green,
                    gui = 'bold'
                },
                b = {
                    fg = colors.fg,
                    bg = c.bg3
                },
                c = {
                    fg = colors.fg,
                    bg = cfg.lualine.transparent and c.none or c.bg1
                }
            },
            visual = {
                a = {
                    fg = colors.bg,
                    bg = colors.purple,
                    gui = 'bold'
                }
            },
            replace = {
                a = {
                    fg = colors.bg,
                    bg = colors.red,
                    gui = 'bold'
                }
            },
            insert = {
                a = {
                    fg = colors.bg,
                    bg = colors.blue,
                    gui = 'bold'
                }
            },
            command = {
                a = {
                    fg = colors.bg,
                    bg = colors.yellow,
                    gui = 'bold'
                }
            },
            terminal = {
                a = {
                    fg = colors.bg,
                    bg = colors.cyan,
                    gui = 'bold'
                }
            }
        }

        lualine.setup {
            options = {
                theme = one_dark,
                component_separators = '|',
                section_separators = {
                    left = '',
                    right = ''
                }
            },
            sections = {
                lualine_a = {{
                    'mode',
                    separator = {
                        left = ''
                    },
                    right_padding = 2
                }},
                lualine_b = {'filename', 'branch'},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'fileformat', 'filetype', 'progress'},
                lualine_z = {{
                    'location',
                    separator = {
                        right = ''
                    },
                    left_padding = 2
                }}
            },
            inactive_sections = {
                lualine_a = {'filename'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'location'}
            },
            tabline = {
                lualine_a = {'buffers'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {'filename'},
                lualine_y = {},
                lualine_z = {'tabs'}
            },
            extensions = {}
        }

    end
}, {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
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
            [':'] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
                border = 'rounded',
                reverse = 0,
                highlighter = wilder.lua_fzy_highlighter(),
                left = {' ', wilder.popupmenu_devicons()},
                right = {' ', wilder.popupmenu_scrollbar()},
                highlights = {
                    accent = wilder.make_hl('WilderAccent', 'Pmenu', {{
                        a = 1
                    }, {
                        a = 1
                    }, {
                        foreground = '#f4468f'
                    }})
                }
            })),
            ['/'] = wilder.wildmenu_renderer({
                highlighter = wilder.lua_fzy_highlighter()
            })
        }))
    end
}}
