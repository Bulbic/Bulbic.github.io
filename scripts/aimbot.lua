-- LocalScript in StarterPlayerScripts
local player = game.Players.LocalPlayer
local tmp = Instance.new("StarterGui", LocalPlayer.PlayerGui)
local tmpa = Instance.new("TextLabel", tmp)
tmoa.Visible = true
tmpa.AnchorPoint = "0.5, 1"
tmpa.Position = Udim2.new(0.5,0,0.5,0)
tmpa.Text = "T to Enable"
wait(1)
tmpa.Visible = false
local mouse = player:GetMouse()

local aimbotEnabled = false

local function createNotification(text)
    local screenGui = player:WaitForChild("PlayerGui"):FindFirstChild("CheatStatusGUI") or Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 200, 0, 50)
    textLabel.Position = UDim2.new(0.5, -100, 1, 0)
    textLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.SourceSans
    textLabel.TextSize = 24
    textLabel.Text = text
    textLabel.BackgroundTransparency = 0.5
    textLabel.TextScaled = true
    textLabel.Parent = screenGui
    
    -- Tween in
    textLabel:TweenPosition(UDim2.new(0.5, -100, 0.8, 0), "Out", "Quad", 0.5, true, 
        function()
            wait(1.5)
            textLabel:TweenPosition(UDim2.new(0.5, -100, 1, 0), "Out", "Quad", 0.5, true, function()
                textLabel:Destroy()
            end)
        end
    )
end

local function aimAtClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
            local distance = (otherPlayer.Character.Head.Position - workspace.CurrentCamera.CFrame.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    if closestPlayer then
        local targetPosition = closestPlayer.Character.Head.Position
        mouse.Target = closestPlayer.Character.Head -- Set mouse target to the player's head
        game.Workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetPosition) -- Aim at the target
    end
end

mouse.Button1Down:Connect(function()
    if aimbotEnabled then
        aimAtClosestPlayer()
    end
end)

-- Enable/Disable Aimbot
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Enum.KeyCode.G then
        aimbotEnabled = not aimbotEnabled
        createNotification("Aimbot: " .. (aimbotEnabled and "On" or "Off"))
    end
end)
