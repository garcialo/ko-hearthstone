; WinHide ahk_class Shell_TrayWnd
IfWinNotExist Hearthstone
{
	launchGame()
}

; VARIABLES
; VARIABLES
; VARIABLES

WinGetPos,,, width, height, Hearthstone

; all the mouse positions will be described in relation to the center of the game window
zeroX := width / 2
zeroY := height / 2

; Adjusting if in windowed mode
SysGet, leftRightBorderSize, 32
SysGet, topBottomBorderSize, 33
SysGet, titleBarSize, 4

; adjusted height/width reflect the play area without window borders
adjWidth := width - leftRightBorderSize * 2
adjHeight := height - titleBarSize - topBottomBorderSize * 2

fullscreen := false
if (height = adjHeight) && (width = adjWidth)
{
	fullscreen := true
}

; if windowed, adjust zeroY so it's consistent between windowed/fullscreen
if (not fullscreen)
{
	zeroY := zeroY - (titleBarSize / 2)
}

; the usable horizontal space is determined relative to the playscreen height
; any window area beyond minWidth is just padding for all non-"footer" screen elements
; maxFromCenter is the maximum distance that should be considered from the minimum width
minWidth := Ceil(adjHeight * 1.332)

; Setting up Screens and Screen Mouse Positions
currScreen := 0
currScreenPosition := 0

; Import Screen Positions
#Include ko-hearthstone-screens.ahk

; Initialize user environment
WinWait Hearthstone
WinActivate Hearthstone

currScreen := 0
currScreenPosition := 0

; wait for Hearthstone to fully load
sleep 5000

MoveMouse()

; The overlay is now in place. The script should run until closed by the user.

; HOTKEYS
; HOTKEYS
; HOTKEYS

q::
closeGame()
return

Tab::
currScreenPosition +=1
if (currScreenPosition >= screenSizes%currScreen%)
{
	currScreenPosition := 0
}
MoveMouse()
return

+Tab::
currScreenPosition -=1
if (currScreenPosition < 0)
{
	currScreenPosition := screenSizes%currScreen% - 1
}
MoveMouse()
return

Space::
Enter::
Send {Click}
sleep 50
if (target%currScreen%_%currScreenPosition% > -1)
{
	currScreen := target%currScreen%_%currScreenPosition%
	currScreenPosition := 0
	MoveMouse()
}
return

+Space::
+Enter::
Send {Click, right}
sleep 50
return

; wondering if I should put in some mouse-nudge buttons in here
; {Up}::
;  return

; {Down}::
; return

; {Left}::
; return

; {Right}::
; return

; FUNCTIONS
; FUNCTIONS
; FUNCTIONS

launchGame()
{
; this function should result in the following state
; Battle.net Window Open
; Hearthstone selected from list of game
; Mouse cursor on the PLAY button

; Launch Battle.net and Select Hearthstone
	; Apparently, you can't launch Hearthstone directly from the exe
	; Run C:\Program Files (x86)\Hearthstone\Hearthstone.exe
	; Run C:\Program Files (x86)\Hearthstone\Hearthstone Beta Launcher.exe
	
	; It also doesn't work if you run it with the command line options used by the Battle.net launcher
	; Run C:\Program Files (x86)\Hearthstone\Hearthstone.exe -launch -uid hs_beta
	
	; Calling the shortcut in the Start Menu works. Hopefully you created one. =p
	Run C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Hearthstone\Hearthstone
	WinWait Battle.net
	WinActivate Battle.net
	
; Put mouse cursor on PLAY
	WinGetPos,,,,battleHeight,Battle.net
	xBattlePlay = 287
	yBattlePlay := battleHeight - 70

	MouseMove, xBattlePlay, yBattlePlay
	Send {Click}
	
	WinWait Hearthstone
}

closeGame()
{
	WinKill Hearthstone
	WinKill Battle.net
	; WinShow ahk_class Shell_TrayWnd
	ExitApp
}

addScreenPosition(x,y,targetScreen)
{
	global
	screenX%currScreen%_%currScreenPosition% := x
	screenY%currScreen%_%currScreenPosition% := y

	target%currScreen%_%currScreenPosition% := targetScreen
	currScreenPosition += 1
}

addFooter()
{
	global
	local foff := -.47 * adjWidth / minWidth
	local goff := .40 * adjWidth / minWidth
	local moff := .48 * adjWidth / minWidth
	
	addScreenPosition(foff,-.5,??) ; FRIENDS
	addScreenPosition(goff,-.5,-1) ; GOLD
	addScreenPosition(moff,-.5,??) ; GAME MENU
}

completeScreen()
{
	global
	screenSizes%currScreen% := currScreenPosition
	currScreen += 1
	currScreenPosition := 0
}

MoveMouse()
{
	global
	; local x := zeroX+adjWidth*screenX%currScreen%_%currScreenPosition%
	local x := zeroX+minWidth*screenX%currScreen%_%currScreenPosition%
	local y := zeroY-adjHeight*screenY%currScreen%_%currScreenPosition%

	MouseMove, x, y
}