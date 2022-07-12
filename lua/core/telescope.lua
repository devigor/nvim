require('telescope').setup({
  defaults = {
    path_display={"truncate"},
    layout_config = {
      prompt_position = "top",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
  },
})

require("project_nvim").setup{}
require("telescope").load_extension('projects')
