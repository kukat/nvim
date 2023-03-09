return {
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
      { "<leader>tS", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-plenary",
      "haydenmeade/neotest-jest",
    },
    config = function()
      local opts = {
        adapters = {
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
          require("neotest-plenary"),
        },
      }
      require("neotest").setup(opts)
    end,
  },
}
