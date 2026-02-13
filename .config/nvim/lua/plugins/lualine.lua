return {
  {
    'nvim-lualine/lualine.nvim',
    opts = function()
      local opts = {
        options = {
          theme = 'horizon',
          component_separators = { left = '|', right = '|'},
          section_separators = { left = '', right = ''},
        }
      }
      return opts
    end
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = {}
  }
}
