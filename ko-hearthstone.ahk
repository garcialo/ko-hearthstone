#Include isFullscreen.ahk ; isFullscreen() function
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; global variables
debug = true
logging = true
handSize = 0

; globals used by checkHandSize
pixelsAway := 2
numShades := 1

FormatTime,timestamp
kolog(timestamp)

; WinHide ahk_class Shell_TrayWnd
IfWinNotExist Hearthstone
{
	launchGame()
}

; SET UP SCREEN FOR POSITIONS

; get width/height of Hearthstone Window
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

; logging final variables for use
kolog("Fullscreen: " fullscreen "`nWidth/Height: " width " x " height "`nPlayW/PlayH: " playWidth " x " playHeight "`nZeroX/ZeroY: " zeroX " x " zeroY "`nMaxX/MaxY: " maxX " x " maxY)

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

if(debug)
{
	ToolTip, Screen %currScreen% Current Position %currScreenPosition% , 110,5
}
return

+Tab::
currScreenPosition -= 1
if (currScreenPosition < 0)
{
	currScreenPosition := screenSizes%currScreen% - 1
}
MoveMouse()

if(debug)
{
	ToolTip, Screen %currScreen% Current Position %currScreenPosition% , 110,5
}
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
if (currScreen = 9) ; if GAME STATUS SCREEN, GO TO THE APPROPRIATE GAMEPLAY SCREEN
{
	prevPos%currScreen% := currScreenPosition
	handSize := -1
	checkHandSize()

	if handSize < 0
	{
		askHandSize()
	}
	else
	{
		MsgBox Hand Size is %handSize%
	}

	currScreen := handSize + 10
	gotoScreen()
}
else if (currScreen > 9 and currScreen < 20)
{
	prevPos%currScreen% := currScreenPosition
	currScreen := 9
	gotoScreen()
}
return

o::
askHandSize()
return

`::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 0
}
return

1::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 1
}
return

2::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 2
}
return

3::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 3
}
return

4::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 4
}
return

5::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 5
}
return

6::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 6
}
return

7::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 7
}
return

8::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 8
}
return

9::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 9
}
return

0::
if (currScreen > 8 and currScreen < 21)
{
	handSize := 10
}
return

; wondering if I should put some mouse-nudge buttons in here
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
	FormatTime,timestamp
	kolog(timestamp)
	kolog("Closing Hearthstone`n")
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

	; capturing information before resetting for next position
	if(debug)
	{
		kolog("SENT for " currScreenPosition " x/y/target: " x "/" y "/" targetScreen)
	}
	
	; resettng for next position
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

	; capturing informatoin before resetting for next screen completion
	if(debug)
	{
		kolog("`nCompleting Screen: " currScreen)
		Loop %currScreenPosition%
		{
			actualIndex := A_Index - 1
			testX := screenX%currScreen%_%actualIndex%
			testY := screenY%currScreen%_%actualIndex%
			kolog("Position: " actualIndex " -- X/Y: " testX "/" testY "`n")
		}
	}

	; resetting for next screen completion
	currScreen += 1
	currScreenPosition := 0
}

