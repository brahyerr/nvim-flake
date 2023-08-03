require('hardtime').setup {
  disabled_keys = {
    -- remove arrow keys from disabled list
    ['<UP>'] = {},
    ['<DOWN>'] = {},
    ['<RIGHT>'] = {},
    ['<LEFT>'] = {},
  },
}
