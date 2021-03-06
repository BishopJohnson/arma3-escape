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
call compile preprocessFile "src\lists\units\csat\csat.sqf";
call compile preprocessFile "src\lists\units\aaf\aaf.sqf";
call compile preprocessFile "src\lists\units\csatP\csatP.sqf";
call compile preprocessFile "src\lists\units\spetsnaz\spetsnaz.sqf";
call compile preprocessFile "src\lists\units\ldf\ldf.sqf";
