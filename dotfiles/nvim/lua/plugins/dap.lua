-- ~/.config/nvim/lua/plugins/nvim-java.lua
return {
  "nvim-java/nvim-java",
  ft = { "java" }, -- only load when opening Java files
  dependencies = {
    {
      "mfussenegger/nvim-dap",
      ft = { "java" }, -- load DAP only for Java
      config = function()
        local dap = require("dap")

        dap.adapters.java = function(callback, config)
          callback({
            type = "server",
            host = "127.0.0.1",
            port = 5005,
          })
        end

        dap.configurations.java = {
          {
            type = "java",
            request = "attach",
            name = "Attach to Java process",
            hostName = "127.0.0.1",
            port = 5005,
          },
        }
      end,
    },
    {
      "neovim/nvim-lspconfig",
      opts = function(_, opts)
        opts.servers = opts.servers or {}
        opts.servers.jdtls = nil -- disable default jdtls

        require("java").setup({
          jdtls = { version = "v1.43.0" },
          lombok = { version = "nightly" },
          java_test = {
            enable = true,
            version = "0.40.1",
            auto_install = false,
          },
          java_debug_adapter = {
            enable = true,
            version = "0.58.1",
            auto_install = false,
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
