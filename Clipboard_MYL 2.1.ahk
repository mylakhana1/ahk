;**********
;Clipboard 2.0 by Mubashir Younus Lakhana
;NOTE: This script uses a function (DisplayText) from Miscellaneous_dynamic.ahk file.
;These both files have to be in the same directory for it to work properly.
;This clipboard allows you to copy 10 texts simultaneously.
;You can set predefined texts in the slots in this script and pressing CapsLock + (+) will store those predefined texts in their dedicated slots
;****************PRESS CapsLock+i FOR MORE INFORMATION ONCE YOU RUN THE SCRIPT****************
;Last Updated on: February 6, 2018
;Enjoy!
;**********

#include %A_ScriptDir%\Miscellaneous_dynamic.ahk
#SingleInstance force

CapsLock & h:: msgbox,64,Clipboard 2.0 by MYL,This Clipboard v2.0 is scripted by MYL :) `nIt allows you to copy 10 texts simultaneously.`nYou can set predefined texts in the slots in this script and pressing CapsLock + (+) will store those predefined texts in their dedicated slots`n`nFollowing are the shortcuts included in this script:`nCtrl + (0 - 9): To copy a text and store it in its dedicated slot. `n(Ctrl+1 to store in slot 1, Ctrl+2 to store in slot 2, so on...)`n`nAlt + (0 - 9): To paste a string from its slot.`n`nCapsLock + (-): It clears all slots and removes all copied texts.`n`nCapsLock + S: Shows current values of all slots as well as Windows' default clipboard.`n`n`nThank You for trying this app. You can reach me at fb.com/mylakhana for feedbacks and recommendations :)`nHave fun!`n`nWhat's new in  2.2:`nBecause of this script, you weren't able to use Ctrl + (1-9) shortcuts in browsers to switch to specified tabs. So this script has been updated and shortcuts are specified for Right Control buttons only. You can now use your left Ctrl + (1-9) for other shortcuts.`nMoreover, you can now temporarily suspend this script by pressing Ctrl+Alt+S

CapsLock & s:: msgbox,,Currently Copied Strings,Slot 1: %Clip1%`n`nSlot 2: %Clip2%`n`nSlot 3: %Clip3%`n`nSlot 4: %Clip4%`n`nSlot 5: %Clip5%`n`nSlot 6: %Clip6%`n`nSlot 7: %Clip7%`n`nSlot 8: %Clip8%`n`nSlot 9: %Clip9%`n`nSlot 0: %Clip0%`n`nDefault Clipboard: %ClipBoard%


CapsLock & -::
Clip1 := ""
Clip2 := ""
Clip3 := ""
Clip4 := ""
Clip5 := ""
Clip6 := ""
Clip7 := ""
Clip8 := ""
Clip9 := ""
Clip0 := ""
return

CapsLock & +::
;Clip1 := "Add your text here"
return

<^1::
Send ^c
;ClipWait
Clip1 := ClipBoard
return
!1::
ClipBoard := Clip1
Send ^v
return

<^2::
Send ^c
;ClipWait
Clip2 := ClipBoard
return
!2::
ClipBoard := Clip2
Send ^v
return

<^3::
Send ^c
;ClipWait
Clip3 := ClipBoard
return
!3::
ClipBoard := Clip3
Send ^v
return

<^4::
Send ^c
;ClipWait
Clip4 := ClipBoard
return
!4::
ClipBoard := Clip4
Send ^v
return

<^5::
Send ^c
;ClipWait
Clip5 := ClipBoard
return
!5::
ClipBoard := Clip5
Send ^v
return

<^6::
Send ^c
;ClipWait
Clip6 := ClipBoard
return
!6::
ClipBoard := Clip6
Send ^v
return

<^7::
Send ^c
;ClipWait
Clip7 := ClipBoard
return
!7::
ClipBoard := Clip7
Send ^v
return

<^8::
Send ^c
;ClipWait
Clip8 := ClipBoard
return
!8::
ClipBoard := Clip8
Send ^v
return

<^9::
Send ^c
;ClipWait
Clip9 := ClipBoard
return
!9::
ClipBoard := Clip9
Send ^v
return

<^0::
Send ^c
;ClipWait
Clip0 := ClipBoard
return
!0::
ClipBoard := Clip0
Send ^v
return

^!s::
Suspend
;ClipboardStatus = Suspended

If (A_IsSuspended)
{
	ClipboardStatus = suspended
}
Else
{
	ClipboardStatus = enabled
}
DisplayText("Clipboard "ClipboardStatus, 1000)

If (!A_IsSuspended)
{
	DisplayText("Press Capslock+H for help", 1800)
}
