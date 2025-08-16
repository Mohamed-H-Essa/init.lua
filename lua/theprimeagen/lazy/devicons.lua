return {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require('nvim-web-devicons').setup {
            -- Your personal icon preferences
            -- In your devicons config
            override = {
                dart = {
                    icon = "",
                    color = "#0175C2",
                    name = "Dart"
                },
                ["pubspec.yaml"] = {
                    icon = "",
                    color = "#02569B",
                    name = "Flutter"
                },
                ["analysis_options.yaml"] = {
                    icon = "",
                    color = "#02569B",
                    name = "Flutter"
                },
                ["pubspec.lock"] = {
                    icon = "",
                    color = "#FFA500",
                    name = "FlutterLock"
                },
                -- Android specific
                ["build.gradle"] = {
                    icon = "",
                    color = "#02303A",
                    name = "Gradle"
                },
                -- iOS specific
                ["Info.plist"] = {
                    icon = "",
                    color = "#000000",
                    name = "Apple"
                },
            },default = true, -- globally enable default icons
        }
    end
}
