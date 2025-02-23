return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")

      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():add()
      end)

      vim.keymap.set("n", "<leader>h1", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<leader>h2", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<leader>h3", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<leader>h4", function()
        harpoon:list():select(4)
      end)

      -- -- Toggle previous & next buffers stored within Harpoon list
      -- vim.keymap.set("n", "<C-j>", function()
      --   harpoon:list():next()
      -- end)
      -- vim.keymap.set("n", "<C-k>", function()
      --   harpoon:list():prev()
      -- end)
    end,
  },
  { -- manage projects
    "gnikdroy/projections.nvim",
    enabled = false,
    keys = {
      {
        "<leader>fp",
        function()
          vim.cmd("Telescope projections")
        end,
        desc = "[p]rojects",
      },
    },
    config = function()
      -- Save localoptions to session file
      vim.opt.sessionoptions:append("localoptions")
      require("projections").setup({
        store_hooks = {
          pre = function()
            -- nvim-tree
            local nvim_tree_present, api = pcall(require, "nvim-tree.api")
            if nvim_tree_present then
              api.tree.close()
            end
          end,
        },
      })

      -- Autostore session on VimExit
      local Session = require("projections.session")
      vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
        callback = function()
          local cwd = vim.loop.cwd()
          if cwd ~= nil then
            Session.store(cwd)
          end
        end,
      })

      -- Switch to project if vim was started in a project dir
      local switcher = require("projections.switcher")
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() == 0 then
            local cwd = vim.loop.cwd()
            if cwd ~= nil then
              switcher.switch(cwd)
            end
          end
        end,
      })
    end,
  },
}
