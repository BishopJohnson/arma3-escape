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

#define MIN_SAFE_DISTANCE 50
#define ROAD_RADIUS 1000
#define SAFE_SPAWN_ATTEMPTS 5

params ["_side", "_maxRadius", "_minRadius"];

if (!isServer) exitWith {};

private _players = call BIS_fnc_listPlayers;
private _size = count _players;
private _startIdx = floor random _size;

// Chooses a location near a player
private _position =
[
    [[position (_players select _startIdx), _maxRadius]],
	["water", [position (_players select _startIdx), _minRadius]]
] call BIS_fnc_randomPos;

// Places vehicle on road and/or away from other vehicles if possible
private _result = false;
private _attemptCount = 0;
while {!_result && _attemptCount < SAFE_SPAWN_ATTEMPTS} do
{
	private _road = [_position, ROAD_RADIUS, []] call BIS_fnc_nearestRoad;

    private "_tempPos";
	if (!isNull _road) then
    {
        _tempPos = getPosASL _road;
    }
	else
    {
        _tempPos = _position;
    };

	_result = true; // Assume a valid position was choosen

	// Prevents vehicles from spawning in each other
	private _keys = vehiclePatrols call DICT_fnc_keys;
	private _i = 0;
	while {_result && _i < count _keys} do
	{
		private _groups = [vehiclePatrols, _keys select _i] call DICT_fnc_get;
		private _j = 0;

		while {_result && _j < count _groups} do
		{
			private _veh = vehicle (leader (_groups select _j));
			if (_veh distance2D _tempPos < MIN_SAFE_DISTANCE) then
			{
				_result = false;
			};

			_j = _j + 1;
		};

		_i = _i + 1;
	};

	if (_result) then
    {
        _position = _tempPos;
    };

	_attemptCount = _attemptCount + 1;
};

_position = [_position select 0, _position select 1, 2.0]; // Adjusts position for vehicles

// Checks if location is too close to any players
_result = true;
for [{ private _i = _startIdx + 1 }, { _i mod _size != _startIdx }, { _i = _i + 1 }] do
{
    if (_position inArea [(units group player) select (_i mod _size), _minRadius, _minRadius, 0, false]) exitWith
	{
	    _result = false;
	};
};

private _group = grpNull;
if (_result) then
{
	// Spawn vehicle with crew
    private _vehGroup = [_position, _side] call compile preprocessFile "src\fnc\units\spawnVehicle.sqf";
    if (isNil "_vehGroup") exitWith { _group };

    private _veh = _vehGroup select 0;
	_group = _vehGroup select 2;

    // Randomize hull damage and ammo (exclude civilian vehicles).
    if (_side != civilian) then
    {
        // TODO: Set hull health in range of [60%, 100%] skewed towards 100%.
        _veh setVehicleAmmo (0.4 + random 0.6); // Set ammo in range of [40%, 100%)
    };

    _veh setFuel (0.05 + random 0.65); // Set fuel in range of [5%, 71%)

	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation true;
	addToRemainsCollector units _group;

	{
	    _x triggerDynamicSimulation false;
	    _x setSkill ['aimingShake', 0.25];
	} forEach units _group;

    private _followRoads = _veh isKindOf "Car";
	[_group, ROAD_RADIUS, _followRoads] execVM "src\fnc\patrols\vehicles\nextWaypoint.sqf";
};

_group
