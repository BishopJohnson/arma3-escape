/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
		Array or Config Path - 
		Number -
		Number -
	
	Returns:
	    Group - 
*/

params ["_side", "_group", "_maxRadius", "_minRadius"];

private ["_size", "_startIndex", "_currentIndex", "_position", "_result", "_wp"];

if (!isServer) exitWith {};

_size = count (call BIS_fnc_listPlayers);
_startIndex = floor random _size;

// Chooses a location near a player
_position =
[
    [[position ((call BIS_fnc_listPlayers) select _startIndex), _maxRadius]],
	["water", [position ((call BIS_fnc_listPlayers) select _startIndex), _minRadius]]
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
	_position set [2, 0]; // Sets height to 0 in case that players are in the air
	
    _group = [_position, _side, _group, [], [], [], [0.7, 0.8]] call BIS_fnc_spawnGroup; // Updates _group with newly created group
	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation true;
	
	{
		_x triggerDynamicSimulation false;
		_x setSkill ['aimingShake', 0.25];
		
		// Removes maps
		if (random 1 > 0.9) then
		{
			_x unlinkItem "ItemMap";
		};
	} forEach units _group;
	
	[_group] execVM "src\fnc\patrols\infantry\nextWaypoint.sqf";
}
else
{
    _group = grpNull;
};

_group 