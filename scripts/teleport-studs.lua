-- LocalScript in StarterPlayerScripts
local tpAmount = 5 -- Change this to whatever.
-- ^ * This is in STUDS *
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create a LocalValue to store teleport distance
local teleportDistanceValue = Instance.new("IntValue")
teleportDistanceValue.Name = "TeleportDistance"
teleportDistanceValue.Value = tpAmount 
teleportDistanceValue.Parent = ReplicatedStorage

-- Function to teleport the player
local function teleportPlayer(player, distance)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart
        local direction = humanoidRootPart.CFrame.LookVector -- Get the forward direction
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + direction * distance
    end
end

-- Function to handle input for teleportation
local function onInput(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.T then
        local player = Players.LocalPlayer
        local distance = teleportDistanceValue.Value  -- Get the teleport distance from LocalValue
        teleportPlayer(player, distance)
    end
end

-- Connect the input handler
UserInputService.InputBegan:Connect(onInput)
