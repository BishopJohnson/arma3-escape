/*
	Author:
	    Bishop Johnson

	Parameter(s):
	    Side -
*/

#include "..\..\..\define.hpp"

#define MAX_SPAWN_DISTANCE 1500
#define MIN_SPAWN_DISTANCE 1000

params ["_faction"];

if (!isServer) exitWith {};

private _side = [_faction] call Escape_fnc_GetFactionSide;

private _startLoc = ([COMPOSITIONS, START_KEY] call DICT_fnc_get) select 0;
private _position =
[
    [[_startLoc, MAX_SPAWN_DISTANCE]],
	[[_startLoc, MIN_SPAWN_DISTANCE]]
] call BIS_fnc_randomPos;

private "_sideStr";
if (typeName _side != "SIDE") then
{
	switch (_side) do
	{
		case "WEST": { _side = west; };
		case "EAST": { _side = east; };
		case "GUER": { _side = independent; };
	};
};

private _vehEntry =
[
    _side,
    _faction,
    [RAND_VEH_HELI_L_KEY, 1]
] call compile preprocessFile "src\fnc\units\getAirVehicleEntryFromDict.sqf";

private _veh = _vehEntry select 0;
while { typeName _veh == "Array" } do
{
    _veh = selectRandom _veh;
};

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

private _vehGroup = [_position, random 360, _veh, _side] call BIS_fnc_spawnVehicle;
if (isNil "_vehGroup") exitWith { hint "_vehGroup is nil." };

[_vehGroup select 0, _variant, _loadout] call BIS_fnc_initVehicle;
[_vehGroup select 1, _side, _faction] execVM "src\fnc\loadouts\setCrewLoadout.sqf";

private _group = _vehGroup select 2;

_group setBehaviour "AWARE";
_group setSpeedMode "NORMAL"; // TODO: Set speed to fast.
_group deleteGroupWhenEmpty true;
_group enableDynamicSimulation false; // Not affected by dynamic simulation

{
	_x setSkill ["spotDistance", 1];
	_x setSkill ["spotTime", 1];
	_x triggerDynamicSimulation false;
} forEach units _group;

_group addWaypoint [_startLoc, 0]; // First waypoint to get to area
_group addWaypoint [_startLoc, 0] setWaypointType "SAD";
