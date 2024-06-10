local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000
}

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},
  }
}
