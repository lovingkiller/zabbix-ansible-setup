#!/bin/bash

echo "🔧 Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "📝 Setting up ~/.vimrc with Ansible, indentation, and formatting plugins..."

cat > ~/.vimrc << 'EOF'
call plug#begin('~/.vim/plugged')

" YAML and Ansible support
Plug 'stephpy/vim-yaml'
Plug 'pearofducks/ansible-vim'

" Auto-completion engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autoformatting plugin
Plug 'Chiel92/vim-autoformat'

call plug#end()

" Set filetype for Ansible playbooks
autocmd BufRead,BufNewFile */ansible/*.yml set filetype=yaml.ansible
autocmd BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible

" YAML indentation (2 spaces)
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab

" Autoformat on save for YAML
autocmd BufWritePre *.yml,*.yaml :Autoformat

" Use prettier if available
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:formatdef_prettier = '"prettier --stdin-filepath ".expand("%")'
let g:formatters_yaml = ['prettier']
EOF

echo "📦 Installing Node.js and npm (if missing)..."
if ! command -v npm >/dev/null; then
  sudo apt update && sudo apt install -y nodejs npm
fi

echo "📦 Installing formatters and language servers..."
npm install -g prettier yaml-language-server bash-language-server

echo "🛠️ Creating ~/.vim/coc-settings.json..."
mkdir -p ~/.vim
cat > ~/.vim/coc-settings.json << 'EOF'
{
  "languageserver": {
    "yaml": {
      "command": "yaml-language-server",
      "args": ["--stdio"],
      "filetypes": ["yaml"],
      "settings": {
        "yaml": {
          "validate": true,
          "hover": true,
          "completion": true
        }
      }
    },
    "bash": {
      "command": "bash-language-server",
      "args": ["start"],
      "filetypes": ["sh"]
    }
  }
}
EOF

echo "🚀 Open Vim and run :PlugInstall"
echo "💡 After that, open a YAML file and run :Autoformat or just save to auto-indent!"

