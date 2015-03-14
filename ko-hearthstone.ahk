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

; LEGEND OF SCREENS
; 0 - TODAY'S QUESTS
; 1 - MAIN MENU
; 2 - PLAY
; 3 - SOLO
; Need to reorganize this much better

; 0 - Today's Quests
addScreenPosition(0,0,1) ; > 1 MAIN MENU
completeScreen()

; 1 MAIN MENU
; addScreenPosition(0,.16,2) ; > 2 PLAY`
addScreenPosition(0,.10,3) ; > 3 SOLO
; addScreenPosition(0,.03,4) ; > 4 ARENA
; addScreenPosition(-.42,-.4,5) ; > 5 SHOP
addScreenPosition(-.29,-.4,6) ; > 6 QUEST LOG
addScreenPosition(-.13,-.36,7) ; > 7 OPEN PACKS
addScreenPosition(.07,-.36,8) ; > 8 MY COLLECTION
addFooter()
completeScreen()

; 2 PLAY - CUSTOM DECKS
addScreenPosition(-.33,.2,-1) ; Custom Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Custom Deck Slots
addScreenPosition(.25,.33,-1) ; Casual
addScreenPosition(.37,.33,-1) ; Ranked
addScreenPosition(.4,0,-1) ; Hero Ability
addScreenPosition(.3,-.08,-1) ; Hero Experience
addScreenPosition(-.29,-.44,11) ; > 11 Basic Decks
; addScreenPosition(.3,-.33,??) ; > ?? PLAY - currently disabled
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 3 SOLO
addScreenPosition(.3,.33,-1) ; Slots for Practice/Naxx/Other Adventures
addScreenPosition(.3,.26,-1) ; 
addScreenPosition(.3,.2,-1) ; 
addScreenPosition(.3,.17,-1) ; 
addScreenPosition(.3,.11,-1) ; 
addScreenPosition(.3,.06,-1) ; End slots for Adventures
addScreenPosition(.3,-.33,12) ; >> 12 CHOOSE
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 4 ARENA
; will implement later
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 5 SHOP
; will implement later...probably last
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 6 QUEST LOG
addScreenPosition(-.21,.29,-1) ; Play Mode Wins
addScreenPosition(.21,.29,-1) ; Best Arena Key
addScreenPosition(-.16,.1,-1) ; Hero Levels
addScreenPosition(0,.1,-1) ; 
addScreenPosition(.16,.1,-1) ; 
addScreenPosition(-.16,.01,-1) ; 
addScreenPosition(0,.01,-1) ; 
addScreenPosition(.16,.01,-1) ; 
addScreenPosition(-.16,-.1,-1) ; 
addScreenPosition(0,-.1,-1) ; 
addScreenPosition(.16,-.1,-1) ; End Hero Levels
addScreenPosition(-.11,-.25,-1) ; Dismiss Quest 1
addScreenPosition(.06,-.25,-1) ; Dismiss Quest 2
addScreenPosition(.23,-.25,-1) ; Dismiss Quest 3
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 7 0PEN PACKS
; will implement later
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 8 MY COLLECTION
addScreenPosition(-.45,.43,-1) ; Class Cards
addScreenPosition(-.4,.43,-1) ;
addScreenPosition(-.35,.43,-1) ;
addScreenPosition(-.30,.43,-1) ;
addScreenPosition(-.26,.43,-1) ;
addScreenPosition(-.21,.43,-1) ;
addScreenPosition(-.16,.43,-1) ;
addScreenPosition(-.11,.43,-1) ;
addScreenPosition(-.06,.43,-1) ;
addScreenPosition(-.01,.43,-1) ; End Class Cards
addScreenPosition(.18,.44,??) ; Crafting Mode
addScreenPosition(-.4,.15,-1) ; Top 4
addScreenPosition(-.2,.15,-1) ;
addScreenPosition(-.05,.15,-1) ;
addScreenPosition(.11,.15,-1) ; End Top 4
addScreenPosition(-.49,-.05,-1) ; Go Left
addScreenPosition(-.4,-.15,-1) ; Bottom 4
addScreenPosition(-.2,-.15,-1) ;
addScreenPosition(-.05,-.15,-1) ;
addScreenPosition(.11,-.15,-1) ; End Bottom 4
addScreenPosition(.22,-.05,-1) ; Go Right
addScreenPosition(-.44,-.44,-1) ; Mana Cost All
addScreenPosition(-.38,-.44,-1) ;
addScreenPosition(-.35,-.44,-1) ;
addScreenPosition(-.32,-.44,-1) ;
addScreenPosition(-.29,-.44,-1) ;
addScreenPosition(-.25,-.44,-1) ;
addScreenPosition(-.22,-.44,-1) ;
addScreenPosition(-.19,-.44,-1) ;
addScreenPosition(-.16,-.44,-1) ; 7 Plus
addScreenPosition(-.01,-.44,-1) ; Search
addScreenPosition(.07,-.44,-1) ; Close Search
addScreenPosition(.22,-.44,??) ; All Sets
addScreenPosition(.37,.35,??) ; Deck Slots
addScreenPosition(.37,.26,??) ;
addScreenPosition(.37,.17,??) ;
addScreenPosition(.37,.08,??) ;
addScreenPosition(.37,-.01,??) ;
addScreenPosition(.37,-.1,??) ;
addScreenPosition(.37,-.19,??) ;
addScreenPosition(.37,-.28,??) ;
addScreenPosition(.37,-.37,??) ; End Deck Slots
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 9 FRIENDS
; problem: the back button won't always go back to MAIN MENU
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 10 GAME MENU
addScreenPosition(0,0,??) ; > OPTIONS
addScreenPosition(0,0,??) ; > QUIT
addScreenPosition(0,0,??) ; > RESUME
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
completeScreen()

; 11 PLAY - BASIC DECKS
addScreenPosition(-.33,.2,-1) ; Basic Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Basic Deck Slots
addScreenPosition(.25,.33,-1) ; Casual
addScreenPosition(.37,.33,-1) ; Ranked
addScreenPosition(.4,0,-1) ; Hero Ability
addScreenPosition(.3,-.08,-1) ; Hero Experience
addScreenPosition(-.05,-.44,2) ; > 2 Custom Decks
; addScreenPosition(.3,-.33,??) ; > ?? PLAY - currently disabled
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 12 SOLO > CHOOSE
addScreenPosition(-.33,.2,-1) ; Basic Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Basic Deck Slots
addScreenPosition(.4,0,-1) ; Hero Ability
addScreenPosition(.3,-.08,-1) ; Hero Experience
addScreenPosition(-.29,-.44,13) ; > 13 Custom Decks
addScreenPosition(.3,-.33,14) ; > 14 CHOOSE
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 13 SOLO - CUSTOM DECKS
addScreenPosition(-.33,.2,-1) ; Basic Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Basic Deck Slots
addScreenPosition(.4,0,-1) ; Hero Ability
addScreenPosition(.3,-.08,-1) ; Hero Experience
addScreenPosition(-.05,-.44,12) ; > 2 Basic Decks
addScreenPosition(.3,-.33,14) ; > 14 PLAY
addScreenPosition(.44,-0.45,1) ; BACK > 1 MAIN MENU
addFooter()
completeScreen()

; 14 SOLO - CHOOSE OPPONENT
addScreenPosition(-.33,.2,-1) ; Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Deck Slots
addScreenPosition(.37,.35,??) ; Opponent Slots
addScreenPosition(.37,.31,??) ;
addScreenPosition(.37,.27,??) ;
addScreenPosition(.37,.08,??) ;
addScreenPosition(.37,-.01,??) ;
addScreenPosition(.37,-.1,??) ;
addScreenPosition(.37,-.19,??) ;
addScreenPosition(.37,-.28,??) ;
addScreenPosition(.37,-.37,??) ; End Opponent Slots
addScreenPosition(-.05,-.44,??) ; > ?? Basic Decks Choose Opponent
addFooter()
completeScreen()



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
	
	addScreenPosition(foff,-.5,9) ; > 9 FRIENDS
	addScreenPosition(goff,-.5,-1) ; > X GOLD
	addScreenPosition(moff,-.5,10) ; > 10 GAME MENU
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