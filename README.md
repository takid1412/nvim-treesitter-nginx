# nvim-treesitter-nginx

Neovim treesitter integration for [tree-sitter-nginx](https://gitlab.com/joncoole/tree-sitter-nginx).

## Installation

```lua
{
    "takid1412/nvim-treesitter-nginx",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    build = ":TSUpdate nginx",
}
```

## Usage

You need to set the filetype to `nginx` for it to work.

```vim
:set filetype=nginx
```

You can also create a plugin in `.config/nvim/plugin/nginx.lua` with the following:

```lua
vim.filetype.add({
  pattern = {
    [".*%.conf"] = "nginx",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nginx",
  callback = function()
    vim.treesitter.language.register("nginx", "nginx")
  end,
})

```

This will automatically set the filetype to `nginx` for files ending in `.conf` and load the treesitter parser.
