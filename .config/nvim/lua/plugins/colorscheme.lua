return {
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        config = function()
            require("onedarkpro").setup({
                colors = {
                    onedark = { bg = "#161a1d" },
                }
            })
            vim.cmd("colorscheme onedark")
        end
    },
}
