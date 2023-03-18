-- skid this I dont care, made this with 10% of my skills and since dhc selling is dead why not leak it
-- more so used for buyers
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({
    Name = "Open Source Selling GUI [ fortunatesouls#8803 ]",
    LoadingTitle = "Loading Open Source Selling GUI..",
    LoadingSubtitle = "made by fortunatesouls#8803",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "OpenSourceSellingGUI"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
       Title = "Key System - Checkpoint 1/1",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = "ri"
    }
 })

 local Tab = Window:CreateTab("Main")
 local Section = Tab:CreateSection("Essential Selling Tools Below")

 local Button = Tab:CreateButton({
    Name = "Buy Money Gun",
    Callback = function()
        local OldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Workspace.Ignored.Shop["[Money Gun] - $800"]:GetChildren()) do
            if v.Name == "Head" and v:IsA("Part") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0,3,0)
                task.wait(0.9)
                fireclickdetector(game.Workspace.Ignored.Shop["[Money Gun] - $800"].ClickDetector)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OldPos
            end
        end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Drop",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            game:GetService('RunService'):BindToRenderStep("AutoDrop", 0, function()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
            end)
        else
            game:GetService('RunService'):UnbindFromRenderStep("AutoDrop")
        end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Block Drop",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            getgenv().BlockDrop = true
            while BlockDrop == true do
                task.wait()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Block", true)
                game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
            end
        else
            getgenv().BlockDrop = false
        end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Cash Aura",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            game:GetService('RunService'):BindToRenderStep("CashAura", 0, function()
                for i,v in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                    if v:IsA("Part") and v.Name == ("MoneyDrop") then
                        if (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 13.5 then
                            fireclickdetector(v:FindFirstChild("ClickDetector"))
                        end
                    end
                end
            end)
        else
            game:GetService('RunService'):UnbindFromRenderStep("CashAura")
        end
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Drop With Money Gun [ MUST OWN GUN ]",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            getgenv().e = true
            while e == true do
                wait()
            game.Players.LocalPlayer.Backpack:FindFirstChild("[Money Gun]").Parent = game.Players.LocalPlayer.Character
            game.Players.LocalPlayer.Character:FindFirstChild("[Money Gun]"):Activate()
            end
        else
            getgenv().e = false
        end
    end,
 })

if selectedPlr ~= nil then
    local Paragraph = Tab:CreateParagraph({Title = "Selected Player Cash: ", Content = "Cash : " ..tostring(game.Players[selectedPlr].DataFolder.Currency.Value)})
end

local Button = Tab:CreateButton({
    Name = "IKU Cash Counter",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/OG5/IkuScripts/main/DH/MoneyCounter', true))()
    end,
 })

--  // Target Section \\
local Tab = Window:CreateTab("Target")
local Section = Tab:CreateSection("Target Section")

local plrs = {}
local selectedPlr

for _, v in next, game:GetService("Players"):GetPlayers() do
    if v.Name ~= game.Players.LocalPlayer.Name then
        table.insert(plrs, v.Name)
    end
end

local Dropdown = Tab:CreateDropdown({
	Name = "Select Player",
	Options = plrs,
	CurrentOption = "nil",
	Flag = "players",
	Callback = function(x)
	  	selectedPlr = x
	end,
})

local Button = Tab:CreateButton({
	Name = "Teleport To Selected Player",
	Callback = function()
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selectedPlr].Character.HumanoidRootPart.CFrame
	end,
})

local Toggle = Tab:CreateToggle({
    Name = "Head Sit Selected Player",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            getgenv().Headsit = true
            while Headsit == true do
                task.wait(0.001)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[selectedPlr].Character.Head.CFrame
                game.Players.LocalPlayer.Character.Humanoid.Sit = true
            end
        else
            getgenv().Headsit = false
        end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Annoy Call Selcted Player",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            getgenv().AnnoyCall = true
            while AnnoyCall == true do
                task.wait()
                game.Players.LocalPlayer.Backpack:FindFirstChild("[Phone]").Parent = game.Players.LocalPlayer.Character
                game:GetService("ReplicatedStorage").MainEvent:FireServer("PhoneCall", selectedPlr)
                wait(0.000000000001)
                game.Players.LocalPlayer.Character:FindFirstChild("[Phone]").Parent = game.Players.LocalPlayer.Backpack
            end
        else
            getgenv().AnnoyCall = false
        end
    end,
 })

 --  // Credits Section \\
local Tab = Window:CreateTab("Credits")
local Section = Tab:CreateSection("Credits")
local Label = Tab:CreateLabel("Made By fortunatesouls#8803")
