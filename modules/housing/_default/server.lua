Housing = Housing or {}

---@param src number
---@param insideId string
RegisterNetEvent('fast-template:server:onPlayerInside', function(src, insideId)
    local currentBucket = GetPlayerRoutingBucket(src)
    local playerEntity = GetPlayerPed(src)
    local playerCoords = GetEntityCoords(playerEntity)
    TriggerEvent('fast-template:client:onPlayerInside', src, insideId, currentBucket, playerCoords)
end)

return Housing