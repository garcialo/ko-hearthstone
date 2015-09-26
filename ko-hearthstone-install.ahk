MsgBox, Running
UrlDownloadToFile, http://www.battle.net/download/getInstallerForGame?os=win&locale=enUS&version=LIVE&gameProgram=BATTLENET_APP, C:\battleinstaller.exe
; check http://www.autohotkey.com/board/topic/85524-help-with-urldownloadtofile/

if ErrorLevel
	MsgBox, Didn't work
else
	MsgBox, Did Work
; Run C:\battleinstaller.exe