# ko-hearthstone
An attempt to make Hearthstone playable with keyboard only.

## Try it out

### Prerequisites
* MS Windows
* [Install AutoHotKey](http://www.autohotkey.com/)
* [Install Hearthstone](https://us.battle.net/account/download/)
* MUST have the Shortcut in your Start Menu  - C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Hearthstone\Hearthstone

### Commands
* Tab: Next item
* Shift+Tab: Previous item
* Space or Enter: Activate Item
* Shift+Space or Shift+Enter: Grab/release card
* q: Exit

## Progress

### To Doing:
* Creating a list of positions for Main Menu
* Creating lists of positions for other views

### To Do:
* Tediously create position information for all views
* Change inputs to go specifically to Hearthstone and not to any other program
* Separate script to automate as much of the installation process as possible
* Account for differences in position between fullscreen/windowed mode
* Make code cleaner

### To Done:
#### v.02 - Ready to Work
A lot of stuff added.
* System for creating "tab order" set up
* Proof of concept positions for Main Menu and Play screens created
* Basic controls implemented

#### v.01 - Proof of Concept
* The script opens (and then closes) Hearthstone whether or not Battle.net is open or not.
