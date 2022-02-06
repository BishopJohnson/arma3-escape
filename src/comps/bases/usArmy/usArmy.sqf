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
_dict set ["COMMS", compile preprocessFile "src\comps\bases\usArmy\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\usArmy\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\usArmy\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\usArmy\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\usArmy\mortar.sqf"];

Escape_Bases set [US_ARMY_KEY, _dict];
