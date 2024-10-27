
local api = vim.api
local orig_buf = api.nvim_get_current_buf()
local term_buf = api.nvim_create_buf(false, true)
api.nvim_set_current_buf(term_buf)
vim.bo.scrollback = 100000
local term_chan = api.nvim_open_term(0, {})
api.nvim_chan_send(term_chan, table.concat(api.nvim_buf_get_lines(orig_buf, 0, -1, true), "\r\n"))
vim.fn.chanclose(term_chan)
api.nvim_buf_set_lines(orig_buf, 0, -1, true, api.nvim_buf_get_lines(term_buf, 0, -1, true))
api.nvim_set_current_buf(orig_buf)
api.nvim_buf_delete(term_buf, { force = true })
vim.keymap.set('n', '<C-q>', ':q!<CR>', { noremap = true, silent = true })
vim.bo.modified = false
-- Get all the lines in the current buffer
local lines = api.nvim_buf_get_lines(0, 0, -1, true)

-- Find the position of the last non-whitespace character
local last_non_whitespace_line = #lines
local last_non_whitespace_col = nil

for i = last_non_whitespace_line, 1, -1 do
    local line = lines[i]
    local last_char_col = vim.fn.match(line, '\\S$')
    if last_char_col >= 0 then
        last_non_whitespace_line = i
        last_non_whitespace_col = last_char_col
        break
    end
end

-- If we found a non-whitespace character, move the cursor there
if last_non_whitespace_col then
    api.nvim_win_set_cursor(0, {last_non_whitespace_line, last_non_whitespace_col})
else
    -- If there were no non-whitespace characters, place the cursor at the start of the buffer
    api.nvim_win_set_cursor(0, {1, 0})
end
