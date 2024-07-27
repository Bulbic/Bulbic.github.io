-- This script allows for infinite jumping
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

local function onJumpRequest()
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        humanoid:Move(Vector3.new(0, 50, 0)) -- Apply upward force
    end
end

userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        onJumpRequest()
    end
end)
