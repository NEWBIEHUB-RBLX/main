-- File: StarterGui/NaturalSceneGui.lua

-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NaturalSceneGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the Background Frame
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Name = "BackgroundFrame"
backgroundFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
backgroundFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
backgroundFrame.BackgroundColor3 = Color3.new(0.5, 0.8, 1) -- Light blue sky color
backgroundFrame.BorderSizePixel = 0
backgroundFrame.Visible = false
backgroundFrame.Parent = screenGui

local backgroundCorner = Instance.new("UICorner")
backgroundCorner.CornerRadius = UDim.new(0.05, 0)
backgroundCorner.Parent = backgroundFrame

-- Create Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0.1, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Horror RNG"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = backgroundFrame

-- Create the Yellow Circle
local yellowCircle = Instance.new("Frame")
yellowCircle.Name = "YellowCircle"
yellowCircle.Size = UDim2.new(0.2, 0, 0.2, 0)
yellowCircle.Position = UDim2.new(0.4, 0, 0.4, 0)
yellowCircle.BackgroundColor3 = Color3.new(1, 1, 0) -- Yellow color
yellowCircle.Parent = backgroundFrame

local circleCorner = Instance.new("UICorner")
circleCorner.CornerRadius = UDim.new(0.5, 0)
circleCorner.Parent = yellowCircle

-- Create Toggle Button for Super Luck Potion
local toggleButtonPotion = Instance.new("TextButton")
toggleButtonPotion.Name = "ToggleButtonPotion"
toggleButtonPotion.Size = UDim2.new(0.6, 0, 0.1, 0)
toggleButtonPotion.Position = UDim2.new(0.2, 0, 0.15, 0)
toggleButtonPotion.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButtonPotion.TextColor3 = Color3.new(1, 1, 1)
toggleButtonPotion.Text = "Toggle Potion"
toggleButtonPotion.Parent = backgroundFrame

local potionButtonCorner = Instance.new("UICorner")
potionButtonCorner.CornerRadius = UDim.new(0.05, 0)
potionButtonCorner.Parent = toggleButtonPotion

-- Toggle Script for Super Luck Potion
local runningPotion = false
local toggleConnectionPotion

local function togglePotion()
    if runningPotion then
        runningPotion = false
        toggleButtonPotion.Text = "Toggle Potion"
        if toggleConnectionPotion then
            toggleConnectionPotion:Disconnect()
        end
    else
        runningPotion = true
        toggleButtonPotion.Text = "Stop Potion"
        toggleConnectionPotion = game:GetService("RunService").Heartbeat:Connect(function()
            game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer("Equip", "Super Luck Potion", "Usable")
        end)
    end
end

toggleButtonPotion.MouseButton1Click:Connect(togglePotion)

-- Create Toggle Button for RollWish
local toggleButtonWish = Instance.new("TextButton")
toggleButtonWish.Name = "ToggleButtonWish"
toggleButtonWish.Size = UDim2.new(0.6, 0, 0.1, 0)
toggleButtonWish.Position = UDim2.new(0.2, 0, 0.27, 0) -- Positioned below the first button
toggleButtonWish.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButtonWish.TextColor3 = Color3.new(1, 1, 1)
toggleButtonWish.Text = "Toggle Wish"
toggleButtonWish.Parent = backgroundFrame

local wishButtonCorner = Instance.new("UICorner")
wishButtonCorner.CornerRadius = UDim.new(0.05, 0)
wishButtonCorner.Parent = toggleButtonWish

-- Toggle Script for RollWish
local runningWish = false
local toggleConnectionWish

local function toggleWish()
    if runningWish then
        runningWish = false
        toggleButtonWish.Text = "Toggle Wish"
        if toggleConnectionWish then
            toggleConnectionWish:Disconnect()
        end
    else
        runningWish = true
        toggleButtonWish.Text = "Stop Wish"
        toggleConnectionWish = game:GetService("RunService").Heartbeat:Connect(function()
            game:GetService("ReplicatedStorage").Events.RollWish:FireServer()
        end)
    end
end

toggleButtonWish.MouseButton1Click:Connect(toggleWish)

-- Create Toggle Button for Wish x2
local toggleButtonWishX2 = Instance.new("TextButton")
toggleButtonWishX2.Name = "ToggleButtonWishX2"
toggleButtonWishX2.Size = UDim2.new(0.6, 0, 0.1, 0)
toggleButtonWishX2.Position = UDim2.new(0.2, 0, 0.39, 0) -- Positioned below the second button
toggleButtonWishX2.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
toggleButtonWishX2.TextColor3 = Color3.new(1, 1, 1)
toggleButtonWishX2.Text = "Toggle Wish x2"
toggleButtonWishX2.Parent = backgroundFrame

local wishX2ButtonCorner = Instance.new("UICorner")
wishX2ButtonCorner.CornerRadius = UDim.new(0.05, 0)
wishX2ButtonCorner.Parent = toggleButtonWishX2

-- Toggle Script for Wish x2
local runningWishX2 = false
local toggleConnectionWishX2

local function toggleWishX2()
    if runningWishX2 then
        runningWishX2 = false
        toggleButtonWishX2.Text = "Toggle Wish x2"
        if toggleConnectionWishX2 then
            toggleConnectionWishX2:Disconnect()
        end
    else
        runningWishX2 = true
        toggleButtonWishX2.Text = "Stop Wish x2"
        toggleConnectionWishX2 = game:GetService("RunService").Heartbeat:Connect(function()
            local args = {
                [1] = "Equip",
                [2] = "Wish x2",
                [3] = "Usable"
            }
            game:GetService("ReplicatedStorage").Events.InventoryEvent:FireServer(unpack(args))
        end)
    end
end

toggleButtonWishX2.MouseButton1Click:Connect(toggleWishX2)

-- Create "SHOW GUI" Button
local showGuiButton = Instance.new("TextButton")
showGuiButton.Name = "ShowGuiButton"
showGuiButton.Size = UDim2.new(0.1, 0, 0.05, 0)
showGuiButton.Position = UDim2.new(0.45, 0, 0.9, 0)
showGuiButton.BackgroundColor3 = Color3.new(0, 1, 0)
showGuiButton.TextColor3 = Color3.new(1, 1, 1)
showGuiButton.Text = "SHOW GUI"
showGuiButton.Parent = screenGui

local showGuiButtonCorner = Instance.new("UICorner")
showGuiButtonCorner.CornerRadius = UDim.new(0.5, 0) -- Full rounded corners for circle effect
showGuiButtonCorner.Parent = showGuiButton

local function showGui()
    backgroundFrame.Visible = true
end

showGuiButton.MouseButton1Click:Connect(showGui)

-- Create "X" Button to hide the GUI
local hideGuiButton = Instance.new("TextButton")
hideGuiButton.Name = "HideGuiButton"
hideGuiButton.Size = UDim2.new(0.05, 0, 0.05, 0)
hideGuiButton.Position = UDim2.new(0, 0, 0, 0)
hideGuiButton.BackgroundColor3 = Color3.new(1, 0, 0)
hideGuiButton.TextColor3 = Color3.new(1, 1, 1)
hideGuiButton.Text = "X"
hideGuiButton.Parent = backgroundFrame

local hideGuiButtonCorner = Instance.new("UICorner")
hideGuiButtonCorner.CornerRadius = UDim.new(0.5, 0) -- Full rounded corners for circle effect
hideGuiButtonCorner.Parent = hideGuiButton

local function hideGui()
    backgroundFrame.Visible = false
end

hideGuiButton.MouseButton1Click:Connect(hideGui)
