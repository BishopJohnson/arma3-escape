/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
		Number - 
		Array (Optional) - 
		Array (Optional) - 
		Number - 
		Number - 
		Number - 
		Bool - 
	
	Returns:
	    Array - 
*/

params ["_side", "_size", "_classes", "_types", "_position", "_maxRadius", "_minRadius", "_azimuth", "_rect", "_init"];

private ["_group", "_temp", "_this", "_wp", "_spawnedUnits"];

if (!isServer) exitWith {};

_spawnedUnits = [];
while {_size > 0} do
{
	_temp = (floor random (_size / 2)) + 1;
	
	// Checks if classes were given
	if (isNil "_classes") then
	{
	    _group = [_side, _temp, nil, nil] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
	}
	else
	{
	    // Checks if types were given
		if (isNil "_types") then
		{
		    _group = [_side, _temp, _classes, nil] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
		}
		else
		{
		    _group = [_side, _temp, _classes, _types] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
		};
	};
	
	_group =
	[
	    [
		    [[_position, [_maxRadius, _maxRadius, _azimuth, _rect]]],
			["water", [_position, [_minRadius, _minRadius, _azimuth, _rect]]]
		] call BIS_fnc_randomPos,
		_side,
		_group,
		[],
		[],
		[],
		[0.5, 0.6, 0.8]
	] call BIS_fnc_spawnGroup;
	
	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group enableDynamicSimulation true;
	
	{ _x triggerDynamicSimulation false; } forEach units _group;
	
	if (random 1 > 0.5) then
	{
	    _group addWaypoint [[_position select 0, (_position select 1) - _maxRadius, _position select 2],0];
	    _group addWaypoint [[(_position select 0) - _maxRadius, _position select 1, _position select 2],0];
	    _group addWaypoint [[_position select 0, (_position select 1) + _maxRadius, _position select 2],0];
		_wp = _group addWaypoint [[(_position select 0) + _maxRadius, _position select 1, _position select 2],0];
	    _wp setWaypointType "CYCLE";
	}
	else
	{
	    _group addWaypoint [[_position select 0, (_position select 1) + _maxRadius, _position select 2],0];
	    _group addWaypoint [[(_position select 0) + _maxRadius, _position select 1, _position select 2],0];
	    _group addWaypoint [[_position select 0, (_position select 1) - _maxRadius, _position select 2],0];
		_wp = _group addWaypoint [[(_position select 0) - _maxRadius, _position select 1, _position select 2],0];
	    _wp setWaypointType "CYCLE";
	};
	
	// Runs code on each group member
	{
	    _this = _x;
	    call compile _init;
	} forEach units _group;
	
	_size = _size - _temp;
	_spawnedUnits append units _group;
};

_spawnedUnits
