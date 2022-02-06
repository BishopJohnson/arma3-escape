/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\ru\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\ru\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\ru\light.sqf"];

Escape_Roadblocks set [RU_KEY, _dict];
