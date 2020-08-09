#SingleInstance force
#NoTrayIcon

;**********
;Auto Hot Key shortcuts by Mubashir Younus Lakhana
;This file includes a bunch of shortcuts for everyday tasks.
;Simply adjust the variables and add the file in "shell:startup" to run at Startup
;Last Updated on: May 21, 2020
;Enjoy!
;**********


;To hide icon
;#NoTrayIcon


;****************************************
;VARIABLES
;Change the values in these variables.

;Slots for CapsLock & (1-9)
slot1 = mubashirlakhana@gmail.com
slot2 = 
slot3 = mylakhana
slot4 = Mubashir Younus Lakhana
slot5 = powershell
slot6 = cd E:\Android\flutter_projects
slot7 = git pull
slot8 = flutter emulators --launch Pixel2
slot9 = netsh wlan show profile "WifiNameHere" key=clear | findstr "Key Content"

;Paths for Folders
myComp = "C:\myruncommands\pc.lnk"
screenshots := "C:\Users\Mubie\Pictures\Screenshots"
Downloads = "C:\Users\Mubie\Downloads"
DownloadsD = "D:\"
FavFolder1 = D:\A6000 ;changed to Capslock+c
FavFolder2 = D:\Torrents ;;changed to Capslock+j
FavFolder3 = D:\Videos\Movies
FavFolder4 = D:\Videos\TV Series
FavFolder5 = 
;You can change FavFolder shortcuts from the code if you want

;****************************************

/*
These are the shortcuts included in this script

RightCtrl+[Space]:			Toggle for [Active window always on top]
Trackpad two-fingers-
double-tap:				Middle Mouse Click
Middle Mouse Click-
in Explorer:				Works as a back button (Alt Up)
Pause/Break:				Middle Mouse Click
CapsLock+z:					Middle Mouse Click
Winkey+z:					Takes screenshot and asks to categorize it
Winkey+v:					Input box to search google
Winkey+Delete:  			Empty Recycle Bin
Winkey+`: 					Minimize current window
CapsLock+i: 				Shows how many ahk scripts are currently running

;Requires setting variable data in this file
CapsLock+(1-9): [Saved Texts]

;Requires adding path to respective folders/files
Winkey+c:				Opens 'My Computer'
Winkey+s:				Opens 'Screenshots'
Winkey+j: 				Opens 'Downloads'
Capslock+a:				Opens 'FavFolder1'
Capslock+s:				Opens 'FavFolder2'
Capslock+d:				Opens 'FavFolder3'
Capslock+f:				Opens 'FavFolder4'
Capslock+g:				Opens 'FavFolder5'

*/


;*******************************************
;CODING BEGINS HERE
;*******************************************

;A function to Display text on centre of the screen Simply call this function whenever you want to display any text
DisplayText(text, sec)
{
   Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
   ;Gui, Margin, %xpos%, %ypos%
   Gui, Color, aaaacc ;changes background color
   Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
WinSet, TransColor, aaaacc
   ;Gui, Font, 080c69 s20, Consolas
   Gui, Font, 080c69 s25, Ink Free
   Gui, Add, Text, x0 y0, %text% ;the text to display
   Gui, Show, NoActivate, Xn: 0, Yn: 0

   sleep, %sec%
   Gui, Destroy
}
return

;pin the current active window to remain on top of other windows
>^SPACE::
Winset, Alwaysontop, toggle,  A
DisplayText("Window Always On Top Toggled", 800)

;Trackpad two-fingers double-tap for Middle Mouse Click
~RButton::
If (A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < 500)
{
Click middle
}

return

; middle mouse button - up a folder in explorer
#IfWinActive, ahk_class CabinetWClass
~MButton::Send !{Up} 
#IfWinActive

Pause::MouseClick, Middle

CapsLock & z::MouseClick, Middle

#z:: 
Send #{PrintScreen}

;Shows InputBox that asks for Category, then moves the latest screenshot to that category
sleep 800
;Ideally keep it more than 1 sec just in case...should work even on slow computers

