-- Contains System logic for Filesystem emulation
local dep = require('src.dependent')

dep("filesystem") -- Include the filesystem


return {
    blocks={
        0x01,
        0x0013,
        0x329,
        0x912381,
        0x0123
    }
    ,
    nodes={}
}
