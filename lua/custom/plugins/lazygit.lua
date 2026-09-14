-- lazygit: terminal UI for git, opened in a floating window from within nvim.
-- Requires the `lazygit` binary on PATH (installed at ~/.local/bin/lazygit).
-- See https://github.com/kdheepak/lazygit.nvim

return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- setting the keybinding with 'keys' is recommended in order to
  -- load the plugin when the keymap is used for the first time
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazy[G]it (current working directory)' },
    { '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', desc = 'Lazy[G]it (project root of current file)' },
  },
}
