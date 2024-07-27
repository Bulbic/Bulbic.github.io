-- LocalScript in StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")

-- No-clip settings
local noClipping = false

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = screenGui
statusLabel.Position = UDim2.new(0.5, -100, 0.9, -50)
statusLabel.Size = UDim2.new(0, 200, 0, 50)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.TextStrokeTransparency = 0.5
statusLabel.TextScaled = true
statusLabel.Text = "No-Clip: Off"

local function toggleNoClip()
    noClipping = not noClipping
    if noClipping then
        statusLabel.Text = "No-Clip: On"
        -- Enable no-clip
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    else
        statusLabel.Text = "No-Clip: Off"
        -- Disable no-clip
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Key binding for no-clip toggle
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.N then
        toggleNoClip()
    end
end)
