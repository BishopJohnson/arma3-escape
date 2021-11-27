/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
		Array (Optional) - 
*/

#define GUARD_COUNT 4

params ["_side"];

private ["_comp", "_position", "_radius", "_azimuth", "_i", "_player", "_marker", "_guardClasses", "_guards"];

if (!isServer) exitWith {};

prisonEscapeStared = false;

if (isNil "COMPOSITIONS") then
{
	COMPOSITIONS = call DICT_fnc_create;
};

_comp = [_side] call compile preprocessFile "src\comps\prisons\prison1.sqf"; // TODO: Replace with a general script for other prisons
_radius = _comp select 2; // Radius of composition's area

// Selects prison position
_position = [] call BIS_fnc_randomPos;
while {!([_position, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
{
    _position = [] call BIS_fnc_randomPos;
};

[COMPOSITIONS, START_KEY, [_position, _radius]] call DICT_fnc_set;

// Clears all nearby terrain objects
{
    _x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_position, [], _radius];

_azimuth = random 360;

// Spawns the composition
[_position, _azimuth, _comp select 0] call BIS_fnc_ObjectsMapper;

// Normalizes tilt
[nearestObjects [_position, _comp select 7, _radius], []] execVM "src\fnc\normalizeTilt\normalizeTilt.sqf";

// Places players inside start area
_i = 0;
{
    // Checks if there are more players
	if (_i < count ([] call BIS_fnc_listPlayers)) then
	{
		_player = ([] call BIS_fnc_listPlayers) select _i;
	    _player setPosATL position _x;
		_player setDir direction _x;
		
		_i = _i + 1;
	};
	
	deleteVehicle _x; // Deletes spawn marker
} forEach nearestObjects [_position, _comp select 5, _radius];

// Assign player loadouts
{
	player setCaptive true;
	
	[PLAYER_FACTION] execVM "src\fnc\loadouts\prisonLoadout.sqf";
} remoteExec ["bis_fnc_call", (call BIS_fnc_listPlayers)];

{
	_x addEventHandler
	[
		"Fired",
		{
			[] execVM 'src\fnc\starts\prisonEscapeStarted.sqf';
		}
	];
} forEach (call BIS_fnc_listPlayers);

// Places triggers around start area
_i = 0;
{
	_trg = createTrigger ["EmptyDetector", position _x];
	_trg setTriggerArea [1, 10, getDir _x, true];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", false];
	_trg setTriggerStatements
	[
		"this",
		"[] execVM 'src\fnc\starts\prisonEscapeStarted.sqf';",
		""
	];
	
	deleteVehicle _x; // Deletes trigger marker
} forEach nearestObjects [_position, _comp select 6, _radius];

// The prison's map marker
_marker = createMarker ["start", _position];
_marker setMarkerType "hd_start";

switch (PLAYER_FACTION) do
{
	case west:			{ _marker setMarkerColor "ColorWEST" };
	case east:			{ _marker setMarkerColor "ColorEAST" };
	case independent:	{ _marker setMarkerColor "ColorGUER" };
};

// Spawn guards
_guards = [
	_side,
	GUARD_COUNT,
	_comp select 1,
	nil,
	_position,
	_radius, // Max radius
	_comp select 3, // Min radius
	_azimuth,
	_comp select 4, // Is rectangle
	"_this unlinkItem 'ItemMap';"
] call compile preprocessFile "src\fnc\garrison\perimeterPatrol.sqf";

// Set search chopper to arrive when all guards are dead
prisonGuards = _guards;
_trg = createTrigger ["EmptyDetector", _position];
_trg setTriggerStatements
[
	"{alive _x} count prisonGuards == 0",
	"['" + format ["%1", _side] + "'] execVM 'src\fnc\starts\spawnSearchHelicopter.sqf'",
	""
];
