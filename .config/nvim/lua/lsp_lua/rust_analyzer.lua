return {
    on_attach=function(client, bufnr)
        require'completion'.on_attach(client)
    end,
    setttings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
} 
