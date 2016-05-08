#Include <WinAPI.au3>
#include "VirtualKey.au3"


$timeKeyDown = 10

$title = ControlGetHandle("Untitled - Notepad","", "[CLASS:Edit]")
;MsgBox(0,"",$title)

_Send($title, "Hello")

Func _Send( $whandle, $text)
If $text = "" Then Return
Local $l, $l2, $len=StringLen($text), $sendnow
For $l=1 To $len
$sendnow = StringMid($text,$l,1)
If $sendnow="{" Then
$sendnow = ""
While 1
$l += 1
$l2 = StringMid( $text,$l,1)
If $l2="}" Or $l>$len Then ExitLoop
$sendnow &= $l2
WEnd
EndIf
_WinAPI_PostMessage($whandle, 0x100, Eval( "VK_" & StringUpper($sendnow)), 0) ;keydown
Sleep( $timeKeyDown)
;_WinAPI_PostMessage($whandle, 0x101, Eval( "VK_" & StringUpper($sendnow)), 0 ) ;keyup
Next
EndFunc
