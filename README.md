# ko-hearthstone
An attempt to make Hearthstone playable with keyboard only.

---

## Try it out

### Prerequisites
* MS Windows
* [Install AutoHotKey](http://www.autohotkey.com/)
* [Install Hearthstone](https://us.battle.net/account/download/)
* MUST have the Shortcut in your Start Menu  - C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Hearthstone\Hearthstone
* Download ko-hearthstone.ahk or clone this repository

---

### Running
1. Download/install all prerequisites
2. Run ko-hearthstone.ahk

---

### Commands
* Tab: Next item
* Shift+Tab: Previous item
* Space or Enter: Click
* Shift+Space: Right-click
* q: Exit

---

## Special Thanks
The following individuals have helped me indirectly or directly in the development of this game. This project would not have been possible without their support.
* Rebecky Carpenter
* Neelima Premsankar
* Eric Tschetter
* Rob

---

## Progress

### Donate!
Donations are always welcome. =)
[![Donate via PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=QGZEM4MF9P6NU&lc=US&item_name=KO%2dHearthstone&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted)

---

### Blockers:
* Time to work on this

---

### To Doing:
* Creating a list of positions for Main Menu
* Creating lists of positions for other views

---

### To Do:
* Tediously create position information for all views
* Change inputs to go specifically to Hearthstone and not to any other program
* Separate script to automate as much of the installation process as possible
* Make code cleaner
* Need to reget the resolution and reset the position values if the user changes the screen resolution
* Make sure Hearthstone window doesn't overlap with taskbar

---

### To Done:
#### v.03 - The Orcs are approaching!
* Account for differences in position between fullscreen/windowed mode
* Separated screen initialization from main script
* Added track previous screen position tracking
* Added "loading" functionality to prevent the user from getting ahead of ko-hearthstone
* Added an assert function for asserting


#### v.02 - Ready to Work
A lot of stuff added.
* System for creating "tab order" set up
* Proof of concept positions for Main Menu and Play screens created
* Basic controls implemented

#### v.01 - Proof of Concept
* The script opens (and then closes) Hearthstone whether or not Battle.net is open or not.