local ensure_installed = {
  'bash',
  'c',
  'diff',
  'html',
  'lua',
  'luadoc',
  'markdown',
  'markdown_inline',
  'nextflow',
  'query',
  'vim',
  'vimdoc',
}

return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- Register the nextflow parser, which is not on nvim-treesitter's
      -- supported languages list (see SUPPORTED_LANGUAGES.md). The `TSUpdate`
      -- event fires inside `install()` before the parser table is read, so
      -- this must be created before the `install()` call below.
      vim.api.nvim_create_autocmd('User', {
        pattern = 'TSUpdate',
        callback = function()
          require('nvim-treesitter.parsers').nextflow = {
            install_info = {
              url = 'https://github.com/nextflow-io/tree-sitter-nextflow',
              revision = '69a72c6cf4e90609b8558fc05d7d17a5f3df7894', -- bump to update the grammar
              queries = 'queries',
            },
          }
        end,
      })

      -- Detect Nextflow files (`nextflow.config` matches by basename)
      -- Also map Quarto `.qmd` to markdown: the builtin detection assigns
      -- filetype `quarto`, which uses a legacy regex syntax with no treesitter
      -- parser; markdown gives proper treesitter highlighting with injected
      -- languages inside code chunks.
      vim.filetype.add {
        extension = { nf = 'nextflow', qmd = 'markdown' },
        pattern = { ['nextflow%.config'] = 'nextflow' },
      }

      require('nvim-treesitter').install(ensure_installed)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if pcall(vim.treesitter.start, args.buf) and vim.bo[args.buf].filetype ~= 'ruby' then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
