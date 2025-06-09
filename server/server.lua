local function HasAccess(source, perm)
    if not Config.UseAcePerms then return true end
    if not perm then return true end
    return IsPlayerAceAllowed(source, perm)
end

-- Setup permission for the locations
local function FilterLocations(source)
    local filtered = {}

    for _, category in ipairs(Config.Categories) do
        if HasAccess(source, category.ace_perm) then
            local filteredCategory = {
                name = category.name,
                locations = {}
            }

            for _, location in ipairs(category.locations) do
                if HasAccess(source, location.ace_perm) then
                    table.insert(filteredCategory.locations, location)
                end
            end

            if #filteredCategory.locations > 0 then
                table.insert(filtered, filteredCategory)
            end
        end
    end

    return filtered
end

-- Request the locations, also checks if permission support is enabled.
RegisterNetEvent('dxn-tpmenu:requestLocations', function()
    local source = source

    if Config.UseAcePerms and not HasAccess(source, "teleport.use") then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Error',
            description = 'You do not have permission to use this menu',
            type = 'error',
						position = 'center-right'
        })
        return
    end

    -- Send the locations to the player
    TriggerClientEvent('dxn-tpmenu:receiveLocations', source, FilterLocations(source))
end)
