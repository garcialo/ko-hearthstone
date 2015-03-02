IfWinNotExist Hearthstone
{
	launchGame()
}

; VARIABLES
; VARIABLES
; VARIABLES

WinGetPos,,, width, height, Hearthstone

midX := width / 2
midY := height / 2

; Setting up Screens and Screen Mouse Positions
currScreen := 0
currScreenPosition := 0

; LEGEND OF SCREENS
; 0 - TODAY'S QUESTS
; 1 - MAIN MENU
; 2 - PLAY SCREEN

; 0 - Today's Quests
addScreenPosition(0,0,1)
completeScreen()

; Main Menu
addScreenPosition(0,.17,2)
completeScreen()

; Play Screen
addScreenPosition(.42,-0.42,1)
completeScreen()

; keep track of dragging
mDown = 0

; Initialize user environment
WinWait Hearthstone
WinActivate Hearthstone

currScreen := 0
currScreenPosition := 0

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
if (mDown = 0)
{
	Send {Mouse down}
	mDown := 1
}
else
{
	Send {Mouse up}
	mDown := 0
}
return

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
	yBattlePlay := battleHeight - 65

	MouseMove, xBattlePlay, yBattlePlay
	Send {Click}
	
	WinWait Hearthstone
}

closeGame()
{
	WinKill Hearthstone
	WinKill Battle.net
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

	blah1 := screenX%currScreen%_%currScreenPosition%
	blah2 := screenY%currScreen%_%currScreenPosition%

	local x := midX+width*screenX%currScreen%_%currScreenPosition%
	local y := midY-height*screenY%currScreen%_%currScreenPosition%

	MouseMove, x, y
}