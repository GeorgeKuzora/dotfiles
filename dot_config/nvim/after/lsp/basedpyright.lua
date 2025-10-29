return {
  cmd = { 'basedpyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
    '.jj',
  },
  settings = {
    basedpyright = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
    python = {
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "recommended",
        exclude = { "hidden*", ".venv" },
        allowedUntypedLibraries = { "mdw_tracing", "app.system.tracing" },
      },
    },
  },
}
