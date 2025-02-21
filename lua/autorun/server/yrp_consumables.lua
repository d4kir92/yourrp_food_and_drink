hook.Add(
	"get_yourrp_addons",
	"yrp_consumables",
	function()
		local tab = {}
		tab.name = "YourRP Consumables (Food and Drink)"
		tab.author = "D4KiR"
		tab.description = "Food and Drinks for YourRP, also alcohol"
		tab.icon = "https://steamuserimages-a.akamaihd.net/ugc/787500164841486103/7E289870349A87C25D067455FC815C58C5E79691/?imw=268&imh=268"
		tab.workshopid = "1952658937"
		tab.discord = "https://discord.gg/ZzbezAJ"
		tab.settings = ""
		if YRP and YRP.AddYRPAddon then
			local res = YRP:AddYRPAddon(tab)
			if not res then
				print("[YourRP Consumables] FAILED TO ADD!!!")
			end
		else
			print("YRP or YRP:AddYRPAddon() not ")
		end
	end
)

local addonname = "YourRP Consumables"
function YRPConsHR()
	MsgC(Color(255, 255, 0), "-------------------------------------------------------------------------------\n")
end

function YRPConsHRError()
	MsgC(Color(255, 0, 0), "-------------------------------------------------------------------------------\n")
end

function YRPConsPrint(msg)
	if msg then
		MsgC(Color(255, 255, 0), "[" .. addonname .. "] " .. msg .. "\n")
	end
end

function YRPConsPrintError(msg)
	if msg then
		MsgC(Color(255, 0, 0), "[" .. addonname .. "] " .. msg .. "\n")
	end
end

function YRPConsHasRequiremSWEPs()
	local hasreq1 = false
	local hasreq2 = false
	for i, addon in pairs(engine.GetAddons()) do
		addon.wsid = tostring(addon.wsid)
		if addon.wsid == "108024198" and addon.mounted and addon.downloaded then
			hasreq1 = true
		elseif addon.wsid == "799086111" and addon.mounted and addon.downloaded then
			hasreq2 = true
		end
	end

	if not hasreq1 then
		YRPConsPrintError("MISSING REQUIREMSWEP: [108024198] Food and Household items")
	end

	if not hasreq2 then
		YRPConsPrintError("MISSING REQUIREMSWEP: [799086111] [NOM] Star Wars Mandalorian Props")
	end
end

local InitCounter = 0
function YRPConsInit()
	YRPConsHR()
	YRPConsPrint("LOADING!")
	if YRP_SQL_INIT_DATABASE and YRP_SQL_ADD_COLUMN then
		YRPConsPrint("LOADED!")
		YRPConsHR()
	else
		InitCounter = InitCounter + 1
		YRPConsHRError()
		YRPConsPrintError("FAILED TO LOAD!")
		YRPConsPrintError("YourRP is not active! Switch to YourRP")
		YRPConsPrintError("In Server-Console:")
		YRPConsPrintError("gamemode yourrp")
		YRPConsPrintError("changelevel MAPNAME")
		YRPConsHRError()
		if InitCounter < 2 then
			timer.Simple(2, YRPConsInit)
		end
	end
end

timer.Simple(2, YRPConsInit)
