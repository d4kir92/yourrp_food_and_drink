--This makes sure clients download the file
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
function ENT:Initialize()
    self:SetModel("models/foodnhouseholditems/chipsbag1.mdl")
    self:Start()
end
