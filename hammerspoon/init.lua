hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.application.enableSpotlightForNameSearches(true)

hs.loadSpoon("WindowHalfsAndThirds")

spoon.WindowHalfsAndThirds:bindHotkeys(spoon.WindowHalfsAndThirds.defaultHotkeys)

-- keybind shortcuts
local mash = {"cmd", "alt", "ctrl"}
local mash_apps = {"cmd", "alt"}
local mash_window = {"cmd", "shift"}
local hyper = {"cmd", "shift", "alt", "ctrl"}

-- work screen config
local lgUltrawideWork = "LG ULTRAWIDE"
local laptopScreen = "Color LCD"

-- home office screen config
local dell = "DELL U2720Q"
local acer = "Acer VG240YU"

local left_two_thirds = {x = 0, y = 0, w = 0.6, h = 1}
local right_one_third = {x = 0.6, y = 0, w = 0.4, h = 1}
local large_sized_window = {x = 0.02, y = 0.02, w = 0.96, h = 0.96}
local smaller_sized_window = {x = 0.1, y = 0.02, w = 0.8, h = 0.96}

local layout_code_work = {
    {
        "Alacritty", nil, lgUltrawideWork, {x = 0.6, y = 0, w = 0.4, h = 1},
        nil, nil
    }, {
        "Google Chrome", nil, lgUltrawideWork, {x = 0, y = 0, w = 0.6, h = 1},
        nil, nil
    }, {
        "Microsoft Outlook", "Posteingang • jakob@soerensen.com",
        laptopScreen, hs.layout.maximized, nil, nil
    }
}

local layout_code_home = {
    {
        "Alacritty", nil, acer, {x = 0.6, y = 0, w = 0.4, h = 1},
        nil, nil
    }
}
hs.hotkey.bind(mash_window, "1", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(large_sized_window)
end)

hs.hotkey.bind(mash_window, "2", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(smaller_sized_window)
end)

hs.hotkey.bind(mash_apps, "1", function() hs.layout.apply(layout_code_work) end)
hs.hotkey.bind(mash_apps, "2", function() hs.layout.apply(layout_code_home) end)

hs.hotkey.bind(hyper, "Right", function() 
    local win = hs.window.focusedWindow()
    win:moveToScreen(dell)
    win:moveToUnit(large_sized_window)
end)
hs.hotkey.bind(hyper, "Left", function() 
    local win = hs.window.focusedWindow()
    win:moveToScreen(acer)
    win:moveToUnit(large_sized_window)
end)

hs.hotkey.bind(mash, "1", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(left_two_thirds)
end)

hs.hotkey.bind(mash, "2", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit(right_one_third)
end)

hs.hotkey.bind(mash, "W", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local app = win:application()
    print(app:title() .. " " .. win:title())
    -- win:maximize()

end)

