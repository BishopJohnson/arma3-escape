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
_dict set ["COMMS", compile preprocessFile "src\comps\bases\cdf\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\cdf\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\cdf\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\cdf\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\cdf\mortar.sqf"];

Escape_Bases set [CDF_KEY, _dict];
