require('todo-comments').setup(
{
    keywords = {
        FIX = {
            icon = " ",
            color = "#d13e23", --"error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            -- signs = false,
        },
        TODO = { icon = "❇ ", color = "#88cc66" },
        HACK = { icon = " ", color = "#cc8bc9" },
        WARN = { icon = " ", color = "#f4b371", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "#8ebeec", alt = { "INFO" } },
        DONE = { icon = " ", color = "#6d6d6d" },
        REVISIT = { icon = "! ", color = "#d13e23" },
        UNCOMMENT = { icon = "# ", color = "#4f4f4f" },
        TEST = { icon = "- ", color = "#9d9d9d", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#d13e23" },
        warning = { "DiagnosticWarn", "WarningMsg", "#f4b371" },
        info = { "DiagnosticInfo", "#88cc66" },
        hint = { "DiagnosticHint", "#8ebeec" },
        default = { "Identifier", "#cc8bc9" },
        test = { "Identifier", "#ed974b" }
    },
}
)
