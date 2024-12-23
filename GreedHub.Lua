if game.PlaceId == 1730877806 then
    wait(5)
end

if game.PlaceId ~= 1730877806 then
    repeat wait(.25)
    until game.Players.LocalPlayer:FindFirstChild("Loaded")
    and game.Players.LocalPlayer.Loaded.Value == true
    and game.Players.LocalPlayer.Character
    and game.Players.LocalPlayer:FindFirstChild("Backpack")
    and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    and game.Players.LocalPlayer:FindFirstChild("PlayerGui")
    and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Notifications")
    and #game.Players.LocalPlayer.Backpack:GetChildren() ~= 0 and pcall(function() 
        return game.Players.LocalPlayer.Idled
    end)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/sky4no1/fpsboost/refs/heads/main/HalalHub.lua'))()
    wait(5)
end

local player = game.Players.LocalPlayer
local playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local description = ""

local function antiAFK()
    game.Players.LocalPlayer.Idled:Connect(function()
        Instance.new("VirtualInputManager"):SendMouseButtonEvent(400, 400, 0, true, player, 1)
        Instance.new("VirtualInputManager"):SendMouseButtonEvent(400, 400, 0, true, player, 1)
    end)
end 
spawn(antiAFK)

local function rejoinWhenError()
    local gpoMainMenu = "1730877806"       
	if game.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt") then
        game:GetService("TeleportService"):Teleport(gpoMainMenu, game:GetService("Players").LocalPlayer)
    end
end
spawn(rejoinWhenError)

local function antiFallDmg()
    while true do
        local falldmg = workspace.PlayerCharacters:WaitForChild(player.Name):WaitForChild("FallDamage")
        falldmg.Disabled = true
        task.wait()
    end
end
spawn(antiFallDmg)

local function AutoJoinPs()
    if game.PlaceId == 1730877806 then
        game:GetService("ReplicatedStorage").Events.reserved:InvokeServer(getgenv().PrivateServerCode)
        task.wait(2)
        local remote = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("chooseType"):WaitForChild("Frame"):WaitForChild("RemoteEvent")
        remote:FireServer(true)
    end
end

local function enableGravityBP()
    local gravityBypass = Instance.new("BodyForce")
    gravityBypass.Force = Vector3.new(0, workspace.Gravity * game.Players.LocalPlayer.Character.HumanoidRootPart.AssemblyMass, 0)
    gravityBypass.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
end

local function disableGravityBP()
    local gravityPath = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyForce")
    if gravityPath then
        gravityPath:Destroy()
    end
end

local function AutoJoinPsV2()
    if game.PlaceId == 1730877806 then
        coroutine.resume(coroutine.create(AutoJoinPs))
        local remote = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("chooseType"):WaitForChild("Frame"):WaitForChild("RemoteEvent")
        remote:FireServer(true)
    end
end

if getgenv().PrivateServerCode ~= "" and game.PlaceId == 1730877806 then
    AutoJoinPsV2()
end

if game.PlaceId == 3978370137 then
    for i = 1, 20 do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-14801.85546875, 143.291015625, -9169.4658203125))
        task.wait(0.05)
    end
    local args = {
        [1] = "self"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("KnockedOut"):FireServer(unpack(args))
end

local function Tween(position)
    if position then
        local speed = 2000
        local character = player.Character or player.CharacterAdded:Wait()
        local playerPath = workspace.PlayerCharacters:WaitForChild(player.Name)
        if playerPath then
            if not playerPath:GetAttribute("SpeedBypass") then
                playerPath:SetAttribute("SpeedBypass", 0)
            end
        end
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        enableGravityBP()
        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 10000, humanoidRootPart.Position.Z)
        task.wait(2)
        local currentY = humanoidRootPart.Position.Y
        local targetCFrame = CFrame.new(position.X, currentY, position.Z)
        local distance = (humanoidRootPart.Position - targetCFrame.Position).magnitude
        local speedTime = distance / speed
        local tweenInfo = TweenInfo.new(speedTime, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local goal = {CFrame = targetCFrame}
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)

        local running = true
        local dashEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("takestam")
        
        local function dashSpam()
            while running do
                if dashEvent then
                    local args = {
                        [1] = 0.52,
                        [2] = "dash"
                    }
                    dashEvent:FireServer(unpack(args))
                end
                task.wait(3)
            end
        end
        coroutine.resume(coroutine.create(dashSpam))

        local function startConcasser()
            while running and playerPath and 2500 > playerPath:GetAttribute("SpeedBypass") do
                local args = {
                    [1] = "Concasser",
                    [2] = {
                        ["char"] = workspace:WaitForChild("PlayerCharacters"):WaitForChild(player.Name),
                        ["g"] = Vector3.new(0, -196.1999969482422, 0),
                        ["nt"] = 0,
                        ["v0"] = Vector3.new(0, 0, 0),
                        ["t"] = 1,
                        ["x0"] = Vector3.new(0, 0, 0),
                        ["en2"] = Vector3.new(0, 0, 0)
                    }
                }   
            
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args))
                playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
                task.wait()
            end
        end
        startConcasser()

        tween:Play()
        tween.Completed:Wait()
        task.wait(2.5)
        humanoidRootPart.CFrame = CFrame.new(position.X, position.Y, position.Z)
        task.wait(0.5)
        humanoidRootPart.CFrame = CFrame.new(position.X, position.Y, position.Z)
        disableGravityBP()
        running = false
    end
