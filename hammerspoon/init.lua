hs.window.animationDuration = 0
hs.window.setShadows(false)

hs.loadSpoon("WindowHalfsAndThirds")

spoon.WindowHalfsAndThirds:bindHotkeys(spoon.WindowHalfsAndThirds.defaultHotkeys)

-- keybind shortcuts
local mash      = {"cmd", "alt", "ctrl"}
local mash_apps = {"cmd", "alt"}

local layout_code = {
	{
	  name = {"Terminal"},
	  func = function(index, win)
		
	  end
	},
	{
	  name = {'Code'},
	  func = function(index, win)
		 pushWindow(win,0,0,(1/3*2),1)
	  end
	},
	{
	  name = {'Google Chrome'},
	  func = function(index, win)
		 pushWindow(win,0,0,(1/3*2),1)
	  end
	}
  }


hs.hotkey.bind(mash,"W", function()
	local win = hs.window.focusedWindow()
  	local f = win:frame()
	
	
end)

hs.hotkey.bind(mash_apps, "L", function()
	local screen = "LG Ultrawide"
end)