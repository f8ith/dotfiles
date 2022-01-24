local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟" ,
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }

   local server_opts = {
     -- Provide settings that should only apply to the "eslintls" server
     ["eslintls"] = function(opts)
       opts.settings = {
         format = {
           enable = true,
         },
       }
     end,
     ["sumneko_lua"] = function(opts)
       opts.settings = {
        Lua = {
          runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = runtime_path,
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim', 'runtime_path'},
          },
          workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
              enable = false,
          },
        },
       }
     end,
     ["rust-analyzer"] = function(opts)
       opts.settings = {
          experimental = {
             procAttrMacros = true,
          },
          checkOnSave = {
           command = "clippy",
          },
       }
     end


   }

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = function(client, bufnr)

            -- Run nvchad's attach
            attach(client, bufnr)

            -- autoformat on save
            if client.resolved_capabilities.document_formatting then
              vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
            end
         end,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }

      if server_opts[server.name] then
        server_opts[server.name](opts)
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
              virtual_text = false,
              underline = true,
              signs = true,
          }
      )


      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
