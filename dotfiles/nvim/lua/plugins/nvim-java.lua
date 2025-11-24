-- ~/.config/nvim/lua/plugins/nvim-java.lua
return {
  "nvim-java/nvim-java",
  ft = "java",
  dependencies = {
    {
      "neovim/nvim-lspconfig",
      opts = function(_, opts)
        opts.servers = opts.servers or {}
        opts.servers.jdtls = nil

        local mason_path = vim.fn.stdpath("data") .. "/mason/packages"

        require("java").setup({
          jdtls = { version = "v1.43.0" },
          lombok = { version = "nightly" },
          java_test = {
            enable = true,
            auto_install = false,
            version = "0.40.1",
            path = mason_path .. "/java-test", -- cached path
          },
          java_debug_adapter = {
            enable = true,
            auto_install = false,
            version = "0.58.1",
            path = mason_path .. "/java-debug-adapter", -- cached path
          },
          spring_boot_tools = { enable = true, version = "1.55.1" },
          jdk = { auto_install = true, version = "17.0.2" },
          notifications = { dap = true },
          mason = { registries = { "github:nvim-java/mason-registry" } },
        })
      end,
    },
  },
}
