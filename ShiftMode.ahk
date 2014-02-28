MsgBox This is the 1-parameter method. Commas (,) do not need to be escaped.
MsgBox, 4, , This is the 3-parameter method. Commas (,) do not need to be escaped.
MsgBox, 4, , Do you want to continue? (Press YES or NO)
IfMsgBox No
    return
MsgBox, 4, , 4-parameter method: this MsgBox will time out in 5 seconds.  Continue?, 5
IfMsgBox Timeout
    MsgBox You didn't press YES or NO within the 5-second period.
else IfMsgBox No
    return
    
; By preceding any parameter with "% ", it becomes an expression. In the following example,
; math is performed, an array element is accessed, and a function is called.  All of these
; items are concatenated via the "." operator to form a single string displayed by MsgBox:
; MsgBox % "New width for object #" . A_Index . " is: " . RestrictWidth(ObjectWidth%A_Index% * ScalingFactor)

; The following example alerts the user that a MsgBox is going to steal focus (in case the user is typing).
SplashTextOn,,, A MsgBox is about to appear.
Sleep 3000
SplashTextOff
MsgBox The backup process has completed.