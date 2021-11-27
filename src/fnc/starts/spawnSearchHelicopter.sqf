/*
	Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
*/

#define MAX_SPAWN_DISTANCE 1500
#define MIN_SPAWN_DISTANCE 1000

params ["_side"];

private ["_startLoc", "_position", "_veh", "_group", "_wp"];

if (!isServer) exitWith {};

sleep 120; // Wait 2 minutes before spawning helicopter

_startLoc = ([COMPOSITIONS, START_KEY] call DICT_fnc_get) select 0;

_position =
[
    [[_startLoc, MAX_SPAWN_DISTANCE]],
	[[_startLoc, MIN_SPAWN_DISTANCE]]
] call BIS_fnc_randomPos;

if (typename _side != "SIDE") then
{
	switch (_side) do
	{
		case "WEST": { _side = west; };
		case "EAST": { _side = east; };
		case "GUER": { _side = independent; };
	};
};

// Spawns vehicle with crew
_veh =
[
	_position,
	random 360,
	[_side, "HeliLight"] call compile preprocessFile "src\fnc\patrols\air\airVehicles.sqf",
	_side
] call BIS_fnc_spawnVehicle;

_group = _veh select 2;

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
