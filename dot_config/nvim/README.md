### Vim keymaps
Macro recording: `q + <macro_name> + q`  
Macro pasting: `@ + <macro_name>`  

select code : `SHIFT`  
indent: `=`  
insert at end: `SHIFT + a`  
insert at beginning: `SHIFT + i`  

### Custom keymaps
#### General
Leader: `SPACE`

#### [Lazy Nvim package manager](https://lazy.folke.io/)
Open GUI: `:Lazy`  
Clean unused plugins: `:Lazy clean`

#### Telescope and Telescope UI select
Live grep: `<leader> + fg`  
File buffers: `<leader> + fb`

#### Neotree
Open filetree: `<leader> + t`  
Preview file: `P`  
Add file/dir (dir end with /): `a`  
Delete file: `d`  
Rename file: `r`  
Show hidden files: `H`

#### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
See [this link](https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages) for available language support

Add language parser: `:TSInstall <language>`

#### [Mason](https://github.com/williamboman/mason.nvim) and [Mason lsp config](https://github.com/williamboman/mason-lspconfig.nvim)
See [this link](https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md) for list of available mason packages
Open GUI: `:Mason`

Install package: `:MasonInstall <package>`, or from GUI: `i`  
Uninstall package: `:MasonUninstall <package>`, or from GUI: `X`

#### [Lsp config](https://github.com/neovim/nvim-lspconfig/tree/master)
See [this link](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) for list of available packages and recommended configurations

Rename variable: `<leader>rn`  
Hover function: `<leader>h`  
Go to definition: `<leader>gd`  
Go to declaration: `<leader>gD`  
Go to implementation: `<leader>gi`  
Code action: `<leader>ca`  
Open diagnostic window: `<leader>e`

#### [None ls](https://github.com/nvimtools/none-ls.nvim)
See [this link](https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md) for list of available packages

Format code: `<leader>gf`

#### [Nvim cmp](https://github.com/hrsh7th/nvim-cmp)

#### [markdown-preview](https://github.com/iamcco/markdown-preview.nvim?tab=readme-ov-file)
Preview markdown: `:MarkdownPreview`


### Other plugins (later list of all plugins)
- Which key
- mini nvim 
- luasnip
- luasnip cmp
- friendly snippets
- cmp nvim lsp
- 
### Adding language support
When adding support for a language, add it in the `mason lsp config`, `lsp config` and `none ls` sections `lua/plugins/language-support.lua` file as well as in `lua/plugins/treesitter.lua`. See documentation pages for more information on available packages and configuration.

## TODO
resize neotree with mouse?  
add nvim dashboard  
play around with everforest options  
add switch from dark to light mode  
add switch from different vim configs  
add nvim-lint.nvim  
add formatter.nvim  
copy paste from vim to vim or vim to external buffer  
add html preview  
add doc for how to navigate Lazy plugins window


Custom keymaps  
y to yank to clipboard  
delete whole word  
