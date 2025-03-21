vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.showtabline = 1
vim.opt.laststatus = 3
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.encoding = "utf-8"

vim.opt.termguicolors = true
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.confirm = true

vim.opt.updatetime = 50

vim.opt.completeopt = 'menuone,noselect'

vim.g.mapleader = " "

-- air-line
vim.g.airline_powerline_fonts = "1"
vim.g.airline_theme='catppuccin'
-- vim.cmd [[
--   let g:airline#extensions#tabline#enabled = 1
--   let g:airline#extensions#tabline#formatter = 'default'
-- ]]

-- unicode symbols
vim.g.airline_left_sep = '»'
vim.g.airline_left_sep = '▶'
vim.g.airline_right_sep = '«'
vim.g.airline_right_sep = '◀'

vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_winsize = 20

vim.opt.cmdheight = 0

vim.cmd[[
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  autocmd BufNew,BufRead *.asm set ft=nasm
  autocmd BufNew,BufRead *.norg setlocal conceallevel=2

]]

vim.cmd 'set mouse=a'
vim.cmd 'colorscheme catppuccin'

-- airline symbols
vim.g.airline_left_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_right_alt_sep = ''
--vim.g.airline_symbols.branch = ''
--vim.g.airline_symbols.readonly = ''
--vim.g.airline_symbols.linenr = ''

vim.lsp.buf.hover()
-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='gray' })
-- vim.api.nvim_set_hl(0, 'LineNr', { fg='gold' })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='gray' })

vim.g.vimtex_view_method = 'zathura'

-- Autocmds
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
  autocmd BufWritePost *.rmd :!Rscript -e "rmarkdown::render('%')"

  augroup toggle_relative_number
    autocmd InsertEnter * :setlocal norelativenumber
    autocmd InsertLeave * :setlocal relativenumber
  augroup end

  "highlight trailing whitespace
    match ErrorMsg '\s\+$'
  "remove trailing whitespaces automatically
    autocmd BufWritePre * :%s/\s\+$//e
]])

-- autocmd BufEnter *.tex TSDisable highlight

-- Autorun
local attach_to_buffer = function(bufnr, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost",  {
    group = vim.api.nvim_create_augroup("AutoSave", { clear = true }),
    pattern = pattern,
    callback = function()
        local append_data = function(_, data)
            if data then
            vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
          end
      end

      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Output: " })
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
