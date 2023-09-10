vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.showtabline = 1

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
--vim.opt.colorcolumn = "90"

vim.opt.updatetime = 50

vim.opt.completeopt = 'menuone,noselect'

vim.g.mapleader = " "

-- air-line
vim.g.airline_powerline_fonts = "1"
vim.g.airline_theme='zenburn'

-- unicode symbols
vim.g.airline_left_sep = "»"
vim.g.airline_left_sep = '▶'
vim.g.airline_right_sep = '«'
vim.g.airline_right_sep = '◀'

vim.cmd[[  
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  autocmd BufNew,BufRead *.asm set ft=nasm
  autocmd BufNew,BufRead *.norg setlocal conceallevel=2
  
]]

vim.cmd("set mouse=")
vim.cmd [[colorscheme kanagawa-dragon]]

-- airline symbols
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
--vim.g.airline_symbols.branch = ''
--vim.g.airline_symbols.readonly = ''
--vim.g.airline_symbols.linenr = ''

vim.lsp.buf.hover()
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='gold' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray' })

-- Autocmds
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
  autocmd BufWritePost *.rmd :!Rscript -e "rmarkdown::render('%')"
]])

-- Autorun
local attach_to_buffer = function(bufnr, pattern, command)
  vim.api.nvim_create_autocmd("BufWritePost",  {
    group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
    callback = function()
      local append_data = function(_, data)
          if data then
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
          end
      end
  
      vim.fn.jobstart(command, {
        stdout_buffer = true,
        on_stdout = append_data,
        on_stderr = append_data,
      })
    end,
  })
end

vim.api.nvim_create_user_command("AutoRun", function()
  print("AutoRun")
  local bufnr = vim.fn.input "Bufnr: "
  local pattern = vim.fn.input "Pattern: "
  local command = vim.split(vim.fn.input "Command: ", " ")
  attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})
