; Screens are created by adding all necessary positions using addScreenPosition()
; and then completing the screen with completeScreen()
;
; addScreenPosition( X Offset, Y Offset, Target )
; X and Y Offest assume that 0,0 is in the center of the playable area
;
; X Offsets range from
; -1 -- left boundary of the playable area to
;  1 -- right boundary of the playable area
;
; Y Offsets range from
; -1 -- bottom of the playable area to
;  1 -- top of the playable area
;
; Target should be one of the following values
; -1 -- do nothing; used for selecting options that dont' take the user to another screen
;  0 -- is not used; don't use it
;    Note: Screen 0 is the splash screen; it's never reached again
; Positive Numbers -- Index for all screens used in the game
;
; SCREEN LIST
; 0 - Today's  Quests
; 1 - MAIN MENU
; 2 - SOLO
; 3 - PRACTICE CUSTOM DECKS
; 4 - PRACTICE BASIC DECKS
; 5 PRACTICE BASIC DECKS CHOOSE OPPONENT
; 6 PRACTICE CUSTOM DECKS CHOOSE OPPONENT
; 7 STARTING HAND 3 CARDS
; 8 STARTING HAND 4 CARDS
; 9 GAME STATUS SCREEN
; 10 GAME PLAY SCREEN - 0 CARDS
; 11 GAME PLAY SCREEN - 1 CARDS
; 12 GAME PLAY SCREEN - 2 CARDS
; 13 GAME PLAY SCREEN - 3 CARDS
; 14 GAME PLAY SCREEN - 4 CARDS
; 15 GAME PLAY SCREEN - 5 CARDS
; 16 GAME PLAY SCREEN - 6 CARDS
; 17 GAME PLAY SCREEN - 7 CARDS
; 18 GAME PLAY SCREEN - 8 CARDS
; 19 GAME PLAY SCREEN - 9 CARDS
; 20 GAME PLAY SCREEN - 10 CARDS

;
; SCREENS
;

; 0 - Today's Quests
addScreenPosition(0,0,1) ; > 1 MAIN MENU
completeScreen()

; 1 MAIN MENU
addScreenPosition(0,.38,99) ; PLAY
addScreenPosition(0,.25,2) ; SOLO
addScreenPosition(0,.1,99) ; ARENA
addScreenPosition(-.84,-.73,99) ; SHOP
addScreenPosition(-.58,-.73,99) ; QUEST LOG
addScreenPosition(-.26,-.69,99) ; OPEN PACKS
addScreenPosition(.14,-.69,99) ; MY COLLECTION
completeScreen()

; 2 SOLO
addScreenPosition(.6,.58,-1) ; Select Normal
addScreenPosition(.6,.45,-1) ; Select Expert`
addScreenPosition(.6,.32,99) ; NAXXRAMAS
addScreenPosition(.6,.14,99) ; BLACKROCK
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
addScreenPosition(-.22,-.54,-1) ; Player Weapon
; Enemy Cards at some point
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

; 10 GAME PLAY SCREEN - 0 CARDS
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
addScreenPosition(.84,.1,9) ; End Turn
completeScreen()

; 11 GAME PLAY SCREEN - 1 CARD
addScreenPosition(-.04,-.9,-1) ; Hand
addScreenPosition(.84,.1,-1) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,9) ; Player Ability

completeScreen()

; 12 GAME PLAY SCREEN - 2 CARDS
addScreenPosition(-.13,-.9,-1) ; Hand Begin
addScreenPosition(.04,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 13 GAME PLAY SCREEN - 3 CARDS
addScreenPosition(-.23,-.9,-1) ; Hand Begin
addScreenPosition(-.06,-.9,-1)
addScreenPosition(.14,-.9,-1) ; Hand Ends
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 14 GAME PLAY SCREEN - 4 CARDS
addScreenPosition(-.33,-.9,-1) ; Hand Begin
addScreenPosition(-.15,-.9,-1)
addScreenPosition(.04,-.9,-1)
addScreenPosition(.22,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 15 GAME PLAY SCREEN - 5 CARDS
addScreenPosition(-.38,-.9,-1) ; Hand Begin
addScreenPosition(-.22,-.9,-1)
addScreenPosition(-.08,-.9,-1)
addScreenPosition(.08,-.9,-1)
addScreenPosition(.25,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 16 GAME PLAY SCREEN - 6 CARDS
addScreenPosition(-.41,-.9,-1) ; Hand Begin
addScreenPosition(-.27,-.9,-1)
addScreenPosition(-.14,-.9,-1)
addScreenPosition(-.03,-.9,-1)
addScreenPosition(.08,-.9,-1)
addScreenPosition(.26,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 17 GAME PLAY SCREEN - 7 CARDS
addScreenPosition(-.42,-.9,-1) ; Hand Begin
addScreenPosition(-.30,-.9,-1)
addScreenPosition(-.2,-.9,-1)
addScreenPosition(-.1,-.9,-1)
addScreenPosition(.01,-.9,-1)
addScreenPosition(.12,-.9,-1)
addScreenPosition(.33,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 18 GAME PLAY SCREEN - 8 CARDS
addScreenPosition(-.9,-.9,-1) ; Hand Begin
addScreenPosition(-.34,-.9,-1)
addScreenPosition(-.24,-.9,-1)
addScreenPosition(-.14,-.9,-1)
addScreenPosition(-.5,-.9,-1)
addScreenPosition(.5,-.9,-1)
addScreenPosition(.14,-.9,-1)
addScreenPosition(.28,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 19 GAME PLAY SCREEN - 9 CARDS
addScreenPosition(-.45,-.9,-1) ; Hand Begin
addScreenPosition(-.35,-.9,-1)
addScreenPosition(-.26,-.9,-1)
addScreenPosition(-.18,-.9,-1)
addScreenPosition(-.1,-.9,-1)
addScreenPosition(-.02,-.9,-1)
addScreenPosition(.06,-.9,-1)
addScreenPosition(.15,-.9,-1)
addScreenPosition(.3,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()

; 20 GAME PLAY SCREEN - 10 CARDS
addScreenPosition(-.47,-.9,-1) ; Hand Begin
addScreenPosition(-.37,-.9,-1)
addScreenPosition(-.29,-.9,-1)
addScreenPosition(-.22,-.9,-1)
addScreenPosition(-.14,-.9,-1)
addScreenPosition(-.07,-.9,-1)
addScreenPosition(0,-.9,-1)
addScreenPosition(.08,-.9,-1)
addScreenPosition(.16,-.9,-1)
addScreenPosition(.31,-.9,-1) ; Hand End
addScreenPosition(.84,.1,9) ; End Turn
addScreenPosition(0,.54,-1) ; Enemy Portrait
addScreenPosition(0,-.54,-1) ; Player Portrait
addScreenPosition(.22,-.54,-1) ; Player Ability
completeScreen()