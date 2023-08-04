local fmt = string.format
local M = {}

M.modes = {
  [''] = {text = 'S-BLOCK', state = 'visual'},
  [''] = {text = 'δ', state = 'visual'},
  ['?'] = {text = '???', state = 'inactive'},
  ['R'] = {text = 'Φ', state = 'replace'},
  ['S'] = {text = 'S-LINE', state = 'visual'},
  ['V'] = {text = 'Σ', state = 'visual'},
  ['c'] = {text = '∆', state = 'command'},
  ['i'] = {text = 'λ', state = 'insert'},
  ['n'] = {text = 'ν', state = 'normal'},
  ['r'] = {text = 'PROMPT', state = 'replace'},
  ['s'] = {text = 'SELECT', state = 'visual'},
  ['t'] = {text = '∆', state = 'command'},
  ['v'] = {text = 'δ', state = 'visual'},
}

function M.echo(msg, hlgroup)
  vim.api.nvim_echo({{fmt('[hardline] %s', msg), hlgroup}}, false, {})
end

function M.set_cache_autocmds(augroup)
  vim.cmd(fmt([[
  augroup %s
    autocmd!
    autocmd CursorHold,BufWritePost * unlet! b:%s
  augroup END
  ]], augroup, augroup))
end

return M
