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

#define RADIUS 100

params ["_side", "_group", "_maxRadius", "_minRadius"];

if (!isServer) exitWith {};

private _size = count units group player;
private _startIdx = floor random _size;

// Chooses a location on a road near a player
private _position = getPosASL
[
    [
        [[position ((units group player) select _startIdx), _maxRadius]],
	    ["water", [position ((units group player) select _startIdx), _minRadius]]
    ] call BIS_fnc_randomPos,
	RADIUS
] call BIS_fnc_nearestRoad;

// Checks if location is too close to any players
private _result = true;
for [{ private _i = _startIdx + 1 }, { _i mod _size != _startIdx }, { _i = _i + 1 }] do
{
    if (_position inArea [(units group player) select (_i mod _size), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

private _patrolGrp = grpNull;
if (_result) then
{
    _patrolGrp = [_position, _side, _group, [], [], [], [0.7, 0.8]] call BIS_fnc_spawnGroup;

	_patrolGrp setBehaviour "SAFE";
	_patrolGrp setSpeedMode "LIMITED";
	_patrolGrp deleteGroupWhenEmpty true;
	_patrolGrp enableDynamicSimulation true;
	addToRemainsCollector units _patrolGrp;

	{
        _x triggerDynamicSimulation false;
        _x setSkill ['aimingShake', 0.25];

        // Removes maps
        if (random 1 > 0.9) then
        {
            _x unlinkItem "ItemMap";
        };
    } forEach units _patrolGrp;

    [_patrolGrp, nil] execVM "src\fnc\patrols\infantry\nextRoadWaypoint.sqf";
};

_patrolGrp
