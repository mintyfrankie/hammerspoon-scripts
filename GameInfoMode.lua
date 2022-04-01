function game_info_mode() -- 游戏辅助台模式
    local Screens = hs.screen.allScreens()
    local Audio = hs.audiodevice.allOutputDevices()

    if Screens[2] == nil then -- 只有一个屏幕
        Screens[1]:mirrorStop()
        Audio[1]:setDefaultOutputDevice()

    elseif Screens[2]:name() == "Built-in Retina Display" then -- 双屏幕
        Screens[1]:mirrorOf(Screens[2])
        Audio[2]:setDefaultOutputDevice()
    end
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "P", game_info_mode)
