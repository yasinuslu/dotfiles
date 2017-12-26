#Include utils.ahk

DetectHiddenWindows, On
HyperWindow = ahk_exe Hyper.exe
HyperTitle = Hyper
HyperExe = "C:\Users\Alperen\AppData\Local\hyper\Hyper.exe"

ToggleHyper() 
{
	global HyperWindow
	global HyperTitle
	
	if WinExist(HyperWindow)
	{
		if WinVisible(HyperTitle)
		{
			HideHyper()
		}
		else
		{
			ShowHyper()
		}
	}
	else 
	{
		RunHyper()
		ShowHyper()
		HideFromAltTab()
	}

}

RunHyper()
{
	global HyperExe

	OutputDebug, %HyperExe%
	RunWait, %HyperExe%
	OutputDebug, Started hyper
}

ShowHyper()
{
	global HyperWindow
	MoveHyper()
	WinShow, %HyperWindow%
	WinActivate, %HyperWindow%
}

HideHyper()
{
	global HyperWindow
	WinHide, %HyperWindow%
}

MoveHyper()
{
	global HyperWindow
	activeMonitorInfo(X, Y, Width, Height)
	WinMove, %HyperWindow%,, %Y%, %X%, %Width%, (Height*0.46)
}

HideFromAltTab()
{
	global HyperTitle
	Winget, id, id, %HyperTitle%
	WinSet, ExStyle, ^0x80, ahk_id %id%  ; Toggle the WS_EX_TOOLWINDOW attribute, which removes/adds the window from the alt-tab list.
	Winset, AlwaysOnTop, On, ahk_id %id%
	Winset, Trans, 235, ahk_id %id%
	
	OutputDebug, "id" %id%
}


^`::
ToggleHyper()
return