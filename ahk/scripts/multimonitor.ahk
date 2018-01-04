#Include utils.ahk

Gui +LastFound
hWnd := WinExist()

ShellMessage( wParam,lParam ) {
	If ( wParam = 1 )
	{
		WinGetPos, w1x, w1y,winWidth,winHeight, ahk_id %lParam%
		activeMonitorInfo(X, Y, Width, Height)
		WinMove, ahk_id %lParam%,, ((Y+Width/2)-(winWidth/2)),((X+Height/2)-(winHeight/2)),,
	}
	return
}

DllCall( "RegisterShellHookWindow", UInt,hWnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
return