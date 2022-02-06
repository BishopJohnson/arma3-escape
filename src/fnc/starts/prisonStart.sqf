/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Side -
		Array (Optional) -
*/

#include "..\..\..\define.hpp"

#define GUARD_COUNT 4

if (!isServer) exitWith {};

prisonEscapeStared = false;
private _players = call BIS_fnc_listPlayers;

if (isNil "COMPOSITIONS") then
{
	COMPOSITIONS = call DICT_fnc_create;
};

private _enemySide = call Escape_fnc_GetRandomEnemySide;
private _enemyFaction = [_enemySide] call Escape_fnc_GetRandomEnemyFactionOfSide;

private _fnc = compile preprocessFile "src\comps\prisons\prison1.sqf"; // TODO: Replace with a general script for other prisons
private _comp = [_enemyFaction] call _fnc;
private _buildings = _comp select 0;
private _maxRadius = _comp select 1;
private _minRadius = _comp select 2;
private _isRect = _comp select 3;
private _spawnObjects = _comp select 4;
private _triggerObjects = _comp select 5;
private _normalizeTiltObjects = _comp select 6;
private _azimuth = random 360;

// Selects prison position
private _pos = [] call BIS_fnc_randomPos;
while {!([_pos, _maxRadius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
{
    _pos = [] call BIS_fnc_randomPos;
};

[COMPOSITIONS, START_KEY, [_pos, _maxRadius]] call DICT_fnc_set;

// Clears all nearby terrain objects
{
    _x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_pos, [], _maxRadius];

// Spawns the composition
[_pos, _azimuth, _buildings] call BIS_fnc_ObjectsMapper;

// Normalizes tilt
[nearestObjects [_pos, _normalizeTiltObjects, _maxRadius], []] execVM "src\fnc\normalizeTilt\normalizeTilt.sqf";

// Places players inside start area
private _i = 0;
{
    // Checks if there are more players
	if (_i < count _players) then
	{
		private _player = _players select _i;
	    _player setPosATL position _x;
		_player setDir direction _x;

		_i = _i + 1;
	};

	deleteVehicle _x; // Delete spawn marker
} forEach nearestObjects [_pos, _spawnObjects, _maxRadius];

// Assign player loadouts
{
	player setCaptive true;
	[] execVM "src\fnc\loadouts\prisonLoadout.sqf";
} remoteExec ["bis_fnc_call", _players];

{
	_x addEventHandler
	[
		"Fired",
		{
			[] execVM 'src\fnc\starts\prisonEscapeStarted.sqf';
		}
	];
} forEach _players;

// Places triggers around start area
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

	deleteVehicle _x; // Delete trigger marker
} forEach nearestObjects [_pos, _triggerObjects, _maxRadius];

// The prison's map marker
private _marker = createMarker ["start", _pos];
_marker setMarkerType "hd_start";

switch (PLAYER_SIDE) do
{
	case west:			{ _marker setMarkerColor "ColorWEST" };
	case east:			{ _marker setMarkerColor "ColorEAST" };
	case independent:	{ _marker setMarkerColor "ColorGUER" };
};

// Spawn prison guards
prisonGuards = [
	_pos,
	_maxRadius,
	_minRadius,
	GUARD_COUNT,
	_enemySide,
	"",
	[
		UNIT_CLASS_RIFLEMEN,		0.33,
		UNIT_CLASS_AT,				0.33,
		UNIT_CLASS_AUTORIFLEMEN,	0.33
	],
	_isRect,
	_azimuth,
	"_this unlinkItem 'ItemMap';"
] call compile preprocessFile "src\fnc\garrison\perimeterPatrol.sqf";

// Set search chopper to arrive when all guards are dead
_trg = createTrigger ["EmptyDetector", _pos];
_trg setTriggerStatements
[
	"{alive _x} count prisonGuards == 0",
	format ["[%1] execVM 'src\fnc\starts\spawnSearchHelicopter.sqf'", _side],
	""
];
