return {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "css", "javascript" },
  init_options = {
    configurationSelection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    }
  },
  settings = {}
}
