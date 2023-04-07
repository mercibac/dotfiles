local keymap = vim.keymap

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set('i', 'jj', '<Esc>')
keymap.set("v", "<", "<gv", {noremap = true})
keymap.set("v", ">", ">gv", {noremap = true})
-- keymap.set('n', '<leader>d', '"_dd', {noremap = true})
-- keymap.set('x', '<leader>d', '"_dd', {noremap = true})
-- keymap.set('v', '<leader>d', '"_dd', {noremap = true})

