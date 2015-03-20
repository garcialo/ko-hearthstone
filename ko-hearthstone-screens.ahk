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
addScreenPosition(0,.32,??) ; PLAY
addScreenPosition(0,.2,2) ; SOLO
addScreenPosition(0,.06,??) ; ARENA
addScreenPosition(-.84,-.8,??) ; SHOP
addScreenPosition(-.58,-.8,??) ; QUEST LOG
addScreenPosition(-.26,-.72,??) ; OPEN PACKS
addScreenPosition(.14,-.72,??) ; MY COLLECTION
completeScreen()

; 2 SOLO
addScreenPosition(.6,.54,-1) ; Select Normal
addScreenPosition(.6,.42,-1) ; Select Expert`
addScreenPosition(.6,.28,??) ; NAXXRAMAS
addScreenPosition(.6,-.66,3) ; CHOOSE
addScreenPosition(.88,-0.9,1) ; BACK
completeScreen()

; 3 PRACTICE CUSTOM DECKS
addScreenPosition(-.66,.4,-1) ; Custom Deck Slots 1
addScreenPosition(-.32,.4,-1) ; 2
addScreenPosition(-.02,.4,-1) ; 3
addScreenPosition(-.66,0,-1) ; 4
addScreenPosition(-.32,0,-1) ; 5
addScreenPosition(-.02,0,-1) ; 6
addScreenPosition(-.66,-.4,-1) ; 7
addScreenPosition(-.32,-.4,-1) ; 8
addScreenPosition(-.02,-.4,-1) ; 9 - End Custom Deck Slots
addScreenPosition(-.58,-.88,4) ; Basic Decks
addScreenPosition(.8,0,-1) ; Hero Ability
addScreenPosition(.6,-.16,-1) ; Hero Experience
addScreenPosition(.6,-.66,6) ; CHOOSE
addScreenPosition(.88,-.9,2) ; BACK
completeScreen()

; 4 PRACTICE BASIC DECKS
addScreenPosition(-.66,.4,-1) ; Basic Deck Slots 1
addScreenPosition(-.32,.4,-1) ; 2
addScreenPosition(-.02,.4,-1) ; 3
addScreenPosition(-.66,0,-1) ; 4
addScreenPosition(-.32,0,-1) ; 5
addScreenPosition(-.02,0,-1) ; 6
addScreenPosition(-.66,-.4,-1) ; 7
addScreenPosition(-.32,-.4,-1) ; 8
addScreenPosition(-.02,-.4,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.1,-.88,3) ; Custom Decks
addScreenPosition(.8,0,-1) ; Hero Ability
addScreenPosition(.4,-.16,-1) ; Hero Experience
addScreenPosition(.6,-.66,5) ; CHOOSE
addScreenPosition(.88,-0.9,2) ; BACK
completeScreen()

; 5 PRACTICE BASIC DECKS CHOOSE OPPONENT
addScreenPosition(.74,.72,-1) ; Opponent Slots 1
addScreenPosition(.74,.6,-1) ; 2
addScreenPosition(.74,.48,-1) ; 3
addScreenPosition(.74,.34,-1) ; 4
addScreenPosition(.74,.22,-1) ; 5
addScreenPosition(.74,.1,-1) ; 6
addScreenPosition(.74,-.02,-1) ; 7
addScreenPosition(.74,-.14,-1) ; 8
addScreenPosition(.74,-.26,-1) ; 9 - End Opponent Slots
addScreenPosition(.6,-.66,7) ; PLAY
addScreenPosition(.88,-0.9,4) ; BACK
addScreenPosition(-.66,.4,-1) ; Basic Deck Slots 1
addScreenPosition(-.32,.4,-1) ; 2
addScreenPosition(-.02,.4,-1) ; 3
addScreenPosition(-.66,0,-1) ; 4
addScreenPosition(-.32,0,-1) ; 5
addScreenPosition(-.02,0,-1) ; 6
addScreenPosition(-.66,-.4,-1) ; 7
addScreenPosition(-.32,-.4,-1) ; 8
addScreenPosition(-.02,-.4,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.1,-.88,6) ; Custom Decks Choose Opponent
completeScreen()

; 6 PRACTICE CUSTOM DECKS CHOOSE OPPONENT
addScreenPosition(.74,.72,-1) ; Opponent Slots 1
addScreenPosition(.74,.6,-1) ; 2
addScreenPosition(.74,.48,-1) ; 3
addScreenPosition(.74,.34,-1) ; 4
addScreenPosition(.74,.22,-1) ; 5
addScreenPosition(.74,.1,-1) ; 6
addScreenPosition(.74,-.02,-1) ; 7
addScreenPosition(.74,-.14,-1) ; 8
addScreenPosition(.74,-.26,-1) ; 9 - End Opponent Slots
addScreenPosition(.6,-.66,7) ; PLAY
addScreenPosition(.88,-0.9,3) ; BACK
addScreenPosition(-.66,.4,-1) ; Basic Deck Slots 1
addScreenPosition(-.32,.4,-1) ; 2
addScreenPosition(-.02,.4,-1) ; 3
addScreenPosition(-.66,0,-1) ; 4
addScreenPosition(-.32,0,-1) ; 5
addScreenPosition(-.02,0,-1) ; 6
addScreenPosition(-.66,-.4,-1) ; 7
addScreenPosition(-.32,-.4,-1) ; 8
addScreenPosition(-.02,-.4,-1) ; 9 - End Basic Deck Slots
addScreenPosition(-.58,-.88,5) ; Basic Decks Choose Opponent
completeScreen()

; 7 STARTING HAND 3 CARDS
addScreenPosition(-.48,0,-1) ; Starting Cards 1
addScreenPosition(0,0,-1) ; 2
addScreenPosition(.48,0,-1) ; 3 - End Starting Cards
addScreenPosition(0,-.64,9) ; CONFIRM
completeScreen()

; 8 STARTING HAND 4 CARDS
addScreenPosition(-.52,0,-1) ; Starting Cards 1
addScreenPosition(-.18,0,-1) ; 2
addScreenPosition(.18,0,-1) ; 3
addScreenPosition(.52,0,-1) ; 4 - End Starting Cards
addScreenPosition(0,-.64,9) ; CONFIRM
completeScreen()

; 9 GAME STATUS SCREEN
addScreenPosition(0,.9,-1) ; Enemy Hand
addScreenPosition(-.22,.54,-1) ; Enemy Weapon
addScreenPosition(.22,.54,-1) ; Enemy Ability
addScreenPosition(.94,.34,-1) ; Enemy Deck
addScreenPosition(.94,-.22,-1) ; Player Deck
addScreenPosition(-.9,.36,-1) ; Game History 1
addScreenPosition(-.9,.28,-1) ; 2
addScreenPosition(-.9,.22,-1) ; 3
addScreenPosition(-.9,.18,-1) ; 4
addScreenPosition(-.9,.12,-1) ; 5
addScreenPosition(-.9,.04,-1) ; 6
addScreenPosition(-.9,0,-1) ; 7
addScreenPosition(-.9,-.04,-1) ; 8
addScreenPosition(-.9,-.12,-1) ; 9
addScreenPosition(-.9,-.18,-1) ; 10
addScreenPosition(-.9,-.22,-1) ; 11
addScreenPosition(-.9,-.28,-1) ; 12
addScreenPosition(-.9,-.34,-1) ; 13 - End Game History
completeScreen()

; 10 GAME PLAY SCREEN
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(-.22,-.54,-1) ; Player Weapon
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()