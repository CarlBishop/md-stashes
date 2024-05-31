local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
if Config.Inv == 'ox' then
    for k, v in pairs (Config.stash) do 
        if v.weight == nil then v.weight = Config.Defaultweight end
	if v.slots == nil then v.slots = Config.Defaultslot end
        local stash = {
        id = k,
        label = v.name,
        slots = v.slots,
        weight = v.weight,
        }
        exports.ox_inventory:RegisterStash(stash.id, stash.label, stash.slots, stash.weight)
    end
end    
end)

lib.addCommand('newstash', {
    help = "Make A New Stash",
    restricted = 'group.admin',
}, function(source, args, raw)
    local src = source
    TriggerClientEvent('md-stashes:client:doray', src)
end)

RegisterServerEvent('md-stashes:server:OpenStash', function(name, weight, slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local data = { label = name, maxweight = weight, slots = slot }
    exports['qb-inventory']:OpenInventory(source, name, data)
end)