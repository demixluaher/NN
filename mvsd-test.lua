pcall(function()
    game:GetService("AdService").Advertisement:Remove()
    warn("StringHub: Fucked up BAC")
end)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("StringHub UI", "DarkTheme")

local AboutTab = Window:NewTab("About")
local VisualsTab = Window:NewTab("Visuals")
local CombatTab = Window:NewTab("Combat")
local RageTab = Window:NewTab("Rage")


local About = AboutTab:NewSection("About script")
About:NewLabel("Thanks for using script.")
About:NewLabel("@DemixLuasher (Telegram)")
About:NewLabel("Version: 1.1")

About:NewKeybind(
    "Toggle UI",
    "Enabling/Disabling UI",
    Enum.KeyCode.V,
    function()
        pcall(function()
            Library:ToggleUI()
        end)
    end
)

local Visuals = VisualsTab:NewSection("Visuals")
Visuals:NewToggle(
    "Chams",
    "Toggles chams for enemies",
    function(bool)
        _G.Chams = bool

        if _G.Chams == false then
            for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
                if Player.Character:FindFirstChild("Chams_NN") ~= nil then
                    Player.Character:FindFirstChild("Chams_NN"):Remove()
                end
            end
        end

        while _G.Chams do
            for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
                if game:GetService("Players").LocalPlayer:GetAttribute("Match") ~= nil or game:GetService("Players").LocalPlayer.Neutral ~= false then
                    if Player:GetAttribute("Match") == game:GetService("Players").LocalPlayer:GetAttribute("Match") and Player.Team ~= game:GetService("Players").LocalPlayer.Team and Player.Character:FindFirstChild("Chams_NN") == nil then
                        local Highlight = Instance.new("Highlight")
                        Highlight.Parent = Player.Character
                        Highlight.Name = "Chams_NN"
                    end
                else
                    if Player.Character:FindFirstChild("Chams_NN") then
                        Player.Character:FindFirstChild("Chams_NN"):Remove()
                    end
                end
            end

            task.wait()
        end
    end
)

local Rage = RageTab:NewSection("Rage")

Rage:NewToggle(
    "Auto Win (Requires equiped gun)",
    "Instantly kills everyone enemy",
    function(bool)
        _G.AutoWin = bool

        while _G.AutoWin do
            if game:GetService("Players").LocalPlayer.PlayerGui.RoundCountdown.Enabled == false then
                for _, Player in ipairs(game:GetService("Players"):GetPlayers()) do
                    if game:GetService("Players").LocalPlayer:GetAttribute("Match") ~= nil or game:GetService("Players").LocalPlayer.Neutral ~= false then
                        local Args = {
                            [1] = Vector3.new(32.57596206665039, 63.999996185302734, -70.91218566894531),
                            [2] = Vector3.new(71.0096435546875, 72.92286682128906, -78.91159057617188),
                            [3] = Player.Character.Head,
                            [4] = Vector3.new(25.552597045898438, 64.76952362060547, -68.99844360351562)
                        }
                        
                        game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(unpack(Args))
                    end
                end
            end

            wait(1)
        end
    end
)

Rage:NewToggle(
    "Lagger (Requires equpped knife, read desc)",
    "Throwing much knifes, effective ONLY ON MOBILE PLAYERS!!!",
    function(bool)
        _G.Lagger = bool

        while _G.Lagger do
            if game:GetService("Players").LocalPlayer.PlayerGui.RoundCountdown.Enabled == false then
                local Args = {
                    [1] = Vector3.new(-166.35072326660156, 161.13876342773438, 68.01188659667969),
                    [2] = Vector3.new((10 / math.random(-99,99)), (10 / math.random(-99,99)), (10 / math.random(-99,99)))
                }
                
                game:GetService("ReplicatedStorage").Remotes.ThrowStart:FireServer(unpack(Args))
            end

            task.wait()
        end
    end
)

Rage:NewToggle(
    "Fire Rate",
    "Increase gun fire rate",
    function(bool)
        _G.FireRate = bool

        if _G.FireRate == false then
            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if Tool:GetAttribute("Cooldown") ~= nil then
                    Tool.Parent = game:GetService("Players").LocalPlayer.Backpack
                end
            end

            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if Tool:GetAttribute("Cooldown") ~= nil then
                    Tool:SetAttribute("Cooldown", 2.5)
                end
            end
        end

        while _G.FireRate do
            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if Tool:GetAttribute("Cooldown") ~= nil then
                    Tool:SetAttribute("Cooldown", 0)
                end
            end

            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if Tool:GetAttribute("Cooldown") ~= nil then
                    if Tool:GetAttribute("Cooldown") == 2.5 then
                        Tool.Parent = game:GetService("Players").LocalPlayer.Backpack
                    end
                end
            end

            task.wait()
        end
    end
)

Rage:NewToggle(
    "Fast Knife Throw",
    "Increase throwing knife speed",
    function(bool)
        _G.FastKnifeThrow = bool

        if _G.FastKnifeThrow == false then
            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if Tool:GetAttribute("ThrowSpeed") ~= nil then
                    Tool.Parent = game:GetService("Players").LocalPlayer.Backpack
                end
            end

            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if Tool:GetAttribute("ThrowSpeed") ~= nil then
                    Tool:SetAttribute("ThrowSpeed", 150)
                end
            end
        end

        while _G.FastKnifeThrow do
            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if Tool:GetAttribute("ThrowSpeed") ~= nil then
                    Tool:SetAttribute("ThrowSpeed", 999)
                end
            end

            for _,Tool in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                if Tool:GetAttribute("ThrowSpeed") ~= nil then
                    if Tool:GetAttribute("ThrowSpeed") == 150 then
                        Tool.Parent = game:GetService("Players").LocalPlayer.Backpack
                    end
                end
            end

            task.wait()
        end
    end
)