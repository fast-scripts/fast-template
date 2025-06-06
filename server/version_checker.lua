local resource = GetInvokingResource() or GetCurrentResourceName()
local script = GetResourceMetadata(resource, 'scriptname', 0)
local version = GetResourceMetadata(resource, 'version', 0)
local newversion

Citizen.CreateThread(function()
    local function ToNumber(str)
        return tonumber(str)
    end

    PerformHttpRequest('https://raw.githubusercontent.com/fast-scripts/fast-versionchecker/refs/heads/main/'.. script .. '.txt', function(error, result, headers)
        if error ~= 200 then
            return print('^1The version check failed, HTTP error: '..tostring(error)..'^0')
        end

        if not result then
            return print('^1The version check failed, no data received.^0')
        end

        local success, decodedResult = pcall(function() return json.decode(result) end)
        if not success or not decodedResult then
            return print('^1The version check failed, unable to parse JSON.^0')
        end

        if ToNumber(decodedResult.version:gsub('%.', '')) > ToNumber(version:gsub('%.', '')) then
            print('^3['..script..'] - New update available now!^0\nCurrent Version: ^1'..version..'^0.\nNew Version: ^2'..decodedResult.version..'^0.\nNews: ^2'..decodedResult.news..'^0.\n^5Download it now on your https://keymaster.fivem.net/^0.')
        else
            print('^3['..script..'] ^2- You are using the latest version of the script. ^0\nCurrent Version: ^1'..version..'^0.')
        end
    end, 'GET')
end)