-- This script would be used to enable flying
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character and character:FindFirstChildOfClass("Humanoid")
local bodyVelocity = Instance.new("BodyVelocity", character.PrimaryPart)
bodyVelocity.Velocity = Vector3.new(0, 50, 0) -- Set upwards velocity
bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0) -- Unlimited force upwards
