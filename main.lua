local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Asyra Hub",
    SubTitle = "Growblox",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark"
})

local Tabs = {
    Rotation = Window:AddTab({ Title = "Rotation", Icon = "repeat" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- Section: Farm Rotation
local FarmSection = Tabs.Rotation:AddSection("Farm Rotation")

local StartRotation = Tabs.Rotation:AddToggle("StartRotation", { Title = "Start Rotation", Default = false })
StartRotation:OnChanged(function(Value)
    print("Rotation state:", Value)
end)

local WorldInput = Tabs.Rotation:AddInput("WorldInput", {
    Title = "Farm Worlds",
    Default = "",
    Placeholder = "Input world name...",
    Callback = function(Value)
        print("World added:", Value)
    end
})

Tabs.Rotation:AddButton({
    Title = "Add Current World",
    Callback = function()
        print("Add current world clicked")
    end
})

local CropDropdown = Tabs.Rotation:AddDropdown("CropSource", {
    Title = "Crop Source",
    Values = {"Auto Detect", "Wheat", "Corn"},
    Default = "Auto Detect",
    Callback = function(Value)
        print("Selected crop:", Value)
    end
})

local PnbSlider = Tabs.Rotation:AddSlider("PnbCount", {
    Title = "PNB At Block Count",
    Min = 0,
    Max = 200,
    Default = 170,
    Rounding = 0,
    Callback = function(Value)
        print("PNB Count:", Value)
    end
})

-- Section: Rotation Progress
local StatsSection = Tabs.Rotation:AddSection("Rotation Progress")
local StatusParagraph = Tabs.Rotation:AddParagraph({
    Title = "Status",
    Content = "State: Idle\nWorld: Waiting...\nCrop: Auto Detect\nHarvested: 0 | Planted: 0"
})

Tabs.Rotation:AddButton({
    Title = "Reset Rotation Stats",
    Callback = function()
        StatusParagraph:SetDesc("State: Idle\nWorld: Waiting...\nCrop: Auto Detect\nHarvested: 0 | Planted: 0")
    end
})

Window:SelectTab(1)
