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

private ["_type", "_size", "_startIndex", "_currentIndex", "_wpCenter", "_position", "_result", "_veh", "_group"];

if (!isServer) exitWith {};

_size = count (call BIS_fnc_listPlayers);
_startIndex = floor random _size;
_wpCenter = position ((call BIS_fnc_listPlayers) select _startIndex);

// Chooses a location near a player
_position =
[
    [[_wpCenter, _maxRadius]],
	[[_wpCenter, _minRadius]]
] call BIS_fnc_randomPos;

// Checks if location is too close to any players
_result = true;
for [{_currentIndex = _startIndex + 1}, {_currentIndex mod _size != _startIndex}, {_currentIndex = _currentIndex + 1}] do
{
    if (_position inArea [(call BIS_fnc_listPlayers) select (_currentIndex mod _size), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

if (_result) then
{
	// Spawns vehicle with crew
	_veh =
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
    
	{
		_x setSkill 1;
		_x triggerDynamicSimulation false;
	} forEach units _group;
	
	[_group, _wpCenter, 0, false] execVM "src\fnc\patrols\air\nextWaypoint.sqf";
}
else
{
    _group = grpNull;
};

_group
