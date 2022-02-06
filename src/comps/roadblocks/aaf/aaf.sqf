/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _include = "IncludeAaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\aaf\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\aaf\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\aaf\light.sqf"];

Escape_Roadblocks set [AAF_KEY, _dict];
