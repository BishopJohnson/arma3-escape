/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _include = "IncludeCdf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\cdf\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\cdf\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\cdf\light.sqf"];

Escape_Roadblocks set [CDF_KEY, _dict];
