; Screens are created by adding all necessary positions using addScreenPosition()
; and then completing the screen with completeScreen()
;
; addScreenPosition( X Offset, Y Offset, Target )
; X and Y Offest assume that 0,0 is in the center of the playable area
;
; X Offsets range from
; * -1 -- left boundary of the playable area to
; *  1 -- right boundary of the playable area
;
; Y Offsets range from
; * -1 -- bottom of the playable area to
; *  1 -- top of the playable area
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
completeScreen()

; 1 MAIN MENU
addScreenPosition(0,.38,??) ; PLAY
addScreenPosition(0,.25,2) ; SOLO
addScreenPosition(0,.1,??) ; ARENA
addScreenPosition(-.84,-.73,??) ; SHOP
addScreenPosition(-.58,-.73,??) ; QUEST LOG
addScreenPosition(-.26,-.69,??) ; OPEN PACKS
addScreenPosition(.14,-.69,??) ; MY COLLECTION
completeScreen()

; 2 SOLO
addScreenPosition(.6,.58,-1) ; Select Normal
addScreenPosition(.6,.45,-1) ; Select Expert`
addScreenPosition(.6,.32,??) ; NAXXRAMAS
addScreenPosition(.6,.14,??) ; BLACKROCK
addScreenPosition(.6,-.64,3) ; CHOOSE
addScreenPosition(.88,-0.84,1) ; BACK
completeScreen()

; 3 PRACTICE CUSTOM DECKS
addScreenPosition(-.68,.44,-1) ; Custom Deck Slots 1
addScreenPosition(-.34,.44,-1) ; 2
addScreenPosition(-.02,.44,-1) ; 3
addScreenPosition(-.68,.02,-1) ; 4
addScreenPosition(-.34,.02,-1) ; 5
addScreenPosition(-.02,.02,-1) ; 6
addScreenPosition(-.68,-.38,-1) ; 7
addScreenPosition(-.34,-.38,-1) ; 8
addScreenPosition(-.02,-.38,-1) ; 9 - End Custom Deck Slots
addScreenPosition(-.58,-.82,4) ; Basic Decks
addScreenPosition(.78,.07,-1) ; Hero Ability
addScreenPosition(.62,-.09,-1) ; Hero Experience
addScreenPosition(.62,-.62,6) ; CHOOSE
addScreenPosition(.88,-.84,2) ; BACK
completeScreen()

; 4 PRACTICE BASIC DECKS
addScreenPosition(-.68,.44,-1) ; Basic Deck Slots 1
addScreenPosition(-.34,.44,-1) ; 2
addScreenPosition(-.02,.44,-1) ; 3
addScreenPosition(-.68,.02,-1) ; 4
addScreenPosition(-.34,.02,-1) ; 5
addScreenPosition(-.02,.02,-1) ; 6
addScreenPosition(-.68,-.38,-1) ; 7
addScreenPosition(-.34,-.38,-1) ; 8
addScreenPosition(-.02,-.38,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.1,-.82,3) ; Custom Decks
addScreenPosition(.78,.07,-1) ; Hero Ability
addScreenPosition(.62,-.09,-1) ; Hero Experience
addScreenPosition(.62,-.62,5) ; CHOOSE
addScreenPosition(.88,-.84,2) ; BACK
completeScreen()

; 5 PRACTICE BASIC DECKS CHOOSE OPPONENT
addScreenPosition(.65,.76,-1) ; Opponent Slots 1
addScreenPosition(.65,.64,-1) ; 2
addScreenPosition(.65,.52,-1) ; 3
addScreenPosition(.65,.4,-1) ; 4
addScreenPosition(.65,.28,-1) ; 5
addScreenPosition(.65,.15,-1) ; 6
addScreenPosition(.65,.03,-1) ; 7
addScreenPosition(.65,-.08,-1) ; 8
addScreenPosition(.65,-.21,-1) ; 9 - End Opponent Slots
addScreenPosition(.62,-.62,7) ; PLAY
addScreenPosition(.88,-.84,4) ; BACK
addScreenPosition(-.68,.44,-1) ; Basic Deck Slots 1
addScreenPosition(-.34,.44,-1) ; 2
addScreenPosition(-.02,.44,-1) ; 3
addScreenPosition(-.68,.02,-1) ; 4
addScreenPosition(-.34,.02,-1) ; 5
addScreenPosition(-.02,.02,-1) ; 6
addScreenPosition(-.68,-.38,-1) ; 7
addScreenPosition(-.34,-.38,-1) ; 8
addScreenPosition(-.02,-.38,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.1,-.82,6) ; Custom Decks Choose Opponent
completeScreen()

; 6 PRACTICE CUSTOM DECKS CHOOSE OPPONENT
addScreenPosition(.65,.76,-1) ; Opponent Slots 1
addScreenPosition(.65,.64,-1) ; 2
addScreenPosition(.65,.52,-1) ; 3
addScreenPosition(.65,.4,-1) ; 4
addScreenPosition(.65,.28,-1) ; 5
addScreenPosition(.65,.15,-1) ; 6
addScreenPosition(.65,.03,-1) ; 7
addScreenPosition(.65,-.08,-1) ; 8
addScreenPosition(.65,-.21,-1) ; 9 - End Opponent Slots
addScreenPosition(.62,-.62,7) ; PLAY
addScreenPosition(.88,-.84,3) ; BACK
addScreenPosition(-.68,.44,-1) ; Custom Deck Slots 1
addScreenPosition(-.34,.44,-1) ; 2
addScreenPosition(-.02,.44,-1) ; 3
addScreenPosition(-.68,.02,-1) ; 4
addScreenPosition(-.34,.02,-1) ; 5
addScreenPosition(-.02,.02,-1) ; 6
addScreenPosition(-.68,-.38,-1) ; 7
addScreenPosition(-.34,-.38,-1) ; 8
addScreenPosition(-.02,-.38,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.58,-.82,5) ; Basic Decks Choose Opponent
completeScreen()

; 7 STARTING HAND 3 CARDS
addScreenPosition(-.48,0,-1) ; Starting Cards 1
addScreenPosition(0,0,-1) ; 2
addScreenPosition(.48,0,-1) ; 3 - End Starting Cards
addScreenPosition(.01,-.55,9) ; CONFIRM
completeScreen()

; 8 STARTING HAND 4 CARDS
addScreenPosition(-.52,0,-1) ; Starting Cards 1
addScreenPosition(-.18,0,-1) ; 2
addScreenPosition(.18,0,-1) ; 3
addScreenPosition(.52,0,-1) ; 4 - End Starting Cards
addScreenPosition(.01,-.55,9) ; CONFIRM
completeScreen()

; 9 GAME STATUS SCREEN
addScreenPosition(0,.9,-1) ; Enemy Hand
addScreenPosition(-.22,.54,-1) ; Enemy Weapon
addScreenPosition(.22,.54,-1) ; Enemy Ability
addScreenPosition(.94,.41,-1) ; Enemy Deck
addScreenPosition(.94,-.15,-1) ; Player Deck
addScreenPosition(-.88,.39,-1) ; Game History 1
addScreenPosition(-.88,.34,-1) ; 2
addScreenPosition(-.88,.27,-1) ; 3
addScreenPosition(-.88,.23,-1) ; 4
addScreenPosition(-.88,.16,-1) ; 5
addScreenPosition(-.88,.11,-1) ; 6
addScreenPosition(-.88,.04,-1) ; 7
addScreenPosition(-.88,-.02,-1) ; 8
addScreenPosition(-.88,-.08,-1) ; 9
addScreenPosition(-.88,-.14,-1) ; 10
addScreenPosition(-.88,-.2,-1) ; 11
addScreenPosition(-.88,-.25,-1) ; 12
addScreenPosition(-.88,-.3,-1) ; 13 - End Game History
completeScreen()

; 10 GAME PLAY SCREEN
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(-.22,-.54,-1) ; Player Weapon
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()