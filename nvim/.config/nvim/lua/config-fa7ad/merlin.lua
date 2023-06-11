local opam_share_dir = vim.fn.system { "opam", "var", "share" }
opam_share_dir = opam_share_dir:sub(1, #opam_share_dir - 1)

local function OpamConfOcpIndent()
  vim.opt.runtimepath:prepend(opam_share_dir .. "/ocp-indent/vim")
end

local function OpamConfOcpIndex()
  vim.opt.runtimepath:append(opam_share_dir .. "/ocp-index/vim")
end

local function OpamConfMerlin()
  vim.opt.runtimepath:append(opam_share_dir .. "/merlin/vim")
end

local configuration = {
  ["ocp-indent"] = OpamConfOcpIndent,
  ["ocp-index"] = OpamConfOcpIndex,
  ["merlin"] = OpamConfMerlin,
}

local available_packages = Split(
  vim.fn.system(
    {
      "opam", "list", "--short", "--safe", "--color=never",
      "ocp-indent", "ocp-index", "merlin"
    }
  ),
  "\n")

for i, v in ipairs(available_packages) do
  available_packages[v] = true
  table.remove(available_packages, i)
end

for pkg, _ in pairs(available_packages) do
  if configuration[pkg] then
    configuration[pkg]()
  end
end

if not available_packages["ocp-indent"] then
  vim.api.nvim_command("source " .. opam_share_dir .. "/ocp-indent/vim/indent/ocaml.vim")
end
