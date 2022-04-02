function Popup(str, time)
    hs.alert.closeAll()
    hs.alert(str, time)
end

hyper = {
    prim = {"cmd", "alt", "ctrl"},
    shift = {"cmd", "alt", "ctrl", "shift"}
}

function h_bind(key, pressedfn, releasedfn)
    hs.hotkey.bind(hyper.prim, key, pressedfn, releasedfn)
end

function hs_bind(key, pressedfn, releasedfn)
    hs.hotkey.bind(hyper.shift, key, pressedfn, releasedfn)
end

local GridColumn = 8
local GridRaw = 4
hs.grid.setGrid(hs.geometry(nil, nil, GridColumn, GridRaw))
hs.grid.setMargins("6 * 6")

-- Hyper + E 定义窗口布局(Moom Style)
WindowLayout = {
    LeftHalf = {0 ,0, 0.5 * GridColumn, GridRaw},
    RightHalf = {0.5 * GridColumn, 0, 0.5 * GridColumn, GridRaw},
    Full = {0, 0, GridColumn, GridRaw}
}

SetWindowLayout = hs.hotkey.modal.new(hyper.prim, "E")

function SetWindowLayout:entered()
    Popup([[

Set Window Layout

1: Full Screen
2: Left Half Screen
3: Right Half Screen
    
]], 3)
end

function SetWindowLayout:exited()
    Popup("Exited Mode", 0.5)
end

SetWindowLayout:bind({}, "escape", function()
    SetWindowLayout:exit()
end)

SetWindowLayout:bind({}, "1", function()
    hs.grid.set(hs.window.focusedWindow(), WindowLayout.Full)
    SetWindowLayout:exit()
end)
SetWindowLayout:bind({}, "2", function()
    hs.grid.set(hs.window.focusedWindow(), WindowLayout.LeftHalf)
    SetWindowLayout:exit()
end)
SetWindowLayout:bind({}, "3", function()
    hs.grid.set(hs.window.focusedWindow(), WindowLayout.RightHalf)
    SetWindowLayout:exit()
end)


-- Hyper + HJKL 用于调整窗口位置
h_bind("H", function()
    hs.grid.pushWindowLeft()
end)
h_bind("J", function()
    hs.grid.pushWindowDown()
end)
h_bind("K", function()
    hs.grid.pushWindowUp()
end)
h_bind("L", function()
    hs.grid.pushWindowRight()
end)

-- Hyper_shift + HJKL 用于调整窗口大小
hs_bind("H", function()
    hs.grid.resizeWindowThinner()
end)
hs_bind("J", function()
    hs.grid.resizeWindowTaller()
end)
hs_bind("K", function()
    hs.grid.resizeWindowShorter()
end)
hs_bind("L", function()
    hs.grid.resizeWindowWider()
end)