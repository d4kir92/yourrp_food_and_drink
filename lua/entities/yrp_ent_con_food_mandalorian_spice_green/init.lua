--This makes sure clients download the file
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
function ENT:Initialize()
    self:SetModel("models/sw_mandalorian_spice/mandalorian_spice_green.mdl")
    self:Start()
end
