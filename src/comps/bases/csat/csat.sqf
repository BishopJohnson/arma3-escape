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
_dict set ["COMMS", compile preprocessFile "src\comps\bases\csat\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\csat\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\csat\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\csat\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\csat\mortar.sqf"];
_dict set ["UAV", compile preprocessFile "src\comps\bases\csat\uav.sqf"];

Escape_Bases set [CSAT_KEY, _dict];
