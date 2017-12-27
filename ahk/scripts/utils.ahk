WinVisible(WinTitle)
{
	WinGet, Style, Style, %WinTitle%
	Transform, Result, BitAnd, %Style%, 0x10000000 ; 0x10000000 is WS_VISIBLE.
	if Result <> 0 ;Window is Visible
		Return 1
	Else  ;Window is Hidden
		Return 0
}

activeMonitorInfo( ByRef X, ByRef Y, ByRef Width,  ByRef  Height  )
{ ; retrieves the size of the monitor, the mouse is on

	CoordMode, Mouse, Screen
	MouseGetPos, mouseX , mouseY
	SysGet, monCount, MonitorCount
	Loop %monCount%
    { 	SysGet, curMon, Monitor, %a_index%
        if ( mouseX >= curMonLeft and mouseX <= curMonRight and mouseY >= curMonTop and mouseY <= curMonBottom )
            {
				X      := curMonTop
				y      := curMonLeft
				Height := curMonBottom - curMonTop
				Width  := curMonRight  - curMonLeft
				OutputDebug,  %X%   %Y%   %Width%   %Height%
				return
			}
    }
}

activateWindowUnderMouse()
{
	MouseGetPos,,, OutputVarWin
	WinActivate, ahk_id %OutputVarWin%
}