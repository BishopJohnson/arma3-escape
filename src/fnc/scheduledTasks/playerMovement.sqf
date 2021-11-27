/*
	Author:
	    Bishop Johnson
	
	Parameter(s):
	    Number - 
		Number - 
		Number - 
		Number - 
		Number - 
		Number - 
		String (Optional) - 
		String (Optional) - 
*/

params
[
	"_footRefreshDistance",
	"_carRefreshDistance",
	"_airRefreshDistance",
	"_sleep",
	["_moveEventName", "", [""]],
	["_idleEventName", "", [""]]
];

private ["_pos", "_positions", "_currPositions"];

// Exits if no event names are given
if (count _moveEventName <= 0 && count _idleEventName <= 0) exitWith
{
	hint "No event names given for `playerMovement` task.";
};

_positions = [];
_currPositions = [];

// Initialize the position arrays
{
	_pos = position _x;
	_positions pushBack _pos;
	_currPositions pushBack _pos;
} forEach (call BIS_fnc_listPlayers);

// Schedules process to update player positions
[_positions, _currPositions, _footRefreshDistance, _carRefreshDistance, _airRefreshDistance, _sleep, _moveEventName, _idleEventName] spawn
{
	params
	[
		"_positions",
		"_currPositions",
		"_footRefreshDistance",
		"_carRefreshDistance",
		"_airRefreshDistance",
		"_sleep",
		"_moveName",
		"_idleName"
	];
	
	private ["_inCar", "_inAir", "_refreshDistance", "_i", "_oldPos", "_newPos", "_distance", "_refresh"];
	
	while {true} do
	{
		sleep _sleep;
		
		// Assume all players are on foot
		_inCar = false;
		_inAir = false;
		
		// Check if at least one player is in a vehicle
		{
			if (!_inCar) then
			{
				_inCar = vehicle _x isKindOf "Car" || vehicle _x isKindOf "Tank" || vehicle _x isKindOf "Boat";
			};
			if (!_inAir) then
			{
				_inAir = vehicle _x isKindOf "Helicopter" || vehicle _x isKindOf "Plane";
			};
		} forEach (call BIS_fnc_listPlayers);
		
		// Set refresh distance check based on vehicle priority
		if (_inAir) then
		{
			_refreshDistance = _airRefreshDistance;
		}
		else
		{
			if (_inCar) then
			{
				_refreshDistance = _carRefreshDistance;
			}
			else
			{
				_refreshDistance = _footRefreshDistance;
			};
		};
		
		_refresh = false;
		
		_i = 0;
		{
			_oldPos = _positions select _i;
			_newPos = position _x;
			_currPositions set [_i, _newPos];
			
			_distance = _oldPos distance2D _newPos;
			if (_distance > _refreshDistance) then
			{
				_refresh = true;
			};
			
			_i = _i + 1;
		} forEach (call BIS_fnc_listPlayers);
		
		if (_refresh) then
		{
			_i = 0;
			{
				_positions set [_i, _currPositions select _i];
				_i = _i + 1;
			} forEach (call BIS_fnc_listPlayers);
			
			if (count _moveName > 0) then
			{
				[_moveName] call CBA_fnc_serverEvent;
			};
		}
		else
		{
			if (count _idleName > 0) then
			{
				[_idleName] call CBA_fnc_serverEvent;
			};
		};
	};
};
