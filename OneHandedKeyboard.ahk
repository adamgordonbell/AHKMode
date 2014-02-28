#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Recommended for catching common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Toggle := False

$Space::
  KeyWait, Space, T0.15 ; Adjust this value to control the delay before switching modes
  If ErrorLevel
    Toggle := True
  Else
    Send {Space}
  Return

#If Toggle

Space UP::Toggle := False

q::p
w::o
e::i
r::u
t::y
a::`;
s::l
d::k
f::j
g::h
z::/
x::.
c::,
v::m
b::n

y::t
u::r
i::e
o::w
p::q
h::g
j::f
k::d
l::s
`;::a
n::b
m::v
,::c
.::x
/::z

#If