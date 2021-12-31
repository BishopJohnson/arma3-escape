/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

Escape_Units = createHashMap;
Escape_Units set [str west, createHashMap];
Escape_Units set [str east, createHashMap];
Escape_Units set [str independent, createHashMap];

call compile preprocessFile "src\lists\units\nato\nato.sqf";
