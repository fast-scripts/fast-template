RegisterNUICallback('nuiReady', function(data, cb)
    NuiLoaded = true
    print('NUI Loaded!')
    cb('ok')
end)