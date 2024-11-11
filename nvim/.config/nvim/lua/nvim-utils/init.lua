--- @module 'nvim-utils'
local _M = {}

-- Shorthand for vim.keymap.set
---@generic T: 'i'|'n'|'v'|'x'
---@param lhs string
---@param rhs string|function
---@param desc? string
---@param mode? T|T[]
---@param opts? table<string,any>
function _M.kmap(lhs, rhs, desc, mode, opts)
  local o = vim.tbl_extend("force", opts or {}, { desc = desc or "" })
  vim.keymap.set(mode or "n", lhs, rhs, o)
end

-- Bulk keymap setter
---@param kmaps table[] List of keymaps, where each keymap is {lhs, rhs, desc?, mode?, opts?}
function _M.tkmap(kmaps)
  for _, kmap in ipairs(kmaps) do
    local lhs = kmap[1]
    local rhs = kmap[2]
    local desc = kmap[3] or ""
    local mode = kmap[4] or "n"
    local opts = kmap[5] or {}

    -- Validate essential parameters (lhs and rhs)
    if type(lhs) ~= "string" or (type(rhs) ~= "string" and type(rhs) ~= "function") then
      vim.notify("Invalid keymap parameters", vim.log.levels.ERROR)
    else
      _M.kmap(lhs, rhs, desc, mode, opts)
    end
  end
end

_M.autocmd = vim.api.nvim_create_autocmd

_M.augroup = vim.api.nvim_create_augroup

_M.create_cmd = vim.api.nvim_create_user_command

return _M
