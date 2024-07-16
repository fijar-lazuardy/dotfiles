return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'dracula',
      component_separators = '|',
      section_separators = '',
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = true,   -- Display new file status (new file means no write after created)
          path = 3,                -- 0: Just the filename
          shorting_target = 120,   -- Shortens path to leave 40 spaces in the window
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New]',     -- Text to show for newly created file before first write
          }
        }
      },
      lualine_x = { 'filetype' },
      lualine_y = { 'hostname' },
      lualine_z = { 'location' }
    },

  },
}
