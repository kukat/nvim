return {
  {
    "nvim-neotest/neotest",
    keys = {
      { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "File" },
      { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Last" },
      { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Nearest" },
      { "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", desc = "Watch" },
      { "<leader>tS", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
      { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
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
