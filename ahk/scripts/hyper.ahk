#Include utils.ahk

DetectHiddenWindows, On
HyperWindow = ahk_exe Hyper.exe
HyperTitle = Hyper
HyperExe = "%USERPROFILE%\AppData\Local\hyper\Hyper.exe"

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
		ModifyHyperWindow()
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
	activateWindowUnderMouse()
}

MoveHyper()
{
	global HyperWindow

	activeMonitorInfo(X, Y, Width, Height)
	WinMove, %HyperWindow%,, %Y%, %X%, %Width%, (Height*0.46)
}

ModifyHyperWindow()
{
	global HyperTitle

	Winget, id, id, %HyperTitle%
	WinSet, ExStyle, ^0x80, ahk_id %id%
	Winset, AlwaysOnTop, On, ahk_id %id%

	if % substr(A_OSVERSION, 1, 2) = 10
	{
		Winset, Trans, 235, ahk_id %id%
	}

	OutputDebug, "id" %id%
}


^`::
ToggleHyper()
return