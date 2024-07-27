-- This script would allow wall climbing
local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

if humanoidRootPart then
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Upwards movement
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Parent = humanoidRootPart
end
