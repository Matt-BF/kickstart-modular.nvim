return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  opts = {
    -- add any opts here
    -- for example
    provider = 'openai',
    vendors = {
      lbl_gemini_flash = {
        __inherited_from = 'openai',
        endpoint = 'https://api.cborg.lbl.gov',
        model = 'google/gemini-flash', -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
      lbl_o3_mini = {
        __inherited_from = 'openai',
        endpoint = 'https://api.cborg.lbl.gov',
        model = 'openai/o3-mini', -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        disable_tools = true,
        max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
      lbl_deepseek_r1 = {
        __inherited_from = 'openai',
        endpoint = 'https://api.cborg.lbl.gov',
        model = 'lbl/cborg-deepthought:latest', -- your desired model (or use gpt-4o, etc.)
        disable_tools = true,
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
      lbl_claude = {
        __inherited_from = 'openai',
        endpoint = 'https://api.cborg.lbl.gov',
        model = 'aws/claude:latest', -- your desired model (or use gpt-4o, etc.)
        timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
        temperature = 0,
        max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
        --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
      },
    },

    -- hide models
    openai = {
      hide_in_model_selector = true,
    },
    claude = {
      hide_in_model_selector = true,
    },
    gemini = {
      hide_in_model_selector = true,
    },
    aihubmix = {
      hide_in_model_selector = true,
    },
    bedrock = {
      hide_in_model_selector = true,
    },
    cohere = {
      hide_in_model_selector = true,
    },
    copilot = {
      hide_in_model_selector = true,
    },
    vertex = {
      hide_in_model_selector = true,
    },
    ['claude-opus'] = {
      hide_in_model_selector = true,
    },
    ['claude-haiku'] = {
      hide_in_model_selector = true,
    },
    ['aihubmix-claude'] = {
      hide_in_model_selector = true,
    },
    vertex_claude = {
      hide_in_model_selector = true,
    },

    ['openai-gpt-4o-mini'] = {
      hide_in_model_selector = true,
    },
    ---
  },

  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
