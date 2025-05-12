-- Telegram: @DemixLuasher/@DemixLuaher
-- Discord: demedex123
-- Source code
-- Enjoy until it undetected!

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

if game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("bo") == nil then
    game:GetService("StarterGui"):SetCore(
        "SendNotification",
        {
            Title = "Notification",
            Text = "Cannot find Anti-Cheat. Maybe game was updated/you in hub.",
            Duration = math.huge,
            Button1 = "Okay"
        }
    )
    error("Failed to initilizate. AntiCheat are not detected.")
end

game:GetService("StarterGui"):SetCore(
    "SendNotification",
    {
        Title = "Notification",
        Text = "Script by @DemixLuasher\nWith love\nArma_taZOV is stupid nigga",
        Duration = math.huge,
        Button1 = "Close"
    }
)

if not _G.NNBypass_CTS then
    local AntiCheat = game:GetService("Players").LocalPlayer.PlayerScripts.bo.bo
    local FakeAntiCheat = Instance.new("LocalScript")
    FakeAntiCheat.Parent = game:GetService("Players").LocalPlayer.PlayerScripts.bo
    FakeAntiCheat.Name = "bo"
    AntiCheat.Disabled = true
    AntiCheat:Remove()  

    pcall(function()
        hookfunction(getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Map)["checkHighlight"], function() return false end)
    end)

    _G.NNBypass_CTS = true

    warn("[StringHub] AntiCheat are bypassed.")
end

_G.FriendlyFire = false
_G.NoArmour = false
_G.HitboxExpander = false

_G.Highlight = false
_G.HighlightColor = Color3.fromRGB(0, 255, 0)

local Window = Library.CreateLib("StringHub", "DarkTheme")

local AboutTab = Window:NewTab("About")
local CombatTab = Window:NewTab("Combat")
local VisualsTab = Window:NewTab("Visuals")

local About = AboutTab:NewSection("About")
local Combat = CombatTab:NewSection("Combat")
local Visuals = VisualsTab:NewSection("Visuals")

About:NewKeybind("Toggle UI", "Enabling/Disabling UI", Enum.KeyCode.E, function()
    pcall(function()
        Library:ToggleUI()
    end)
end)

About:NewLabel("Coded: @DemixLuasher (Telegram)")
About:NewLabel("Thanks for using.")
About:NewLabel("Contact to me if you has any questions.")
About:NewLabel("Build: Release 1.6.1 (Bug Fix)")

Combat:NewToggle("Friendly Fire", "Allows you to damage your teammates.", function(Boolean)
    _G.FriendlyFire = Boolean

    game:GetService("Players").LocalPlayer.Neutral = _G.FriendlyFire
end)

Combat:NewToggle("No Armour", "Removes every enemy armour", function(Boolean)
    _G.NoArmour = Boolean

    while _G.NoArmour do
        for _, Vehicle in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
            if game:GetService("Players")[string.sub(Vehicle.Name, 8)].TeamColor == game:GetService("Players").LocalPlayer.TeamColor then continue end
            local PlayerName = Vehicle.Name

            for _, Object in ipairs(Vehicle:GetDescendants()) do
                if Object.Name == "Armour" or Object.Name == "LoD" then
                    Object:Remove()
                end
            end
        end

        wait(0.001)
    end
end)

Combat:NewToggle("Gunner Hitbox Expander", "Make every enemy gunner bigger", function(Boolean)
    _G.HitboxExpander = Boolean

    while _G.HitboxExpander do
        for _, Vehicle in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
            if game:GetService("Players")[string.sub(Vehicle.Name, 8)].TeamColor == game:GetService("Players").LocalPlayer.TeamColor then continue end
            local PlayerName = Vehicle.Name

            for _, Object in ipairs(Vehicle:GetDescendants()) do
                if Object.Name == "Gunner" then
                    Object.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                end
            end
        end

        wait(0.001)
    end
end)

Combat:NewSlider("Hitbox Size", "Select gunner hitbox size", 100, 0, function(Int)
    _G.HitboxSize = Int
end)

Combat:NewButton("Freaky big Hitboxes (1024)", "Sets gunner hitbox size to 1024", function()
    _G.HitboxSize = 1024
end)


Visuals:NewToggle("Highlights", "Like ESP", function(Boolean)
    _G.Highlight = Boolean

    if not _G.Highlight then
        wait()
        for _, Chassis in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
            for _, Object in ipairs(Chassis:GetChildren()) do
                if Object:IsA("Highlight") then
                    Object:Remove()
                end
            end
        end
    end

    while _G.Highlight do
        for _, Chassis in ipairs(game:GetService("Workspace").Vehicles:GetChildren()) do
            if game:GetService("Players")[string.sub(Chassis.Name, 8)].TeamColor == game:GetService("Players").LocalPlayer.TeamColor then continue end

            if Chassis:FindFirstChild("__HIGHLIGHT") == nil then
                local Highlight = Instance.new("Highlight")

                Highlight.Name = "__HIGHLIGHT"
                Highlight.Parent = Chassis
                Highlight.FillTransparency = 0.8
                Highlight.FillColor = _G.HighlightColor
            else
                for _, Object in ipairs(Chassis:GetChildren()) do
                    if Object:IsA("Highlight") then
                        if Object.FillColor ~= _G.HighlightColor then
                            Object.FillColor = _G.HighlightColor
                        end
                    end
                end
            end
        end

        task.wait()
    end
end)

Visuals:NewColorPicker("Highlight Color", "Colorpicker with color for ESP", Color3.fromRGB(0,255,0), function(Color3)
    _G.HighlightColor = Color3
end)