end

local function Farm()
    Tween(Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375))

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    local playerStats = ReplicatedStorage:WaitForChild("Stats" .. player.Name)
    local inventoryValue = playerStats.Inventory.Inventory.Value
    local virtualInputManager = Instance.new("VirtualInputManager")

    local function MagmaKill()
        while true do
            local target = nil
            local scientist = workspace.NPCs:FindFirstChild("Scientist")
            local DFscientist = workspace.NPCs:FindFirstChild("Devil Fruit Scientist")
            local law = workspace.NPCs:FindFirstChild("Law")
            local soulKing = workspace.NPCs:FindFirstChild("Soul King")
            local soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
            local roger = workspace.NPCs:FindFirstChild("Roger")
            local hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
    
            if scientist then
                target = scientist:WaitForChild("Head").CFrame
            elseif DFscientist then
                target = DFscientist:WaitForChild("Head").CFrame
            elseif law then
                target = law:WaitForChild("Head").CFrame
            elseif soulKing then
                target = soulKing:WaitForChild("Head").CFrame
            elseif soulKingRockstar then
                target = soulKingRockstar:WaitForChild("Head").CFrame
            elseif roger then
                target = roger:WaitForChild("Head").CFrame
            elseif hawkEye then
                target = hawkEye:WaitForChild("Head").CFrame
            else
                local factoryPool = workspace.Env:FindFirstChild("FactoryPool")
                local hitbox = factoryPool and factoryPool:FindFirstChild("hitbox")
                local billdboardPool = hitbox and hitbox:FindFirstChild("health")
                local billdboardText = billdboardPool and billdboardPool:FindFirstChild("TextLabel")
                
                if billdboardText and billdboardText.ContentText ~= "----" and billdboardPool and billdboardPool.Enabled == true then
                    target = hitbox.CFrame
                end
            end

            local function getSkillEvents(playerName, class)
                local skillEvents = {}
                for _, item in pairs(ReplicatedStorage:GetChildren()) do
                    if item.Name:match(playerName .. "|ServerScriptService%.Skills%.Skills%.SkillContainer%.Magu%-Magu%.Magma Swamp") and item:IsA(class) then
                        table.insert(skillEvents, item)
                    end
                end
                return skillEvents
            end

            local function getSkillEvents2(playerName, class)
                local skillEvents2 = {}
                for _, item in pairs(ReplicatedStorage:GetChildren()) do
                    if item.Name:match(playerName .. "|ServerScriptService%.Skills%.Skills%.SkillContainer%.Magu%-Magu%.Magma Eruption") and item:IsA(class) then
                        table.insert(skillEvents2, item)
                    end
                end
                return skillEvents2
            end

            if target then
                local skillEvents = getSkillEvents(player.Name, "RemoteEvent")
                for _, skillEvent in pairs(skillEvents) do
                    local args = {
                        [1] = target
                    }
                    skillEvent:FireServer(unpack(args))
                    task.wait()
                end
            end

            if target then
                local skillEvents2 = getSkillEvents2(player.Name, "RemoteEvent")
                for _, skillEvent2 in pairs(skillEvents2) do
                    local args = {
                        [1] = target
                    }
                    skillEvent2:FireServer(unpack(args))
                    task.wait()
                end
            end

            task.wait()
        end
    end
    spawn(MagmaKill)

    local function SendNotifyItemEMBED(url, embed)
        if getgenv().WebhookURL ~= "" and string.find(tostring(inventoryValue), "Fruit Bag") then
            local player = game.Players.LocalPlayer                   
            local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)    
            local http = game:GetService("HttpService")
    
            local bannedStatus = (player:GetAttribute("banned") == true) and "✅" or "❌"

            local headers = {
                ["Content-Type"] = "application/json"
            }
            local data = {
                ["content"] = embed.content,
                ["embeds"] = {
                    {
                        ["title"] = embed.title,
                        ["description"] = "**Name: `" .. player.Name .. "`**\n**Level: `" .. playerStats.Stats.Level.Value .. "`**\n**Shadow Banned: `" .. bannedStatus .. "`**\n\n",
                        ["color"] = embed.color,
                        ["image"] = {
                            ["url"] = embed.image.url
                        },
                        ["thumbnail"] = {
                            ["url"] = embed.thumbnail.url
                        }
                    }
                }
            }
            local body = http:JSONEncode(data)
            local response = request({
                Url = url,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end
    end

    local embedKikoku = {
        ["content"] = "@everyone",
        ["title"] = "You got Kikoku!",
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local embedAce = {
        ["content"] = "@everyone",
        ["title"] = "You got Ace!",
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local embedDarkBlade = {
        ["content"] = "@everyone",
        ["title"] = "You got Dark Blade!",
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local embedScarf = {
        ["content"] = "@everyone",
        ["title"] = "You got Soul King's Scarf!",
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local embedGuitar = {
        ["content"] = "",
        ["title"] = "You got Soul King's Guitar!",
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local function checkForKikoku()
        local player = game.Players.LocalPlayer
        local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)
    
        local inventoryValue = playerStats.Inventory.Inventory.Value
        if string.find(tostring(inventoryValue), "Kikoku") then
            return
        end
    
        while true do
            inventoryValue = playerStats.Inventory.Inventory.Value
            if string.find(tostring(inventoryValue), "Kikoku") then
                SendNotifyItemEMBED(getgenv().FactoryWebhookURL, embedKikoku)
                return
            end
            task.wait(1)
        end
    end
    spawn(checkForKikoku)

    local function checkForACE()
        local player = game.Players.LocalPlayer
        local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)
    
        local inventoryValue = playerStats.Inventory.Inventory.Value
        if string.find(tostring(inventoryValue), "Roger's Ace") then
            return
        end
    
        while true do
            inventoryValue = playerStats.Inventory.Inventory.Value
            if string.find(tostring(inventoryValue), "Roger's Ace") then
                SendNotifyItemEMBED(getgenv().RogerWebhookURL, embedAce)
                return
            end
            task.wait(1)
        end
    end
    spawn(checkForACE)

    local function checkForDarkBlade()
        local player = game.Players.LocalPlayer
        local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)
    
        local inventoryValue = playerStats.Inventory.Inventory.Value
        if string.find(tostring(inventoryValue), "Dark Blade") then
            return
        end
    
        while true do
            inventoryValue = playerStats.Inventory.Inventory.Value
            if string.find(tostring(inventoryValue), "Dark Blade") then
                SendNotifyItemEMBED(getgenv().MihowkWebhookURL, embedDarkBlade)
                return
            end
            task.wait(1)
        end
    end
    spawn(checkForDarkBlade)

    local function checkForScarf()
        local player = game.Players.LocalPlayer
        local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)
    
        local inventoryValue = playerStats.Inventory.Inventory.Value
        if string.find(tostring(inventoryValue), "Soul King's Scarf") then
            return
        end
    
        while true do
            inventoryValue = playerStats.Inventory.Inventory.Value
            if string.find(tostring(inventoryValue), "Soul King's Scarf") then
                SendNotifyItemEMBED(getgenv().BrookWebhookURL, embedScarf)
                return
            end
            task.wait(1)
        end
    end
    spawn(checkForScarf)

    local function checkForGuitar()
        local player = game.Players.LocalPlayer
        local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("Stats" .. player.Name)
    
        local inventoryValue = playerStats.Inventory.Inventory.Value
        if string.find(tostring(inventoryValue), "Soul King's Guitar") then
            return
        end
    
        while true do
            inventoryValue = playerStats.Inventory.Inventory.Value
            if string.find(tostring(inventoryValue), "Soul King's Guitar") then
                SendNotifyItemEMBED(getgenv().BrookWebhookURL, embedGuitar)
                return
            end
            task.wait(1)
        end
    end
    spawn(checkForGuitar)

    local function sendWebhookNotificationStored(fruitName, url, embed)
        if getgenv().WebhookURL ~= "" then
            local description = ""
            local playerStats = ReplicatedStorage:FindFirstChild("Stats" .. player.Name)
            local bannedStatus = (player:GetAttribute("banned") == true) and "✅" or "❌"    
            local http = game:GetService("HttpService")
        
            description = description .. "**Name: `" .. player.Name .. "`**\n"
            description = description .. "**Level: `" .. playerStats.Stats.Level.Value .. "`**\n"
            description = description .. "**Shadow Banned: `" .. bannedStatus .. "`**\n\n"
            description = description .. "**Fruit Name: `" .. fruitName .. "`**\n"
        
            local embed = {
                ["title"] = "You got New Fruit!",
                ["description"] = description,
                ["color"] = 16745755,
                ["image"] = {
                    ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
                },
                ["thumbnail"] = {
                    ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
                }
            }
        
            local headers = {
                ["Content-Type"] = "application/json"
            }
        
            local data = {
                ["content"] = "@everyone",
                ["embeds"] = {
                    {
                        ["title"] = embed.title,
                        ["description"] = embed.description,
                        ["color"] = embed.color,
                        ["image"] = {
                            ["url"] = embed.image.url
                        },
                        ["thumbnail"] = {
                            ["url"] = embed.thumbnail.url
                        }
                    }
                }
            }
        
            local body = http:JSONEncode(data)
            local response = request({
                Url = url,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end
    end

    local embed3 = {
        ["title"] = "You got New Fruit!",
        ["description"] = description,
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local function sendWebhookNotificationDroped(fruitItem, fruitName, url, embed)
        if getgenv().WebhookURL ~= "" then
            local description = ""
            local playerStats = ReplicatedStorage:FindFirstChild("Stats" .. player.Name)
            local bannedStatus = (player:GetAttribute("banned") == true) and "✅" or "❌"    
            local http = game:GetService("HttpService")
        
            description = description .. "**Name: `" .. player.Name .. "`**\n"
            description = description .. "**Level: `" .. playerStats.Stats.Level.Value .. "`**\n"
            description = description .. "**Shadow Banned: `" .. bannedStatus .. "`**\n\n"
            description = description .. "**Fruit Name: `" .. fruitName .. "`**\n"
        
            local embed = {
                ["title"] = "You got New Fruit!",
                ["description"] = description,
                ["color"] = 16745755,
                ["image"] = {
                    ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
                },
                ["thumbnail"] = {
                    ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
                }
            }
        
            local headers = {
                ["Content-Type"] = "application/json"
            }
        
            local data = {
                ["embeds"] = {
                    {
                        ["title"] = embed.title,
                        ["description"] = embed.description,
                        ["color"] = embed.color,
                        ["image"] = {
                            ["url"] = embed.image.url
                        },
                        ["thumbnail"] = {
                            ["url"] = embed.thumbnail.url
                        }
                    }
                }
            }
        
            local body = http:JSONEncode(data)
            local response = request({
                Url = url,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end
    end

    local embed4 = {
        ["title"] = "You got New Fruit!",
        ["description"] = description,
        ["color"] = 16745755,
        ["image"] = {
            ["url"] = "https://i.ibb.co/HD51MY5/GreedHub.png"
        },
        ["thumbnail"] = {
            ["url"] = "https://i.ibb.co/HKz8XqG/G-Hub.png"
        }
    }

    local function processFruits()
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") and item.ToolTip == "???" then
                local fruitName = item.Name
    
                local playerStats = ReplicatedStorage:FindFirstChild("Stats" .. player.Name)
                local playerPath = workspace.PlayerCharacters:WaitForChild(player.Name)
                local inventoryValue = playerStats.Inventory.Inventory.Value
                local storeFruitButton = player.PlayerGui.StoreFruit.Store.Visible

                local dropFruits = {
                    "Suke",
                    "Kilo",
                    "Spin",
                    "Heal",
                    "Bari",
                    "Bomb",
                    "Mero",
                    "Horo",
                    "Gomu",
                    "Yomi",
                    "Spring"
                }

                if table.find(dropFruits, fruitName) and string.find(tostring(inventoryValue), fruitName) then
                    print("Penis")
                    playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
                    task.wait(1)
                elseif table.find(dropFruits, fruitName) then
                    player.Character:WaitForChild("Humanoid"):EquipTool(item)
                    task.wait(0.4)
                    storeFruitButton = player.PlayerGui.StoreFruit.Store.Visible
                    while storeFruitButton do
                        firesignal(player.PlayerGui.StoreFruit.Store.MouseButton1Click)
                        storeFruitButton = player.PlayerGui.StoreFruit.Store.Visible
                        task.wait(1)
                    end
                    sendWebhookNotificationDroped(item, fruitName, getgenv().FactoryWebhookURL, embed4)
                elseif string.find(tostring(inventoryValue), fruitName) then
                    player.Character:WaitForChild("Humanoid"):EquipTool(item)
                    task.wait(1)
                    playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
                    while playerPath:FindFirstChild(item.Name) do
                        virtualInputManager:SendKeyEvent(true, Enum.KeyCode.Backspace, false, game)
                        task.wait(0.05)
                        virtualInputManager:SendKeyEvent(false, Enum.KeyCode.Backspace, false, game)
                        playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
                        task.wait(1)
                    end
                    sendWebhookNotificationDroped(item, fruitName, getgenv().FactoryWebhookURL, embed4)
                else
                    player.Character:WaitForChild("Humanoid"):EquipTool(item)
                    task.wait(0.4)
                    storeFruitButton = player.PlayerGui.StoreFruit.Store.Visible
                    while storeFruitButton do
                        firesignal(player.PlayerGui.StoreFruit.Store.MouseButton1Click)
                        storeFruitButton = player.PlayerGui.StoreFruit.Store.Visible
                        task.wait(1)
                    end
                    sendWebhookNotificationStored(fruitName, getgenv().FactoryWebhookURL, embed3)
                end
            end
            task.wait()
        end
    end

    local function getSkillEvents1(playerName, class)
        local skillEvents1 = {}
        for _, item in pairs(ReplicatedStorage:GetChildren()) do
            if item.Name:match(playerName .. "|ServerScriptService%.Skills%.Skills%.SkillContainer%.Magu%-Magu%.Magma Swamp") and item:IsA(class) then
                table.insert(skillEvents1, item)
            end
        end
        return skillEvents1
    end

    local function staminaBuy()
        while true do
            local inventoryValue = playerStats.Inventory.Inventory.Value
            local inventoryValueJSON = game:GetService("HttpService"):JSONDecode(inventoryValue)
            local Door = workspace.Islands["Rose Kingdom"].Factory.FrontDoor.Top.BillboardGui.TextLabel
            local stamina = playerStats:WaitForChild("Stamina")
            local staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            local ship = workspace.Islands:FindFirstChild("Ghost Ship")
            local soulKing = workspace.NPCs:FindFirstChild("Soul King")
            local soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
            local roger = workspace.NPCs:FindFirstChild("Roger")
            local hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
            local scientist = workspace.NPCs:FindFirstChild("Scientist")
            local DFscientist = workspace.NPCs:FindFirstChild("Devil Fruit Scientist")
            local law = workspace.NPCs:FindFirstChild("Law")

            if stamina.Value < 100 then
                while stamina.Value < stamina.MaxValue do
                    game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                    player.Character.Humanoid:EquipTool(staminaDrink)
                    local centerNahh = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory
                    virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, true, player, 1)
                    virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, false, player, 1)
                    task.wait()
                    staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
                    stamina = playerStats:WaitForChild("Stamina")
                end
            end

            if string.find(Door.ContentText, "CURRENT ALERT LEVEL") or string.find(Door.ContentText, "WAITING FOR PLAYERS...") or scientist or DFscientist or law then
                if (humanoidRootPart.Position - Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375)).Magnitude > 5 then
                    Tween(Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375))
                end
            end

            if string.find(Door.ContentText, "FACTORY CLOSED REOPENING IN") then
                local skillEvents1 = getSkillEvents1(player.Name, "RemoteFunction")
                if skillEvents1 then
                    for _, skillEvent1 in pairs(skillEvents1) do
                        skillEvent1:InvokeServer()
                    end
                end
                if (humanoidRootPart.Position - Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375)).Magnitude > 5 then
                    Tween(Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375))
                    task.wait(1)
                    processFruits()
                    if stamina.Value < 100 then
                        while stamina.Value < stamina.MaxValue do
                            game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                            player.Character.Humanoid:EquipTool(staminaDrink)
                            local centerNahh = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory
                            virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, true, player, 1)
                            virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, false, player, 1)
                            task.wait()
                            staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
                            stamina = playerStats:WaitForChild("Stamina")
                        end
                    end
                    task.wait(5)
                end
                while inventoryValueJSON["Stamina Drink"] and inventoryValueJSON["Stamina Drink"] < 20 do
                    Tween(Vector3.new(8317.33, 69.02, 10520.95))
                    for i = 20, 1, -1 do
                        game:GetService("ReplicatedStorage").Events.Shop:InvokeServer(workspace.BuyableItems:FindFirstChild("Stamina Drink"), i)
                        task.wait()
                    end
                    game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                    task.wait(0.1)
                    inventoryValue = playerStats.Inventory.Inventory.Value
                    inventoryValueJSON = game:GetService("HttpService"):JSONDecode(inventoryValue)
                end
                while not inventoryValueJSON["Stamina Drink"] do
                    Tween(Vector3.new(8317.33, 69.02, 10520.95))
                    for i = 20, 1, -1 do
                        game:GetService("ReplicatedStorage").Events.Shop:InvokeServer(workspace.BuyableItems:FindFirstChild("Stamina Drink"), i)
                    end
                    game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                    task.wait(0.1)
                    inventoryValue = playerStats.Inventory.Inventory.Value
                    inventoryValueJSON = game:GetService("HttpService"):JSONDecode(inventoryValue)
                end
                if string.find(Door.ContentText, "CURRENT ALERT LEVEL") or string.find(Door.ContentText, "WAITING FOR PLAYERS...") or scientist or DFscientist or law then
                    while string.find(Door.ContentText, "CURRENT ALERT LEVEL") or string.find(Door.ContentText, "WAITING FOR PLAYERS...") or scientist or DFscientist or law do
                        if (humanoidRootPart.Position - Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375)).Magnitude > 5 then
                            Tween(Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375))
                        end
                        if stamina.Value < 100 then
                            while stamina.Value < stamina.MaxValue do
                                game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                                player.Character.Humanoid:EquipTool(staminaDrink)
                                local centerNahh = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory
                                virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, true, player, 1)
                                virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, false, player, 1)
                                task.wait()
                                staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
                                stamina = playerStats:WaitForChild("Stamina")
                            end
                        end
                        task.wait()
                    end
                end
                if ship then
                    if (humanoidRootPart.Position - Vector3.new(5153.669921875, 42.645530700683594, -11816.28125)).Magnitude > 5 then
                        Tween(Vector3.new(5153.669921875, 42.645530700683594, -11816.28125))
                        task.wait(5)
                        soulKing = workspace.NPCs:FindFirstChild("Soul King")
                        soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
                        if soulKing or soulKingRockstar then
                            while soulKing or soulKingRockstar do
                                humanoidRootPart.CFrame = CFrame.new(Vector3.new(5153.669921875, 42.645530700683594, -11816.28125))
                                disableGravityBP()
                                humanoidRootPart.Anchored = true
                                soulKing = workspace.NPCs:FindFirstChild("Soul King")
                                soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
                                task.wait()
                            end
                        else
                            humanoidRootPart.Anchored = false
                            Tween(Vector3.new(8810.349609375, 75.77273559570312, 11456.9912109375))
                            task.wait(1)
                            processFruits()
                        end
                    end
                end
                humanoidRootPart.Anchored = false
                local skillEvents1 = getSkillEvents1(player.Name, "RemoteFunction")
                if skillEvents1 then
                    for _, skillEvent1 in pairs(skillEvents1) do
                        skillEvent1:InvokeServer()
                    end
                end
                if (humanoidRootPart.Position - Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375)).Magnitude > 5 then
                    Tween(Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375))
                    processFruits()
                    task.wait(5)
                end
                if string.find(Door.ContentText, "CURRENT ALERT LEVEL") or string.find(Door.ContentText, "WAITING FOR PLAYERS...") or scientist or DFscientist or law then
                    while string.find(Door.ContentText, "CURRENT ALERT LEVEL") or string.find(Door.ContentText, "WAITING FOR PLAYERS...") or scientist or DFscientist or law do
                        if (humanoidRootPart.Position - Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375)).Magnitude > 5 then
                            Tween(Vector3.new(8805.2724609375, 955.7744750976562, 11890.7490234375))
                        end
                        if stamina.Value < 100 then
                            while stamina.Value < stamina.MaxValue do
                                game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                                player.Character.Humanoid:EquipTool(staminaDrink)
                                local centerNahh = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory
                                virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, true, player, 1)
                                virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, false, player, 1)
                                task.wait()
                                staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
                                stamina = playerStats:WaitForChild("Stamina")
                            end
                        end
                        task.wait()
                    end
                end
                if stamina.Value < 100 then
                    while stamina.Value < stamina.MaxValue do
                        game:GetService("ReplicatedStorage").Events.Tools:InvokeServer("equip", "Stamina Drink")
                        player.Character.Humanoid:EquipTool(staminaDrink)
                        local centerNahh = game:GetService("Players").LocalPlayer.PlayerGui.BackpackGui.Backpack.Inventory
                        virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, true, player, 1)
                        virtualInputManager:SendMouseButtonEvent(centerNahh.AbsolutePosition.X + 100 + centerNahh.AbsoluteSize.X / 2, centerNahh.AbsolutePosition.Y + centerNahh.AbsoluteSize.Y + 100, 0, false, player, 1)
                        task.wait()
                        staminaDrink = player.Backpack:FindFirstChild("Stamina Drink")
                        stamina = playerStats:WaitForChild("Stamina")
                    end
                end
                Tween(Vector3.new(12786.458984375, 20.85, 2761.849609375))
                task.wait(5)
                humanoidRootPart.Anchored = false
                enableGravityBP()
                humanoidRootPart.CFrame = CFrame.new(Vector3.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 300, humanoidRootPart.Position.Z))
                task.wait(3)
                roger = workspace.NPCs:FindFirstChild("Roger")
                hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
                if roger or hawkEye then
                    while roger or hawkEye do
                        humanoidRootPart.CFrame = CFrame.new(Vector3.new(humanoidRootPart.Position.X, 20.85, humanoidRootPart.Position.Z))
                        disableGravityBP()
                        task.wait(1.5)
                        humanoidRootPart.Anchored = true
                        roger = workspace.NPCs:FindFirstChild("Roger")
                        hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
                        task.wait()
                    end
                else
                    humanoidRootPart.Anchored = false
                    Tween(Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375))
                    processFruits()
                    task.wait(5)
                end
                humanoidRootPart.Anchored = false
                if (humanoidRootPart.Position - Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375)).Magnitude > 5 then
                    Tween(Vector3.new(8810.349609375, 65.77273559570312, 11456.9912109375))
                    processFruits()
                    task.wait(5)
                end
            end
            task.wait()
        end
    end
    spawn(staminaBuy)

    local function block()
        while true do
            local soulKing = workspace.NPCs:FindFirstChild("Soul King")
            local soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
            local roger = workspace.NPCs:FindFirstChild("Roger")
            local hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")

            if soulKing or soulKingRockstar or roger or hawkEye then
                game:GetService("ReplicatedStorage").Events.Block:InvokeServer(true, "Melee", true)
            else
                game:GetService("ReplicatedStorage").Events.Block:InvokeServer(false, "Melee")
            end
        task.wait()
        end
    end
    spawn(block)

    local function MagmaEruption()
        while true do
            local Door = workspace.Islands["Rose Kingdom"].Factory.FrontDoor.Top.BillboardGui.TextLabel
            local soulKing = workspace.NPCs:FindFirstChild("Soul King")
            local soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
            local roger = workspace.NPCs:FindFirstChild("Roger")
            local hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
            local playerCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame        

            if string.find(Door.ContentText, "CURRENT ALERT LEVEL") or soulKing or soulKingRockstar or roger or hawkEye then
                local args = {
                    [1] = "Magma Eruption",
                    [2] = {
                        ["cf"] = playerCFrame
                    }
                }           
                ReplicatedStorage:WaitForChild("Events"):WaitForChild("Skill"):InvokeServer(unpack(args))
            end

            task.wait()
        end
    end
    spawn(MagmaEruption)

    local function MagmaSwamp()
        while true do
            local stamina = playerStats:WaitForChild("Stamina")
            local Door = workspace.Islands["Rose Kingdom"].Factory.FrontDoor.Top.BillboardGui.TextLabel
            local soulKing = workspace.NPCs:FindFirstChild("Soul King")
            local soulKingRockstar = workspace.NPCs:FindFirstChild("Soul King (Rockstar)")
            local roger = workspace.NPCs:FindFirstChild("Roger")
            local hawkEye = workspace.NPCs:FindFirstChild("Hawk Eye")
            local playerPath = workspace.PlayerCharacters:WaitForChild(player.Name)

            if playerPath then
                if not playerPath:GetAttribute("SpeedBypass") then
                    playerPath:SetAttribute("SpeedBypass", 0)
                end
            end
            
            while playerPath and 2500 > playerPath:GetAttribute("SpeedBypass") do
                playerPath = workspace.PlayerCharacters:FindFirstChild(player.Name)
                task.wait()
            end

            stamina = playerStats:WaitForChild("Stamina")
            if stamina.Value == 0 then
                while stamina.Value < stamina.MaxValue do
                    task.wait()
                    stamina = playerStats:WaitForChild("Stamina")
                end
            end


            if string.find(Door.ContentText, "CURRENT ALERT LEVEL") or soulKing or soulKingRockstar or roger or hawkEye then
                ReplicatedStorage.Events.Skill:InvokeServer("Magma Swamp")
            end

            task.wait()
        end
    end
    spawn(MagmaSwamp)
