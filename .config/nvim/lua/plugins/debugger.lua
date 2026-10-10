return {
    {
        "rcarriga/nvim-dap-ui",
        lazy = false,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            "nvim-java/nvim-java",
        },
        opts = {},
        keys = function ()
            local dap, dapui = require("dap"), require("dapui")
            return {
                {
                    "<leader>xo",
                    function() dapui.toggle() end,
                    desc = "Open DAP UI"
                },
                {
                    "<leader>xb",
                    function() dap.toggle_breakpoint() end,
                    desc = "Toggle Breakpoint"
                },
                {
                    "<leader>xB",
                    function() dap.clear_breakpoints() end,
                    desc = "Clear All Breakpoints"
                },
                {
                    "<leader>xl",
                    function() dap.list_breakpoints(true) end,
                    desc = "List All Breakpoints"
                },
                {
                    "<leader>xx",
                    function() dap.continue() end,
                    desc = "Debugger Continue"
                },
                {
                    "<A-k>",
                    function() dap.restart_frame() end,
                    desc = "Debugger Restart Current Frame"
                },
                {
                    "<A-j>",
                    function() dap.step_over() end,
                    desc = "Debugger Step Over"
                },
                {
                    "<A-l>",
                    function() dap.step_into() end,
                    desc = "Debugger Step Into"
                },
                {
                    "<A-h>",
                    function() dap.step_out() end,
                    desc = "Debugger Step Out"
                },
            }
        end,
        config = function()
            vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({
                wrap = true,
                layouts = {
                    {
                        elements = {
                            {
                                id = "console",
                                size = 0.5
                            },
                            {
                                id = "scopes",
                                size = 0.5
                            },
                        },
                        position = "bottom",
                        size = 22
                    },
                },
            })

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
}
