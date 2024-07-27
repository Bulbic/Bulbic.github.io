local plrs = game.Players
local bb = Instance.new("BillboardGui")
local txt = Instance.new("TextLabel", bb)
local hlght = Instance.new("Highlight")

local function onPlayerAdded(player)
    local function onCharacterAdded(character)
        local head = character:WaitForChild("Head")
        bb.Adornee = head
        bb.Parent = head
        txt.BackgroundTransparency = 1
        txt.TextColor3 = Color3.fromRGB(255,255,255)
        txt.RichText = true
        txt.Text = "<b>"..player.Name.."</b>"
        hlght.Parent = character.Torso or character.UpperTorso
    end
  
for _, player in ipairs(plrs:GetPlayers()) do
    onPlayerAdded(player)
end
