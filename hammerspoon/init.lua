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

hs.hotkey.bind(mash,"1", function()
	local win = hs.window.focusedWindow()
	win:moveToUnit({x=0,y=0, w=0.6, h=1})
end)

hs.hotkey.bind(mash,"2", function()
	local win = hs.window.focusedWindow()
	win:moveToUnit({x=0.6,y=0, w=0.4, h=1})
end)

hs.hotkey.bind(mash,"W", function()
	local win = hs.window.focusedWindow()
  	local f = win:frame()
	local app = win:application()
	print(app:title() .. " " .. win:title())	
	
end)