;Clearing All Variables
FolderList :=
Folder_Dest :=
File =
Time_ToCheck =
Time_latestFile =
ScreenshotMoveStatus =

Folder_Source := screenshots

;To get folder names starting with "Screenshots." in %Folder_Source%
Loop Files, %Folder_Source%\*, D
{
     IfInString, A_LoopFileName, Screenshots.
     {
          StringTrimLeft, Trimmed, A_LoopFileName, 12 ;Trims the text "Screenshots."
          FolderList = %Trimmed%, %FolderList%
     }
     else
     {
          Sleep, 1
     }
}

StringTrimRight, FolderList, FolderList, 1 ;Trims the comma from the end

;To get latest file name
Loop Files, %Folder_Source%\*.png
{
     FileGetTime, Time_ToCheck, %A_LoopFileFullPath%, M
     If (Time_ToCheck > Time_latestFile)
     {
          Time_latestFile := Time_ToCheck
          File := A_LoopFileName
     }
}
;StringTrimRight, Time_latestFile, Time_latestFile, 2
;Trims miniseconds...if enabled, cannot create more than 1 screenshots within a minute

;Input box
InputBox,Folder_Dest,Captured Screenshot: %File%,Add it to a category:`n%FolderList%

Folder_Dest = Screenshots.%Folder_Dest% ;adds "Screenshots." in the beginning of folder name
If (Folder_Dest= "Screenshots.")
{
	Folder_Dest = %Folder_Dest%Uncategorized
	ScreenshotMoveStatus = Added to Uncategorized Items
}
Else
{
	ScreenshotMoveStatus = DONE
}
Sleep, 200
FileCreateDir, %Folder_Source%\%Folder_Dest%
FileMove, %Folder_Source%\%File%, %Folder_Source%\%Folder_Dest%\%Time_latestFile%2.png
DisplayText(ScreenshotMoveStatus, 800)

Return



;Winkey v to search Google using default browser
#v::
  InputBox,SearchVar,Google Search,Enter String for Google to Find
  If (ErrorLevel)
    return
  ;MsgBox I would search Google for %SearchVar%
  Run, http://www.google.com/search?q=%SearchVar%
  return


#Del::
FileRecycleEmpty
DisplayText("Trash Thrown Away!", 2200)
return

#`::WinMinimize,A


;Shows number of scripts currently running
CapsLock & i::
DetectHiddenWindows On
WinGet, ID, List, ahk_class AutoHotkey
Loop, %id%  ; For each AutoHotkey script (normal or compiled):
{
	RunningScripts = %id% scripts running
}
DisplayText(RunningScripts, 800)
return


CapsLock & 1:: SendInput, %slot1%
CapsLock & 2:: SendInput, %slot2%
CapsLock & 3:: SendInput, %slot3%
CapsLock & 4:: SendInput, %slot4%
CapsLock & 5:: SendInput, %slot5%
CapsLock & 6:: SendInput, %slot6%
CapsLock & 7:: SendInput, %slot7%
CapsLock & 8:: SendInput, %slot8%
CapsLock & 9:: SendInput, %slot9%

#c::
Run, %myComp%, , max
return

#s::
Run, %screenshots%, , max
return

#j::
Run, %Downloads%, , max
return

;********************
;FavFolders
;********************

CapsLock & c:: ;changed to c from a
Run, %FavFolder1%, , max
return

CapsLock & j:: ;changed to j from s
Run, %FavFolder2%, , max
return

CapsLock & m:: ;changed to m from d
Run, %FavFolder3%, , max
return

CapsLock & t::
Run, %FavFolder4%, , max
return

CapsLock & g::
Run, %FavFolder5%, , max
return

;ADDED FOR HP ELITE DRAGONFLY
;NO RIGHT-CLICK BUTTON SO ADDED FUNCTIONALITY IN RALT+,
RAlt & ,::
MouseClick, Right
return

;NO PAUSE/BREAK BUTTON SO ADDED FUNCTIONALITY OF OPENING SYSTEM PROPERTIES BY WIN+BACKSPACE
LWin & BS::
Run, control /name microsoft.system
return