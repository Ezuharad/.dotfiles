return {
  cmd = { 'tinymist' },
    filetypes = { 'typst' },
    single_file_support = true,
    -- on_attach = function(_)
    --   for _, command in ipairs {
    --     'tinymist.exportSvg',
    --     'tinymist.exportPng',
    --     'tinymist.exportPdf',
    --     'tinymist.exportHtml',
    --     'tinymist.exportMarkdown',
    --     'tinymist.exportText',
    --     'tinymist.exportQuery',
    --     'tinymist.exportAnsiHighlight',
    --     'tinymist.getServerInfo',
    --     'tinymist.getDocumentTrace',
    --     'tinymist.getWorkspaceLabels',
    --     'tinymist.getDocumentMetrics',
    --   } do
    --     local cmd_func, cmd_name, cmd_desc = create_tinymist_command(command)
    --     vim.api.nvim_create_user_command(cmd_name, cmd_func, { nargs = 0, desc = cmd_desc })
    --   end
    -- end,
}
