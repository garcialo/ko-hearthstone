IfWinNotExist Hearthstone
{
	launchGame()
}

sleep 10000 ; lets the game run for 10 seconds
closeGame()

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
	
	; This is clunky, but for now it works for launching Battle.net with Hearthstone selected
	Send ^{Esc} ; open start menu
	Sleep 10
	Send hearthstone
	Sleep 10
	Send {Enter}
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
	ExitApp
}



; DATAPOINTS for position of PLAY button on battle.net

; Minimum Size: 720 width and 540 height
; at 720/540
; starts at x172 / y444
; end at x402 / y512
; height - playStartY = 96

; Custom Size: 1257 width and 789 height
; start x172 / y688
; end x402 / y756
; height - playStartY = 101

; Custom Size: 720 width and 871 height
; start x172 / y770
; end x402 / y838
; height - playStartY = 101

; Always the same size: 230 wide and 68 high
; Always starts at x172 and ends at x402
; Place cursor at x between x172 and x402...so, let's say x287

; Mostly starts at 101 above window height and ends at 33 above window height
; Sometime starts at 96 above window height and ends at 28 above the window height
; Place cursor at y between y96aboveHeight (lower start) and y33aboveHeight...so, let's say y = height - 65