obK2S := { "Esc": "sc01", 1: "sc02", 2: "sc03", 3: "sc04", 4: "sc05", 5: "sc06", 6: "sc07", 7: "sc08", 8: "sc09", "q": "sc010", "w": "sc011", "e": "sc012", "r": "sc013", "t": "sc014", "y": "sc015", "u": "sc016", "i": "sc017", "o": "sc018", "p": "sc019", "d": "sc020", "f": "sc021", "g": "sc022", "h": "sc023", "j": "sc024", "k": "sc025", "l": "sc026", ";": "sc027", "'": "sc028", "``": "sc029", "b": "sc030", "n": "sc031", "m": "sc032", "`,": "sc033", ".": "sc034", "/": "sc035", "RShift": "sc036", "NumpadMult": "sc037", "LAlt": "sc038", "Space": "sc039", "F6": "sc040", "F7": "sc041", "F8": "sc042", "F9": "sc043", "F10": "sc044", "NumLock": "sc045", "ScrollLock": "sc046", "Numpad7": "sc047", "Numpad8": "sc048", "Numpad9": "sc049", "Numpad2": "sc050", "Numpad3": "sc051", "Numpad0": "sc052", "NumpadDot": "sc053", "F11": "sc057", "F12": "sc058", 9: "sc00A", 0: "sc00B", "-": "sc00C", "=": "sc00D", "Backspace": "sc00E", "Tab": "sc00F", "[": "sc01A", "]": "sc01B", "Enter": "sc01C", "LControl": "sc01D", "a": "sc01E", "s": "sc01F", "LShift": "sc02A", "\": "sc02B", "z": "sc02C", "x": "sc02D", "c": "sc02E", "v": "sc02F", "CapsLock": "sc03a", "F1": "sc03B", "F2": "sc03C", "F3": "sc03D", "F4": "sc03E", "F5": "sc03F", "NumpadSub": "sc04A", "Numpad4": "sc04B", "Numpad5": "sc04C", "Numpad6": "sc04D", "NumpadAdd": "sc04E", "Numpad1": "sc04F" }

obM := { 1: "-", 2: 0, 3: 9, 4: 8, 5: 7, 7: 5, 8: 4, "q": "p", "w": "o", "e": "i", "r": "u", "t": "y", "y": "t", "u": "r", "i": "e", "o": "w", "p": "q", "d": "k", "f": "j", "g": "h", "h": "g", "j": "f", "k": "d", "l": "s", ";": "a", "'": "``", "b": "n", "n": "b", "m": "v", "`,": "c", ".": "x", "/": "z", 9: 3, 0: 2, "-": 1, "a": ";", "s": "l", "z": "/", "x": "." , "v": "m", "c": "`,", "``": "=", "F1": "[", "F2": "]", "TAB": "`\", "[": "TAB", "6": "6"}

g_sp := 0, g_cm := 0, g_ch := "", g_ch2 := ""
tickTime := Object()

for k, i in obK2S
	obK2S[k] := "{" . i . "}"

for k, i in obM
{
	obM[k] :=  obK2S[i]
	Hotkey %k%, KeyDown1
	Hotkey %k% UP, KeyUp1
}

!space::
^space::
	g_cm := 1
	Send {blind}{space}
return

*space::
	Send % obK2S[g_ch]
	g_cm := 0, g_sp := 1, g_ch := ""
return

space up::
	if g_cm
	{
		send, % obM[g_ch]
		g_ch := ""
	}
	else
		send, {space}	
	g_sp := 0
return
   
KeyDown1:
	if ! tickTime[a_thishotkey]
		tickTime[ g_ch <> "" ? ( g_ch2 := a_thishotkey ) : ( g_ch := a_thishotkey ) ] := A_TickCount
return

KeyUp1:
	Send % ( A_tickCount - tickTime[g_ch] > 290 ) ? "+" . ( g_sp ? obM[g_ch] : obK2S[g_ch] ) : ( g_sp ? obM[g_ch] : obK2S[g_ch] ) 
	tickTime[SubStr(a_thishotkey,1,strlen(a_thishotkey)-3)] := 0, g_cm := g_ch <> "" ? g_sp : 0, g_ch := g_ch2, g_ch2 := ""
return