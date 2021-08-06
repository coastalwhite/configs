return {
  settings = {
        texlab = {
            build = {
                executable = "tectonic";
                args = {
                    "%f",
                    "--synctex",
                    "--keep-logs",
                    "--keep-intermediates",
                };
                onSave = true;
            };
        };
    },
    on_attach = function() end,
}
