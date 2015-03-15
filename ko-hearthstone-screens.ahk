; Screens are created by adding all necessary positions using addScreenPosition()
; and then completing the screen with completeScreen()
;
; addScreenPosition( X Offset, Y Offset, Target )
; X and Y Offest assume that 0,0 is in the center of the playable area
;
; X Offsets range from
; * -.5 -- left boundary of the playable area to
; *  .5 -- right boundary of the playable area
;
; Y Offsets range from
; * -.5 -- bottom of the playable area to
; *  .5 -- top of the playable area
;
; Target should be one of the following values
; -2 -- used to return to previous screen
; -1 -- do nothing; used for selecting options that dont' take the user to another screen
;  0 -- is not used; don't use it
;    Note: Screen 0 is the splash screen; it's never reached again
; Positive Numbers -- Index for all screens used in the game
;
; 0 - Today's  Quests
; 1 - MAIN MENU
; 2 - SOLO
; 3 - PRACTICE CUSTOM DECKS

; 0 - Today's Quests
addScreenPosition(0,0,1) ; > 1 MAIN MENU
addFooter()
completeScreen()

; 1 MAIN MENU
addScreenPosition(0,.16,??) ; PLAY
addScreenPosition(0,.10,2) ; SOLO
addScreenPosition(0,.03,??) ; ARENA
addScreenPosition(-.42,-.4,??) ; SHOP
addScreenPosition(-.29,-.4,??) ; QUEST LOG
addScreenPosition(-.13,-.36,??) ; OPEN PACKS
addScreenPosition(.07,-.36,??) ; MY COLLECTION
completeScreen()

; 2 SOLO
addScreenPosition(.3,.27,-1) ; Select Normal
addScreenPosition(.3,.21,-1) ; Select Expert`
addScreenPosition(.3,.14,??) ; NAXXRAMAS
addScreenPosition(.3,-.33,3) ; CHOOSE
addScreenPosition(.44,-0.45,1) ; BACK
completeScreen()

; 3 PRACTICE CUSTOM DECKS
addScreenPosition(-.33,.2,-1) ; Custom Deck Slots 1
addScreenPosition(-.16,.2,-1) ; 2
addScreenPosition(-.01,.2,-1) ; 3
addScreenPosition(-.33,0,-1) ; 4
addScreenPosition(-.16,0,-1) ; 5
addScreenPosition(-.01,0,-1) ; 6
addScreenPosition(-.33,-.2,-1) ; 7
addScreenPosition(-.16,-.2,-1) ; 8
addScreenPosition(-.01,-.2,-1) ; 9 - End Custom Deck Slots
addScreenPosition(-.29,-.44,??) ; Basic Decks
addScreenPosition(.4,0,-1) ; Hero Ability
addScreenPosition(.3,-.08,-1) ; Hero Experience
addScreenPosition(.3,-.33,??) ; PLAY
addScreenPosition(.44,-0.45,2) ; BACK
completeScreen()

; INCOMPLETE
; INCOMPLETE

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
completeScreen()