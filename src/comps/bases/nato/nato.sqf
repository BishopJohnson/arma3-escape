/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _dict = createHashMap;
_dict set ["COMMS", compile preprocessFile "src\comps\bases\nato\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\nato\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\nato\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\nato\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\nato\mortar.sqf"];
_dict set ["UAV", compile preprocessFile "src\comps\bases\nato\uav.sqf"];

Escape_Bases set [NATO_KEY, _dict];
