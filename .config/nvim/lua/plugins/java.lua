return {
    {
        'nvim-java/nvim-java',
        config = function()
            require('java').setup()
            vim.lsp.config('jdtls', {
                settings = {
                    java = {
                        sources = {
                            organizeImports = {
                                staticStarThreshold = 3,
                            },
                        },
                        saveActions = {
                            organizeImports = true,
                        },
                        completion = {
                            favoriteStaticMembers = {
                                "org.mockito.Mockito.*",
                                "org.mockito.ArgumentMatchers.*",
                                "org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*",
                                "org.springframework.test.web.servlet.result.MockMvcResultMatchers.*",
                                "org.springframework.test.web.servlet.result.MockMvcResultHandlers.*",
                                "org.junit.jupiter.api.Assertions.*",
                                "org.assertj.core.api.Assertions.*",
                            },
                        },
                    },
                },
            })
            vim.lsp.enable('jdtls')
        end,
    },
}
