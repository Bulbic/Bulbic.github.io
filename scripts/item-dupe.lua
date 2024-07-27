-- This script would be used to duplicate items
local itemToDupe = "Wallet" -- Replaxe with whatever.
local player = game.Players.LocalPlayer
local backpack = player:FindFirstChildOfClass("Backpack")

if backpack then
    for _, item in pairs(backpack:GetChildren()) do
        -- Clone the item and add it back to the backpack
        local check = backpack:FindFirstChild(itemToDupe)
        if check then
       local c = check:Clone()
       c.Parent = backpack
    else
      local tmp1 = Instance.new("ScreenGui", player.PlayerGui)
      local tmp2 = Instance.new("TextLabel", tmp1)
      tmp2.Text = "That item wasn't found in your inventory")
    tmp.TextScaled = true
    tmp.AnchorPoint = 0.5,0.5
    tmp.Position = Udim2.new(0.5,0,0.5,0)
    end 
    end
end
