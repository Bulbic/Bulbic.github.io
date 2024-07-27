-- LocalScript in StarterPlayerScripts
local LocalPlayer = game.Players.LocalPlayer
local tmp = Instance.new("StarterGui", LocalPlayer.PlayerGui)
local tmpa = Instance.new("TextLabel", tmp)
tmoa.Visible = true
tmpa.AnchorPoint = "0.5, 1"
tmpa.Position = Udim2.new(0.5,0,0.5,0)
tmpa.Text = "T to Enable"
wait(2)
tmpa.Visible = false
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local isSpectating = false

-- Function to find the nearest player
local function findNearestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (player.Character.Head.Position - LocalPlayer.Character.Head.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end

    return closestPlayer
end

-- Function to lock the camera onto the nearest player's head
local function spectateNearestPlayer()
    local targetPlayer = findNearestPlayer()
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
        local head = targetPlayer.Character.Head
        isSpectating = true
        Camera.CameraType = Enum.CameraType.Scriptable

        RunService.RenderStepped:Connect(function()
            if isSpectating then
                Camera.CFrame = CFrame.new(head.Position + Vector3.new(0, 5, 10), head.Position)
            end
        end)
    end
end

-- Function to stop spectating
local function stopSpectating()
    isSpectating = false
    Camera.CameraType = Enum.CameraType.Custom
end

-- Example: Toggle spectate mode with a key press (e.g., "T")
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.T then
            if isSpectating then
                stopSpectating()
            else
                spectateNearestPlayer()
            end
        end
    end
end)

-- Automatically start spectating the nearest player when the game starts
LocalPlayer.CharacterAdded:Connect(function()
    wait(1)  -- Wait a moment to ensure the character is loaded
    spectateNearestPlayer()
end)

-- Stop spectating when the player dies
LocalPlayer.CharacterRemoving:Connect(function()
    stopSpectating()
end)
