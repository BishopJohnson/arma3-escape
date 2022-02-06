/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _dict = createHashMap;
_dict set ["COMMS", compile preprocessFile "src\comps\bases\ru\comms.sqf"];
_dict set ["HVEHICLE", compile preprocessFile "src\comps\bases\ru\hvehicle.sqf"];
_dict set ["LVEHICLE", compile preprocessFile "src\comps\bases\ru\lvehicle.sqf"];
_dict set ["AMMO", compile preprocessFile "src\comps\bases\ru\ammo.sqf"];
_dict set ["MORTAR", compile preprocessFile "src\comps\bases\ru\mortar.sqf"];

Escape_Bases set [RU_KEY, _dict];
