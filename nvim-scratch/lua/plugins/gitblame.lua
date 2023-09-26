local M = {
  {
    "f-person/git-blame.nvim",
    opts = {
      date_format = "%x-%r",
      message_template = "    <author> • <date> • <summary>",
      message_when_not_committed = "  !! Not Committed !!",
    },
  },
}

return M
