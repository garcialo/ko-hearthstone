#Include isFullscreen.ahk ; isFullscreen() function

debug = true

; WinHide ahk_class Shell_TrayWnd
IfWinNotExist Hearthstone
{
	launchGame()
}

; SET UP SCREEN FOR POSITIONS

; get width/height of current Window
WinGetPos,,, width, height, Hearthstone

; checking if fullscreen or not
fullscreen := false
if (isFullscreen(Hearthstone))
{
	fullscreen := true
}

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

	; playHeight/Width reflect the play area without window borders/titlebar
	playWidth := width - leftRightBorderSize * 2
	playHeight := height - titleBarSize - topBottomBorderSize * 2

	; zeroY is half window height; and lowered to account for size of title bar
	zeroY := height / 2 - (titleBarSize / 2)
}

; any window area beyond minWidth is just padding
; the usable horizontal space is determined relative to the playscreen height
minWidth := Ceil(playHeight * 1.332)

; the maximum X distance from the center a position can be is half the minWidth
; rounding up just because
maxX := Ceil(minWidth / 2)

; the maximum Y distance from the center a position can be is half the play area height
; rounding up because of the reasons rounding up for maxX
maxY := Ceil(playHeight / 2)

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
Suspend, on
sleep 17000
Suspend, off
MoveMouse()

; The overlay is now in place. The script should run until closed by the user.

; HOTKEYS
; HOTKEYS
; HOTKEYS

q::
closeGame()
return

Tab::
currScreenPosition += 1
if (currScreenPosition >= screenSizes%currScreen%)
{
	currScreenPosition := 0
}
MoveMouse()
return

+Tab::
currScreenPosition -= 1
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
	prevPos%currScreen% := currScreenPosition
	currScreen := target%currScreen%_%currScreenPosition%
	gotoScreen()
}
return

+Space::
+Enter::
Send {Click, right}
sleep 50
return

p::
if (currScreen = 9)
{
	prevPos%currScreen% := currScreenPosition
	currScreen := 10
	gotoScreen()
}
else if ( currScreen = 10)
{
	prevPos%currScreen% := currScreenPosition
	currScreen := 9
	gotoScreen()
}
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
	assert(maxX <> 0, A_LineNumber)
	local foff := -.94 * playWidth / maxX
	local goff := .80 * playWidth / maxX
	local moff := .94 * playWidth / maxX
	
	addScreenPosition(foff,-.9,??) ; FRIENDS
	addScreenPosition(goff,-.9,-1) ; GOLD
	addScreenPosition(moff,-.9,??) ; GAME MENU
}

completeScreen()
{
	global
	prevPos%currScreen% := 0
	screenSizes%currScreen% := currScreenPosition
	currScreen += 1
	currScreenPosition := 0
}

gotoScreen()
{
	global
	screenProcess(currScreen)
	currScreenPosition := prevPos%currScreen%

	MoveMouse()
	if(debug)
	{
		ToolTip, FullscreenOn %fullscreen% Screen %currScreen% H %height% W %width% playH %playHeight% playW %playWidth% , 110,5
	}
}

MoveMouse()
{
	global
	local x := zeroX+maxX*screenX%currScreen%_%currScreenPosition%
	local y := zeroY-maxY*screenY%currScreen%_%currScreenPosition%

	MouseMove, x, y
}

MoveClick(xOff,yOff)
{
	global
	local x := zeroX + maxX * xOff
	local y := zeroY - maxY * yOff
	
	MouseMove x,y
	Send {Click}
	sleep 50
}

screenProcess(targetScreenNum)
{
	global
	; display ToolTip

	ToolTip, ko-hearthstone is working..., zeroX, zeroY

	; default loading time
	loadingTime := 1000

	; disable user controls
	Suspend, on

	; process screen-specific processes
	; also used to adjust the loading time for each screen

	; unfortunately AHK doesn't have switch/case
	if (targetScreenNum = 2) ; SOLO ADVENTURE
	{
		; Since we don't know which solo adventure is selected, put the screen into a known state
		sleep 2500

		; Mouse move to NAXXRAMAS and click
		MoveClick(.6,.28)
		
		; Mouse move to PRACTICE and click
		MoveClick(.6,.66)
		;  Sleep while PRACTICE expands
		sleep 34

		; Mouse move to Normal and click
		MoveClick(.6,.54)
	}
	else if (targetScreenNum = 3) ; PRACTICE CUSTOM DECKS
	{
		sleep 3000
		; If no custom decks exist, the left arrow to "Basic Decks" won't exist
		; If this is the case, the colors ~should~ be the ones below for the spots below
		; So...if there isn't a custom deck...ko-hearthstone will create one with some help from Blizzard
		; might want to also include this in the 'install' script so that the user won't have to go through
		; this again unless they purposefully delete all the custom decks

		noButton := false
		
		x1 := zeroX + maxX * -.6
		y1 := zeroY - maxY * -.84
		x2 := zeroX + maxX * -.56
		y2 := zeroY - maxY * -.9
		
		PixelSearch,,, x1,y1,x2,y2, 0x474A4A,0,Fast
		if not ErrorLevel
		{
			noButton := true
		}

		if (noButton)
		{
			ToolTip, ko-hearthstone is CREATING A DECK, zeroX, zeroY
			
			; Move to BACK and click
			MoveClick(.88,-.9)
			sleep 750
			; Move to BACK -already there- and click
			MoveClick(.88,-0.9)
			sleep 1250
			; Move to My Collection and click
			MoveClick(.14,-.72)
			sleep 3250
			; Move to NEW DECK and click
			MoveClick(.74,.7)
			sleep 1250
			; Move to HUNTER and click
			MoveClick(-.66,.4)
			sleep 750
			; Move to CHOOSE and click
			MoveClick(.6,-.66)
			sleep 3250
			; Move to DONE and click
			MoveClick(.88,-0.9)
			sleep 750
			; Click Yes
			MoveClick(-.16,-.22)
			sleep 8000
			; Move to DONE and click
			MoveClick(.88,-0.9)
			sleep 2000
			; Move to BACK -already there- and click
			MoveClick(.88,-0.9)
			sleep 750
			; Move to SOLO ADVENTURE and click
			MoveClick(0,.2)
			sleep 1250
			; Move to CHOOSE and click
			MoveClick(.6,-.66)
			sleep 750
		}
	}
	else if (targetScreenNum = 5 or targetScreenNum = 6) ; PRACTICE BASIC DECK CHOOSE OPPONENT
	{
		MoveClick(.74,.72)
	}
	else if (targetScreenNum = 7)
	{
		ToolTip, ko-hearthstone is waiting for the match to start, zeroX,zeroY
		sleep 25000

		fourCards := false

		x1 := zeroX + maxX * -.72
		y1 := zeroY - maxY * .48
		x2 := zeroX + maxX * -.68
		y2 := zeroY - maxY * -.18

		PixelSearch,,, x1,y1,x2,y2, 0x42FF65,0,Fast
		if not ErrorLevel
		{
			fourCards := true
		}

		if(fourCards)
		{
			currScreen := 8 ; Screen 8 is the one with 4 cards
		}
	}
	else ; default
	{
		; sleep for as long as it takes the screen to load
		sleep loadingTime
	}
	; re-enable hotkeys
	
	Suspend, off
	
	; disable ToolTip
	ToolTip
}

assert(condition, lineNumber)
{
; when calling, lineNumber should always be A_LineNumber

	global
	if (debug) and (not condition)
	{
		MsgBox Assert Hit at %lineNumber%
		ExitApp
	}
}