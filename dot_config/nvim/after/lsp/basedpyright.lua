return {
  settings = {
    python = {
      analysis = {
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        exclude = { "hidden*", ".venv" },
        allowedUntypedLibraries = { "mdw_tracing", "app.system.tracing" },
      },
    },
  },
}
