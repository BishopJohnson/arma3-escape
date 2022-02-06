/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _include = "IncludeIranian" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\csat\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\csat\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\csat\light.sqf"];

Escape_Roadblocks set [CSAT_KEY, _dict];