gotoScreen()
{
	global
	; display ToolTip
	ToolTip, ko-hearthstone is working..., zeroX, zeroY

	; disable user controls
	Suspend, on

	screenProcess(currScreen)

	verifyScreen(currScreen)

	; re-enable hotkeys
	Suspend, off

	; disable ToolTip
	ToolTip
	
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
	; xOff = horizontal offset in pixels
	local xOff := maxX * screenX%currScreen%_%currScreenPosition%
	local x := zeroX + xOff
	
	; xOff = vertical offset in pixels
	local yOff := maxY * screenY%currScreen%_%currScreenPosition%
	local y := zeroY - yOff

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
	; process screen-specific processes
	; also used to adjust the loading time for each screen

	; unfortunately AHK doesn't have switch/case
	if (targetScreenNum = 2) ; SOLO ADVENTURE
	{
		; Since we don't know which solo adventure is selected, put the screen into a known state
		sleep 2500

		; Mouse move to NAXXRAMAS and click
		MoveClick(.6,.32)

		; Mouse move to PRACTICE and click
		MoveClick(.6,.7)
		;  Sleep while PRACTICE expands
		sleep 34

		; Mouse move to Normal and click
		MoveClick(.6,.58)
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
	else if (targetScreenNum = 7) ; STARTING HAND
	{
		ToolTip, ko-hearthstone is waiting for the match to start, zeroX,zeroY
		sleep 25000

		fourCards := false

		x1 := zeroX + maxX * -.70
		y1 := zeroY - maxY * .25
		x2 := zeroX + maxX * -.66
		y2 := zeroY - maxY * -.18

		PixelSearch,,, x1,y1,x2,y2, 0x42FF65,0,Fast
		if not ErrorLevel
		{
			fourCards := true
		}

		; assuming 3 starting cards
		; hand size will be 4; 3 starting cards + drawn card
		handSize := 4

		if(fourCards)
		{
			currScreen := 8 ; Screen 8 is the one with 4 cards
			
			; hand size will be 6; 4 starting cards + coin + drawn card
			handSize := 6
		}
	}
	else ; default
	{
	}
}

checkHandSize()
{
	; this function will eventually have logic to verify how many cards in hand
	; this will set variable handSize to functions best guess as to the hand size
	; if it cant be determined, it will call function askHandSize
	;
	; logic:
	; this function searches for white in the area where a gem for certain cards should be
	
	; x and y Offsets for cards to check for

	ax := -.13
	ay := -.76
	bx := -.23
	by := -.76
	cx := -.47
	cy := -.86
	dx := -.32
	dy := -.76
	ex := -.45
	ey := -.87
	fx := -.21
	fy := -.79
	gx := .22
	gy := -.80
	hx := -.38
	hy := -.83
	ix := .11
	iy := -.79
	jx := .14
	jy := -.78
	kx := -.40
	ky := -.87
	lx := -.42
	ly := -.87
	mx := -.42
	my := -.86
	nx := -.22
	ny := -.78
	ox := -.52
	oy := -.96
	px := -.44
	py := -.90

	; checks whether a gem is in the area around each point
	a := searchPointArea(aX,aY)
	b := searchPointArea(bX,bY)
	c := searchPointArea(cX,cY)
	d := searchPointArea(dX,dY)
	e := searchPointArea(eX,eY)
	f := searchPointArea(fX,fY)
	g := searchPointArea(gX,gY)
	h := searchPointArea(hX,hY)
	i := searchPointArea(iX,iY)
	j := searchPointArea(jX,jY)
	k := searchPointArea(kX,kY)
	l := searchPointArea(lX,lY)
	m := searchPointArea(mX,mY)
	n := searchPointArea(nX,nY)
	o := searchPointArea(oX,oY)
	p := searchPointArea(pX,pY)
	
	; combinations of points having gems or not should reflect the number of cards
	; true values mean that there is a gem in that position
	; false values mean that there is not a gem in that position
	
	; if the last else is reached, it means the function failed to determine the number of cards
	; either because of search function failure or an unknown combinations of gem/non-gem points is found
	; so, it just asks the user outright how many cards they have

	if a and !b and !c and !d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 1
	else if !a and b and !c and !d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 2
	else if a and !b and !c and d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 3
	else if !a and !b and !c and !d and e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 4
	else if !b and c and !d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 5
	else if !a and !b and !c and !d and !e and f and g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 6
	else if !b and !c and !d and !e and !f and !g and h and i and !j and !k and !l and !m and !n and !o and !p
		handSize := 7
	else if !a and !b and !c and !d and !e and !f and !g and !h and !i and j and k and !l and !m and !n and !o and !p
		handSize := 8
	else if !a and !b and !c and !d and !e and !f and !g and !h and !i and !j and !k and l and m and n and !o and !p
		handSize := 9
	else if !a and !b and !c and !d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and o and p
		handSize := 10
	else if !a and !b and !c and !d and !e and !f and !g and !h and !i and !j and !k and !l and !m and !n and !o and !p
		handSize := 0
	else
		MsgBox Must ask hand size
		; askHandSize()
	
	MsgBox Hand Size is %handSize%
}

searchPointArea(xOff,yOff)
{
	; helper function for checkHandSize
	; looks for pure white which occurs on gems
	; if there is white around the specified point, returns true
	global
	
		; convert the offsets to x/y coordinates for a point
		pointX := zeroX + maxX * xOff
		pointY := zeroY - maxY * yOff
		
		; find the coordinates around the point
		; this determines where we're going to search to see if it's a gem or not
		startX := pointX - pixelsAway
		endX := pointX + pixelsAway
		startY := pointY - pixelsAway
		endY := pointY + pixelsAway
		
		; search for white
		PixelSearch, foundX,foundY, startX,startY, endX,endY, 0xFFFFFF, numShades, Slow
	MsgBox Nothing found %numShades% away
	PixelSearch, BLEX,BLEY, startX,startY, endX,endY, 0xFFFFFF, 255, Slow
	MsgBox Nothing found +255 away
	ExitApp
			
		; ErrorLevel 1 means color not found
		; ErrorLevel 0 means color found
		; ErrorLevel 2 means PixelSearch failed
		if ErrorLevel = 1
		{
			return false
		}
		else if ErrorLevel = 0
		{
			return true
		}
		else
		{
			; this catches the case where the search fails completely
			; it waits 100ms and tries searching again
			; if it still fails to find the color, returns false
			sleep 100
			PixelSearch, foundX,foundY, startX,startY, endX,endY, 0xFFFFFF, numShades, Slow

			if ErrorLevel = 0
			{
				return true
			}
			else
			{
				return false
			}
		}
}

askHandSize()
{
	global
		handSize = -1
		while (handSize < 0)
		{
			ToolTip, What is your current hand size? (Please use the number keys)`n(Type 0 for 10 and type ` for 0), zeroX,zeroY
			sleep 500
		}
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

kolog(addToLog)
{
	global
	if (logging)
	{
		FileAppend, %addToLog%`n, koh.log
		If ErrorLevel
		{
			MsgBox ERROR!
		}
	}
}