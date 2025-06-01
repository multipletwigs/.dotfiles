return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-opus-4-20250514",
      temperature = 0,
      max_tokens = 8192,
    },

    system_prompt = function()
      local filetype = vim.bo.filetype
      local prompt_dir = vim.fn.stdpath("config") .. "/prompts/"

      local prompt_files = {
        python = "python.txt",
        typescript = "typescript.txt",
        typescriptreact = "react.txt",
      }

      local prompt_file = prompt_files[filetype] or "default.txt"
      local full_path = prompt_dir .. prompt_file

      local file = io.open(full_path, "r")
      if file then
        local content = file:read("*all")
        file:close()
        return content:gsub("%s+$", "")
      else
        return "You are an expert software engineer using Claude Sonnet 4. Provide clean, well-documented code with clear explanations."
      end
    end,

    -- File selection configuration
    file_selector = {
      provider = "fzf-lua",
    },

    -- Behavior settings
    behaviour = {
      auto_suggestions = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },

    hints = { enabled = true },
  },

  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
