Core = {}

--- ESX ---

if GetResourceState('es_extended') == 'started' then
	Core = exports["es_extended"]:getSharedObject()

	if IsDuplicityVersion() then
		AM.GetPlayer = function(source)
			return Core.GetPlayerFromId(source)
		end
	else
		AM.IsWhitelisted = function()
			local jobName = Core.GetPlayerData().job.name
			return AM.AllowedJobs[jobName]
		end
	end

	return
end

--- QB ----

if GetResourceState('qb-core') == 'started' then
    Core = exports['qb-core']:GetCoreObject()

    if IsDuplicityVersion() then
        AM.GetPlayer = function(source)
            return {
                source = source,
                identifier = Core.Functions.GetIdentifier(source),
            }
        end
    else
        AM.IsWhitelisted = function()
            local jobName = Core.Functions.GetPlayerData().job.name
            return AM.AllowedJobs[jobName]
        end 
    end
    return
end

---- STANDALONE ------

if IsDuplicityVersion() then
	AM.GetPlayer = function(source)
		return {
			identifier = GetPlayerIdentifierByType(source, 'license'),
			source = source
		}
	end
else
	AM.IsWhitelisted = function()
		return true
	end
end