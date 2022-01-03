/*
    Author: Bishop Johnson

	Parameter(s):
		Array -
		Number -
		Number -
		Number -
	    Side -
		String (Optional) -
		Array (Optional) -
		Number (Optional) -
		Bool (Optional) -
		String (Optional) -

	Returns:
	    Array -
*/

params
[
	"_position",
	"_maxRadius",
	"_minRadius",
	"_size",
	"_side",
	["_faction", "", [""]],
	["_typeWeight", nil, [[]]],
	["_rect", false, [true]],
	["_azimuth", 0, [0]],
	["_init", "", [""]]
];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
	_side = str _side;
};

private _fnc = compile preprocessFile "src\fnc\units\spawnGroup.sqf";
private _spawnedUnits = [];
while {_size > 0} do
{
	private _groupSize = (floor random (_size / 2)) + 1;
	private _spawnPos =
	[
		[[_position, [_maxRadius, _maxRadius, _azimuth, _rect]]],
		["water", [_position, [_minRadius, _minRadius, _azimuth, _rect]]]
	] call BIS_fnc_randomPos;

	private "_group";
	if (isNil "_typeWeight") then
	{
		_group = [_spawnPos, _groupSize, _side, _faction] call _fnc;
	}
	else
	{
		_group = [_spawnPos, _groupSize, _side, _faction, _typeWeight] call _fnc;
	};

	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group enableDynamicSimulation true;
	removeFromRemainsCollector units _group;

	{
		_x setVehicleAmmo random [0.5, 0.6, 0.8];
		_x triggerDynamicSimulation false;

		// Runs code on each group member
		_this = _x;
	    call compile _init;
	} forEach units _group;

	private _xPos = _position select 0;
	private _yPos = _position select 1;
	if (selectRandom [true, false]) then // Patrol clockwise
	{
		_group addWaypoint [[_xPos, _yPos + _maxRadius, 0], 0];
		_group addWaypoint [[_xPos + _maxRadius, _yPos, 0], 0];
		_group addWaypoint [[_xPos, _yPos - _maxRadius, 0], 0];
		_group addWaypoint [[_xPos - _maxRadius, _yPos, 0], 0];
	}
	else // Patrol counter-clockwise
	{
		_group addWaypoint [[_xPos, _yPos + _maxRadius, 0], 0];
		_group addWaypoint [[_xPos - _maxRadius, _yPos, 0], 0];
		_group addWaypoint [[_xPos, _yPos - _maxRadius, 0], 0];
		_group addWaypoint [[_xPos + _maxRadius, _yPos, 0], 0];
	};

	private _wp = _group addWaypoint [[_xPos, _yPos + _maxRadius, 0], 0];
	_wp setWaypointType "CYCLE";

	_size = _size - _groupSize;
	_spawnedUnits append units _group;
};

_spawnedUnits
