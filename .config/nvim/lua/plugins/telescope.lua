return {
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        opts = {},
        config = function()
            local telescope = require("telescope")
            local telescopeConfig = require("telescope.config")

            -- Clone the default Telescope configuration
            local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

            -- I want to search in hidden/dot files.
            table.insert(vimgrep_arguments, "--hidden")
            -- I don't want to search in the `.git` directory.
            table.insert(vimgrep_arguments, "--glob")
            table.insert(vimgrep_arguments, "!**/.git/*")

            telescope.setup({
                defaults = {
                    -- `hidden = true` is not supported in text grep commands.
                    vimgrep_arguments = vimgrep_arguments,
                },
                pickers = {
                    find_files = {
                        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                        find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                    },
                },
            })
        end,
        keys = function()
            local builtin = require("telescope.builtin")
            return {
                {
                    "<leader>ff",
                    function() builtin.find_files() end,
                    desc = "Telescope find files",
                },
                {
                    "<leader>fg",
                    function() builtin.live_grep() end,
                    desc = "Telescope live grep",
                },
                {
                    "<leader>fc",
                    function() builtin.grep_string() end,
                    desc = "Telescope search for selection or word under cursor",
                },
                {
                    "<leader>fb",
                    function() builtin.buffers() end,
                    desc = "Telescope buffers",
                },
                {
                    "<leader>fh",
                    function() builtin.help_tags() end,
                    desc = "Telescope help tags",
                },
            }
        end,
    }
}
