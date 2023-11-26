return {
  {
    "haydenmeade/neotest-jest",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
    },
    opts = {
      adapters = {
        "neotest-jest",
      },
    },
  },
}
