/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _dict = createHashMap;
_dict set ["HEAVY", compile preprocessFile "src\comps\roadblocks\nato\heavy.sqf"];
_dict set ["MEDIUM", compile preprocessFile "src\comps\roadblocks\nato\medium.sqf"];
_dict set ["LIGHT", compile preprocessFile "src\comps\roadblocks\nato\light.sqf"];

Escape_Roadblocks set [NATO_KEY, _dict];
