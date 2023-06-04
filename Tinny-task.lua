local gui = Instance.new("ScreenGui")

gui.Name = "RecordPlaybackGUI"

gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")

frame.Name = "RecordPlaybackFrame"

frame.Size = UDim2.new(0, 200, 0, 50)

frame.Position = UDim2.new(0.5, -100, 0.5, -25)

frame.BackgroundColor3 = Color3.new(0, 0, 0)

frame.Active = true

frame.Draggable = true

frame.Parent = gui

local layout = Instance.new("UIListLayout")

layout.FillDirection = Enum.FillDirection.Horizontal

layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

layout.VerticalAlignment = Enum.VerticalAlignment.Center

layout.Padding = UDim.new(0, 10)

layout:ApplyLayout()

layout.Parent = frame

local recordButton = Instance.new("TextButton")

recordButton.Text = "▶️"

recordButton.Size = UDim2.new(0, 50, 0, 50)

recordButton.BackgroundColor3 = Color3.new(255, 0, 0)

recordButton.Parent = frame

local stopButton = Instance.new("TextButton")

stopButton.Text = "⏸️"

stopButton.Size = UDim2.new(0, 50, 0, 50)

stopButton.BackgroundColor3 = Color3.new(255, 255, 0)

stopButton.Parent = frame

local playButton = Instance.new("TextButton")

playButton.Text = "⏯️"

playButton.Size = UDim2.new(0, 50, 0, 50)

playButton.BackgroundColor3 = Color3.new(0, 255, 0)

playButton.Parent = frame

local clearButton = Instance.new("TextButton")

clearButton.Text = "🧹"

clearButton.Size = UDim2.new(0, 50, 0, 50)

clearButton.BackgroundColor3 = Color3.new(0, 255, 255)

clearButton.Parent = frame

local movements = {}

local isRecording = false

local isPlaying = false

local function recordMovements()

    movements = {}

    while isRecording do

        table.insert(movements, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)

        wait(0.1)

    end

end

local function playMovements()

    isPlaying = true

    local startTime = tick()

    local currentIndex = 1

    while isPlaying and currentIndex <= #movements do

        local elapsedTime = tick() - startTime

        if elapsedTime >= currentIndex * 0.2 then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = movements[currentIndex]

            currentIndex = currentIndex + 1

        end

        game:GetService("RunService").Heartbeat:Wait()

    end

    isPlaying = false

end

recordButton.MouseButton1Click:Connect(function()

    if isRecording then

        isRecording = false

    else

        isRecording = true

        coroutine.wrap(recordMovements)()

    end

end)

stopButton.MouseButton1Click:Connect(function()

    isRecording = false

    isPlaying = false

end)

playButton.MouseButton1Click:Connect(function()

    if not isPlaying then

        isPlaying = true

        coroutine.wrap(playMovements)()

    end

end)

clearButton.MouseButton1Click:Connect(function()

    movements = {}

end)

local gui2 = Instance.new("ScreenGui")

gui2.Parent = game:GetService("CoreGui")

local frame2 = Instance.new("Frame")

frame2.Size = UDim2.new(0, 200, 0, 50)

frame2.Position = UDim2.new(0.5, -100, 0.7, -25)

frame2.BackgroundColor3 = Color3.new(0, 0, 0)

frame2.Parent = gui2

local text2 = Instance.new("TextLabel")

text2.Text = "TINNY TASK: CREATOR SUPER VDC"

text2.Size = UDim2.new(1, 0, 1, 0)

text2.BackgroundColor3 = Color3.new(0, 0, 0)

text2.TextColor3 = Color3.new(1, 0, 0)

text2.TextScaled = true

text2.Parent = frame2

wait(7)

gui2:Destroy()
