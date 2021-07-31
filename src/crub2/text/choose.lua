local MC = {}

function MC:main(argv)
    if argv[1] == nil then print("need driver specifier")
    else
        local lb = require('deps.loadbinary')


        local gdsp = lb("./system/KEFI/" .. argv[1] .. "/boot.dsi")

    end
end

return MC