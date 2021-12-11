/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_pos"];

if (!isServer) exitWith {};

private _side = west;

private _vehEntry = [_side, NATO_KEY] call compile preprocessFile "src\fnc\units\getVehicleEntryFromDict.sqf";
if (isNil "_vehEntry") exitWith {};

private _veh = selectRandom (_vehEntry select 0);
private _variant = _vehEntry select 1;
private _loadout = _vehEntry select 2;

if (typeName _variant == "Array") then
{
    _variant = [selectRandom _variant, 1];
};

if (typeName _loadout == "Array") then
{
    _loadout = selectRandom _loadout;
};

private _vehGroup = [_pos, random 360, _veh, _side] call BIS_fnc_spawnVehicle;
[_vehGroup select 0, _variant, _loadout] call BIS_fnc_initVehicle;

{
    switch (typeOf _x) do
    {
        case "B_Soldier_F";
        case "B_T_Soldier_F";
        case "B_W_Soldier_F":
        {
            [_x] execVM "src\lists\units\nato\rifleman.sqf";
        };
        case "B_Crew_F";
        case "B_T_Crew_F";
        case "B_W_Crew_F":
        {
            [_x] execVM "src\lists\units\nato\crewman.sqf";
        };
        default
        {
            // TODO: Log unhandled unit type.
        };
    };
} forEach (_vehGroup select 1);

_vehGroup
