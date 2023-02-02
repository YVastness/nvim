local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- 必须是这个顺序
require("lsp.mason")
require("lsp.code-actions")
require("lsp.handlers")