end

local function findClosestRobo()
    repeat wait() until workspace.NPCs:FindFirstChild("Robo")
    local closestRobo = nil
    local shortestDistance = math.huge
    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    
    for _, npc in pairs(workspace.NPCs:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
            if npc.Name == "Robo" then
                local npcPosition = npc.HumanoidRootPart.Position
                local distance = (npcPosition - playerPosition).magnitude
                if distance < shortestDistance then
                    closestRobo = npc
                    shortestDistance = distance
                end
            end
        end
    end
    
    return closestRobo
end

local function setSpawn()
    repeat wait() until workspace.NPCs:FindFirstChild("Robo")
    local closestRobo = findClosestRobo()
    local NPCCHAT = game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT")

    while not NPCCHAT do
        fireproximityprompt(closestRobo.UpperTorso:WaitForChild("Prompt"))
        task.wait(5)
        NPCCHAT = game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT")
    end

    while NPCCHAT do
        local frame = NPCCHAT:FindFirstChild("Frame")
        if frame then
            local goButton = frame:FindFirstChild("go")
            local endChatButton = frame:FindFirstChild("endChat")

            if goButton then
                firesignal(goButton.MouseButton1Click)
            end
            task.wait(1)

            if endChatButton then
                firesignal(endChatButton.MouseButton1Click)
            end
            task.wait(1)
        end

        NPCCHAT = game.Players.LocalPlayer.PlayerGui:FindFirstChild("NPCCHAT")
        task.wait(1)
    end
end

local function AutoFastMode()
    local decalsyeeted = true
    local g = game
    local w = g.Workspace
    local l = g.Lighting
    local t = w.Terrain
    t.WaterWaveSize = 0
    t.WaterWaveSpeed = 0
    t.WaterReflectance = 0
    t.WaterTransparency = 0
    l.GlobalShadows = false
    l.FogEnd = 9e9
    l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for i,v in pairs(g:GetDescendants()) do
        if v:IsA("Part") or v:IsA("Union") or v:IsA("MeshPart") then
            v.Material = "Plastic"
    v.Reflectance = 0
    elseif v:IsA("Decal") and decalsyeeted then 
    v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then 
    v.Lifetime = NumberRange.new(0)
        end
    end
end

local function halalHubImage()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "LoadingScreen"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.IgnoreGuiInset = true

    local loadingFrame = Instance.new("Frame")
    loadingFrame.Size = UDim2.new(1, 0, 1, 0)
    loadingFrame.Position = UDim2.new(0, 0, 0, 0)
    loadingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    loadingFrame.Parent = screenGui

    local loadingText = Instance.new("TextLabel")
    loadingText.Size = UDim2.new(1, 0, 0.1, 0)
    loadingText.Position = UDim2.new(0, 0, 0.45, 0)
    loadingText.BackgroundTransparency = 1
    loadingText.TextColor3 = Color3.new(255, 133, 27)
    loadingText.Text = "GreedHub"
    loadingText.Font = Enum.Font.SourceSans
    loadingText.TextSize = 300
    loadingText.Parent = loadingFrame
    loadingText.TextStrokeTransparency = 0

    return screenGui, loadingFrame
end

local screenGui, loadingFrame


if getgenv().AutoFastMode then
    AutoFastMode()
    task.wait(7.5)
end

if getgenv().Disable3DRender then
    game:GetService("RunService"):Set3dRenderingEnabled(false)
    screenGui, loadingFrame = halalHubImage()
end

if game.PlaceId == 7465136166 then
    Tween(Vector3.new(8496.3203125, 69.02272033691406, 10553.42578125))
    repeat wait() until workspace.NPCs:FindFirstChild("Robo")
    setSpawn()
    Farm()
end
