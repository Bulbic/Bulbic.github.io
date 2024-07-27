-- This script enables NoClip
local player = game.Players.LocalPlayer
local character = player.Character

if character then
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.CanCollide = false -- Disable collisions
        end
    end
end
