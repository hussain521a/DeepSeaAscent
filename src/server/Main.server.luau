print("Deep Sea Ascent: Live sync test successful!")

game:GetService("Players").PlayerAdded:Connect(function(player)
    print(player.Name .. " joined the game.")
end)