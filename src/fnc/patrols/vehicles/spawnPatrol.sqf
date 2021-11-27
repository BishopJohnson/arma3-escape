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

private ["_type", "_size", "_attemptCount", "_i", "_j", "_keys", "_startIndex", "_currentIndex", "_position", "_tempPos", "_result", "_road", "_veh", "_group", "_groups"];

if (!isServer) exitWith {};

_type = [_side] call compile preprocessFile "src\fnc\patrols\vehicles\vehicleTypes.sqf";

_size = count units group player;
_startIndex = floor random _size;

// Chooses a location near a player
_position =
[
    [[position ((units group player) select _startIndex), _maxRadius]],
	["water", [position ((units group player) select _startIndex), _minRadius]]
] call BIS_fnc_randomPos;

// Places vehicle on road and/or away from other vehicles if possible
_result = false;
_attemptCount = 0;
while {!_result && _attemptCount < SAFE_SPAWN_ATTEMPTS} do
{
	_road = [_position, ROAD_RADIUS, []] call BIS_fnc_nearestRoad;
	
	if (!isNull _road) then { _tempPos = getPosASL _road; }
	else { _tempPos = _position; };
	
	_result = true; // Assume a valid position was choosen
	
	// Prevents vehicles from spawning in each other
	_keys = vehiclePatrols call DICT_fnc_keys;
	_i = 0;
	while {_result && _i < count _keys} do
	{
		_groups = [vehiclePatrols, _keys select _i] call DICT_fnc_get;
		_j = 0;
		
		while {_result && _j < count _groups} do
		{
			_veh = vehicle (leader (_groups select _j));
			
			if (_veh distance2D _tempPos < MIN_SAFE_DISTANCE) then
			{
				_result = false;
			};
			
			_j = _j + 1;
		};
		
		_i = _i + 1;
	};
	
	if (_result) then { _position = _tempPos; };
	
	_attemptCount = _attemptCount + 1;
};

_position = [_position select 0, _position select 1, 2.0]; // Adjusts position for vehicles

// Checks if location is too close to any players
_result = true;
for [{_currentIndex = _startIndex + 1}, {_currentIndex mod _size != _startIndex}, {_currentIndex = _currentIndex + 1}] do
{
    if (_position inArea [(units group player) select (_currentIndex mod _size), _minRadius, _minRadius, 0, false]) then
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
		[_side, _type] call compile preprocessFile "src\fnc\patrols\vehicles\vehicles.sqf",
		_side
	] call BIS_fnc_spawnVehicle;
	
	_group = _veh select 2;
	
	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation true;
    
	{ _x triggerDynamicSimulation false; } forEach units _group;
	
	[_group, ROAD_RADIUS, _type in ["Car", "MRAP", "Technical"]] execVM "src\fnc\patrols\vehicles\nextWaypoint.sqf";
	
	//removes maps
	//{
	//    if (random 1 > 0.9) then {_x unlinkItem "ItemMap";};
	//} forEach units _group;
}
else
{
    _group = grpNull;
};

_group 