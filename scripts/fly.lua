-- LocalScript in StarterPlayerScripts

local player = game.Players.LocalPlayer
local character = player.Character
local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")

-- Flying settings
local flying = false
local flySpeed = 50 -- Speed of flying

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
statusLabel.Text = "Fly: Off"

local function toggleFly()
    flying = not flying
    if flying then
        statusLabel.Text = "Fly: On"
        -- Enable flying
        local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        
        local bodyGyro = Instance.new("BodyGyro", humanoidRootPart)
        bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
        
        while flying do
            bodyVelocity.Velocity = (userInputService:GetMouse().Hit.p - humanoidRootPart.Position).unit * flySpeed
            bodyGyro.CFrame = CFrame.new(humanoidRootPart.Position, userInputService:GetMouse().Hit.p)
            wait()
        end
        -- Cleanup
        bodyVelocity:Destroy()
        bodyGyro:Destroy()
    else
        statusLabel.Text = "Fly: Off"
    end
end

-- Key binding for flying toggle
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        toggleFly()
    end
end)
