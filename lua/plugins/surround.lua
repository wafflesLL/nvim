return{
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        local surround_config = require("../configs/configSurround") -- replace "path.to.config" properly
        surround_config.setup()
    end
}
