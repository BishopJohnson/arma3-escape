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

private ["_position", "_result", "_wp"];

if (!isServer) exitWith {};

private _size = count (call BIS_fnc_listPlayers);
private _startIdx = floor random _size;

// Chooses a location near a player
_position =
[
    [[position ((call BIS_fnc_listPlayers) select _startIdx), _maxRadius]],
	["water", [position ((call BIS_fnc_listPlayers) select _startIdx), _minRadius]]
] call BIS_fnc_randomPos;

// Checks if location is too close to any players
_result = true;
for [{ private _i = _startIdx + 1 }, { _i mod _size != _startIdx }, { _i = _i + 1 }] do
{
    if (_position inArea [(call BIS_fnc_listPlayers) select (_i mod _size), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

private _patrolGrp = grpNull;
if (_result) then
{
	_position set [2, 0]; // Sets height to 0 in case that players are in the air

    _patrolGrp = [_position, _side, _group, [], [], [], [0.7, 0.8]] call BIS_fnc_spawnGroup;
	_patrolGrp setBehaviour "SAFE";
	_patrolGrp setSpeedMode "LIMITED";
	_patrolGrp deleteGroupWhenEmpty true;
	_patrolGrp enableDynamicSimulation true;
	addToRemainsCollector units _patrolGrp;

    [_patrolGrp] execVM "src\fnc\patrols\infantry\nextWaypoint.sqf";

	{
		_x triggerDynamicSimulation false;
		_x setSkill ['aimingShake', 0.25];

		// Removes maps
		if (random 1 > 0.9) then
		{
			_x unlinkItem "ItemMap";
		};
	} forEach units _patrolGrp;
};

_patrolGrp
