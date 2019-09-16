hs.window.animationDuration = 0
hs.window.setShadows(false)
hs.application.enableSpotlightForNameSearches(true)

hs.loadSpoon("WindowHalfsAndThirds")

spoon.WindowHalfsAndThirds:bindHotkeys(spoon.WindowHalfsAndThirds.defaultHotkeys)

-- keybind shortcuts
local mash = {"cmd", "alt", "ctrl"}
local mash_apps = {"cmd", "alt"}

local lgUltrawideWork = "LG ULTRAWIDE"
local laptopScreen = "Color LCD"

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

hs.hotkey.bind(mash_apps, "1", function() hs.layout.apply(layout_code_work) end)

hs.hotkey.bind(mash, "1", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x = 0, y = 0, w = 0.6, h = 1})
end)

hs.hotkey.bind(mash, "2", function()
    local win = hs.window.focusedWindow()
    win:moveToUnit({x = 0.6, y = 0, w = 0.4, h = 1})
end)

hs.hotkey.bind(mash, "W", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local app = win:application()
    print(app:title() .. " " .. win:title())
    -- win:maximize()

end)

