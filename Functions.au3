#include <WinAPI.au3>
#include <Windowsconstants.au3> ; Khai báo các hằng $WM_ ... bằng cách include thư viện
#include <VirtualKey.au3>    ; Thu vien nguoi dung

;$myhwnd = ControlGetHandle("[CLASS:SciTEWindow]","", "[CLASS:Scintilla]")
;_Send($myhwnd, "Alo")

Func _Click($hwnd, $x=0,$y=0,$button='Left Click')

	Const $MK_LBUTTON = 0x1
	Const $MK_MBUTTON = 0x10
	Const $MK_RBUTTON = 0x2  ; Khai báo các giá trị hằng

	$lParam = ($y * 65536) + ($x)

    Switch $button
        Case $button='Left Click'
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONDOWN, $MK_LBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONUP, 0,$lParam)
        Case $button='Left Double Click'
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONDOWN, $MK_LBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONUP, 0,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONDBLCLK, $MK_LBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_LBUTTONUP, 0,$lParam)
        Case $button='Middle Click'
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONDOWN, $MK_MBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONUP, 0,$lParam)
        Case $button='Middle Double Click'
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONDOWN, $MK_MBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONUP, 0,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONDBLCLK, $MK_MBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_MBUTTONUP, 0,$lParam)
        Case $button='Right Click'
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONDOWN, $MK_RBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONUP, 0,$lParam)
        Case $button='Right Double Click'
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONDOWN, $MK_RBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONUP, 0,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONDBLCLK, $MK_RBUTTON,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_RBUTTONUP, 0,$lParam)
        Case $button='Mouse Move'
            _WinAPI_PostMessage($hwnd, $WM_MOUSEMOVE, 0,$lParam)
            _WinAPI_PostMessage($hwnd, $WM_MOUSEMOVE, 0,$lParam)
    EndSwitch
EndFunc



Func _Send($whnd, $text)
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
		_WinAPI_PostMessage($whnd, 0x100, Eval( "VK_" & StringUpper($sendnow)), 0) ;keydown
		Sleep(10)   ; time nhan key xuong
;_WinAPI_PostMessage($whandle, 0x101, Eval( "VK_" & StringUpper($sendnow)), 0 ) ;keyup
		Next
EndFunc

