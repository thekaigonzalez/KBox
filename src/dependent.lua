package.cpath = package.cpath .. ";deps/?.so" -- prevent error with dependencies


return function (ts)
    return require(ts)
end