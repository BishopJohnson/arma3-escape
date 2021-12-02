/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
		Side - 
		Number - 
		Number - 
	
	Returns:
	    Group - 
*/

#define START_KEY "start"

params ["_side", "_maxRadius", "_minRadius"];

if (!isServer) exitWith {};

private _size = count (call BIS_fnc_listPlayers);
private _startIdx = floor random _size;
private _wpCenter = position ((call BIS_fnc_listPlayers) select _startIdx);

// Chooses a location near a player
private _position =
[
    [[_wpCenter, _maxRadius]],
	[[_wpCenter, _minRadius]]
] call BIS_fnc_randomPos;

// Checks if location is too close to any players
private _result = true;
for [{ private _i = _startIdx + 1 }, { _i mod _size != _startIdx }, { _i = _i + 1 }] do
{
    if (_position inArea [(call BIS_fnc_listPlayers) select (_i mod _size), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

private _group = grpNull;
if (_result) then
{
	// Spawns vehicle with crew
	private _veh =
	[
		_position,
		random 360,
		[_side, nil, true] call compile preprocessFile "src\fnc\patrols\air\airVehicles.sqf",
		_side
	] call BIS_fnc_spawnVehicle;

	_group = _veh select 2;

	_group setBehaviour "AWARE";
	_group setSpeedMode "NORMAL";
	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation false; // Not affected by dynamic simulation
	addToRemainsCollector units _group;

	{
		_x setSkill 1;
		_x triggerDynamicSimulation false;
		_x setSkill ['aimingShake', 0.25];
	} forEach units _group;

	[_group, _wpCenter, 0, false] execVM "src\fnc\patrols\air\nextWaypoint.sqf";
};

_group
