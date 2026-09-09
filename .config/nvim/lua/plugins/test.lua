return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        keys = function()
            local neotest = require("neotest")
            local keys = {
                {
                    "<leader>tt",
                    function() neotest.run.run() end,
                    desc = "Run the nearest test"
                },
                {
                    "<leader>tf",
                    function() neotest.run.run(vim.fn.expand("%")) end,
                    desc = "Run all tests in the current file"
                },
                {
                    "<leader>to",
                    function() neotest.output_panel.toggle() end,
                    desc = "Toggle test output panel"
                },
                {
                    "<leader>ts",
                    function() neotest.summary.toggle() end,
                    desc = "Toggle test summary"
                },
            }
            return keys
        end,
    },
}
