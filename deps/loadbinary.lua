return function (__fname)
    if __fname == nil then return nil end
    return loadfile(__fname)()
end