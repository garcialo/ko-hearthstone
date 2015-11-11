SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; settings file contains variables for fullscreen/height/width
; height and width reflect play area resolution, not play area size
; height/width only useful if in windowed mode
settingsFile = %LocalAppData%\Blizzard\Hearthstone\options.txt

; checking if fullscreen or not
try
	FileReadLine, userFullscreen, %settingsFile%, 3
catch e
{
	MsgBox % "Error - " e.Line
	ExitApp
}
if not ErrorLevel
{
	; get enough characters to check whether is 'graphicsfullscreen=True'
	StringRight, userIsFullscreen, userFullscreen, 4
	fullscreen := userIsFullscreen = "True"
}

; getting play area size from settings file
try
	FileReadLine, userHeight, %settingsFile%, 4
catch e
{
	MsgBox % "Error - " e.Line
	ExitApp
}

try
	FileReadLine, userWidth, %settingsFile%, 6
catch e
{
	MsgBox % "Error - " e.Line
	ExitApp
}



#SingleInstance Force
if 0 ; screen coordinates
  coord=screen
else
  coord=relative
sleep, 1000
CoordMode, ToolTip, %coord%
CoordMode, Pixel, %coord%
CoordMode, Mouse, %coord%
CoordMode, Caret, %coord%
CoordMode, Menu, %coord%
TrayTip, Mouse Location, Ctrl+Alt+S: Start Application`nF7: Reload Application`nF8: Exit Application`nMode: %coord%, 20, 1 ; Alerts user of hotkeys that they can use.
return

Refresh:

; get width/height of Hearthstone Window
WinGetPos,,, width, height, Hearthstone

playHeight := 0
playWidth := 0

; zeroX is half screen width ; if bordered, the border sizes cancel out
zeroX := width / 2

if (fullscreen)
{
	; playHeight/Width equal to screen height/width
	playHeight := height
	playWidth := width
	
	; center is middle of the screen size
	zeroY := height / 2
}
else
{
	; Getting border/titlebar sizes from the system settings
	SysGet, leftRightBorderSize, 32
	SysGet, topBottomBorderSize, 33
	SysGet, titleBarSize, 4

	playHeight := SubStr(userHeight, 16)
	playWidth := SubStr(userWidth, 15)

	; zeroY is half window height; and lowered to account for size of title bar
	zeroY := titleBarSize + topBottomBorderSize + (playHeight / 2)
}

; any window area beyond minWidth is just padding
; the usable horizontal space is determined relative to the playscreen height
minWidth := Ceil(playHeight * 1.332)

; the maximum X distance from the center a position can be is half the minWidth
; rounding down because rounding up seemed to be (slightly) less accurate in practice
maxX := Floor(minWidth / 2)

; the maximum Y distance from the center a position can be is half the play area height
; rounding down because of the reasons rounding down for maxX
maxY := Floor(playHeight / 2)

MouseGetPos, x, y
xOff := (x - zeroX) / maxX
yOff := -1 * (y - zeroY) / maxY

leftX := floor(zeroX - maxX / 2)
rightX := floor(zeroX + maxX / 2)
topY := floor(zeroY - maxY / 2)
botY := floor(zeroY + maxY / 2)

PixelGetColor, topLeft, %leftX%, %topY%,, Slow
PixelGetColor, topRight, %rightX%, %topY%,, Slow
PixelGetColor, botLeft, %leftX%, %botY%,, Slow
PixelGetColor, botRight, %rightX%, %botY%,, Slow

PixelGetColor, cBGR, %x%, %y%,, Slow
ToolTip,FullScreen %fullscreen%`nLocation: %x% x %y%`nBGR: %cBGR%`nTopLeft (%leftX% x %topY%): %topLeft%`nTopRight (%rightX% x %topY%): %topRight%`nBotLeft (%leftX% x %botY%): %botLeft%`nBotRight (%rightX% x %botY%): %botRight%`nxOff: %xOff%`nyOff: %yOff%`nCenter: %zeroX% x %zeroY%`nWindow Size: %width% x %height%`nTitle Size: %titleBarSize%px`nTB Border: %topBottomBorderSize%px`nLR Border: %leftRightBorderSize%px`nplaySize: %playWidth% x %playHeight%`n0 Loc: %zeroX% x %zeroY%`nmaxSize: %maxX% x %maxY%
Return

^!s:: ; Ctrl + Alt + S
SetTimer, Refresh, 1000 ; Waits 75 ms before refreshing.
return
F7::Reload ; Reloads Application
F8::ExitApp ; Terminates Application