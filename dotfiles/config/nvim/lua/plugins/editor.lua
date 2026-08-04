return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup({
        contrast = "hard",
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Find text" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
      { "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Find recent files" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find help" },
      { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Find keymaps" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "gruvbox",
        icons_enabled = false,
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns
        local function gmap(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = buffer, desc = desc })
        end

        gmap("]h", gs.next_hunk, "Next Git hunk")
        gmap("[h", gs.prev_hunk, "Previous Git hunk")
        gmap("<leader>gp", gs.preview_hunk, "Preview Git hunk")
        gmap("<leader>gb", function() gs.blame_line({ full = true }) end, "Git blame line")
      end,
    },
  },
}
