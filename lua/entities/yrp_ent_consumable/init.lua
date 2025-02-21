--This makes sure clients download the file
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
include("shared.lua")
function ENT:Think()
end

function ENT:Start()
    self:SetUseType(SIMPLE_USE)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Use(activator, caller)
    local ply = activator
    if IsValid(activator) then
        if ply.Drink == nil or ply.Eat == nil or ply.Heal == nil then
            YRPConsPrintError("NOT IN YOURRP GAMEMODE!")

            return false
        end

        if self.thirst ~= nil and self.thirst > 0 then
            ply:Drink(self.thirst, self.alcohol)
        end

        if self.hunger ~= nil and self.hunger > 0 then
            ply:Eat(self.hunger)
        end

        if self.hp ~= nil and self.hp > 0 then
            ply:Heal(self.hp)
        end

        self:Remove()
    end
end
