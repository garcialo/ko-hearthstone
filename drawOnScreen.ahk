#SingleInstance ignore
CoordMode, Mouse, Screen


Process, Exist
pid_this := ErrorLevel

hdc_screen := DllCall( "GetDC", "uint", 0 )

hdc_buffer := DllCall( "CreateCompatibleDC", "uint", hdc_screen )
hbm_buffer := DllCall( "CreateCompatibleBitmap", "uint", hdc_screen, "int", A_ScreenWidth, "int", A_ScreenHeight )
DllCall( "SelectObject", "uint", hdc_buffer, "uint", hbm_buffer )

DllCall( "BitBlt", "uint", hdc_buffer, "int", 0, "int", 0, "int", A_ScreenWidth, "int", A_ScreenHeight, "uint", hdc_screen, "int", 0, "int", 0, "uint", 0x00CC0020 )

Gui, +AlwaysOnTop -Caption
Gui, Show, x0 y0 w%A_ScreenWidth% h%A_ScreenHeight%

WinGet, hw_canvas, ID, ahk_class AutoHotkeyGUI ahk_pid %pid_this%

hdc_canvas := DllCall( "GetDC", "uint", hw_canvas )

DllCall( "BitBlt", "uint", hdc_canvas, "int", 0, "int", 0, "int", A_ScreenWidth, "int", A_ScreenHeight, "uint", hdc_buffer, "int", 0, "int", 0, "uint", 0x00CC0020 )

mode_draw := true
Tooltip, DRAWING, 110,5

WM_MOUSEMOVE = 0x0200
OnMessage( WM_MOUSEMOVE, "HandleMessage" )
return

HandleMessage( p_w, p_l )
{
	global	mode_draw, hdc_canvas, hdc_buffer

	x := p_l & 0xFFFF
	y := p_l >> 16

	if ( mode_draw )
		color = 0xFF

	else
		color := DllCall( "GetPixel", "uint", hdc_buffer, "int", x, "int", y )

	x1 := x-1
	x2 := x
	x3 := x+1
	y1 := y-1
	y2 := y
	y3 := y+1
	
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x1, "int", y1, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x2, "int", y1, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x3, "int", y1, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x1, "int", y2, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x2, "int", y2, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x3, "int", y2, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x1, "int", y3, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x2, "int", y3, "uint", color )
	DllCall( "SetPixel", "uint", hdc_canvas, "int", x3, "int", y3, "uint", color )
}

F1::
	mode_draw := !mode_draw
	if (mode_draw)
	{
		Tooltip, DRAWING, 110,5
	}
	else
	{
		Tooltip, NOT DRAWING, 110,5 
	}
return

F2::
	DllCall( "BitBlt", "uint", hdc_canvas, "int", 0, "int", 0, "int", A_ScreenWidth, "int", A_ScreenHeight, "uint", hdc_buffer, "int", 0, "int", 0, "uint", 0x00CC0020 )
return

F12::
	Tooltip
	ExitApp