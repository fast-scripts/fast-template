if GetResourceState('qb-houses') ~= 'started' then return end

Housing = Housing or {}

RegisterNetEvent('qb-houses:server:SetInsideMeta', function(insideId, bool)
    local src = source
    insideId = bool and insideId or nil
    TriggerEvent('fast-template:server:onPlayerInside', src, insideId)
end)

return Housing