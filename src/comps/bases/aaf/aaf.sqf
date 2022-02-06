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
_dict set ["COMMS", compile preprocessFile "src\comps\bases\aaf\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\aaf\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\aaf\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\aaf\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\aaf\mortar.sqf"];
_dict set ["UAV", compile preprocessFile "src\comps\bases\aaf\uav.sqf"];

Escape_Bases set [AAF_KEY, _dict];
