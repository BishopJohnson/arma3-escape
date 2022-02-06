/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _include = "IncludeUsArmy" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\usArmy\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\usArmy\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\usArmy\light.sqf"];

Escape_Roadblocks set [US_ARMY_KEY, _dict];