/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

if (!isServer) exitWith {};

private _players = call BIS_fnc_listPlayers;

if (isNil "COMPOSITIONS") then
{
	COMPOSITIONS = call DICT_fnc_create;
};

private _fnc = compile preprocessFile "src\comps\misc\crashedHelicopter.sqf";
private _comp = call _fnc;
private _buildings = _comp select 0;
private _radius = _comp select 1;
private _spawnObjects = _comp select 2;
private _azimuth = random 360;

// Selects prison position
private _pos = [] call BIS_fnc_randomPos;
while {!([_pos, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
{
    _pos = [] call BIS_fnc_randomPos;
};

[COMPOSITIONS, START_KEY, [_pos, _radius]] call DICT_fnc_set;

// Clears all nearby terrain objects
{
    _x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_pos, [], _radius];

// Spawns the composition
[_pos, _azimuth, _buildings] call BIS_fnc_ObjectsMapper;

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
} forEach nearestObjects [_pos, _spawnObjects, _radius];

// Assign player loadouts
{
	[] execVM "src\fnc\loadouts\crashedHelicopterLoadout.sqf";
} remoteExec ["bis_fnc_call", _players];

// The crash site's map marker
private _marker = createMarker ["start", _pos];
_marker setMarkerType "hd_start";

switch (PLAYER_SIDE) do
{
	case west:			{ _marker setMarkerColor "ColorWEST" };
	case east:			{ _marker setMarkerColor "ColorEAST" };
	case independent:	{ _marker setMarkerColor "ColorGUER" };
};

private _enemyFaction = call Escape_fnc_GetRandomEnemyFaction;

////////////////////////////////////////////////////////////////////////////////////////////////////////// Prototype QRF
Escape_fnc_CrashedHeliQrf =
{
	params ["_enemyFaction"];

	if (!isServer) exitWith {};

	private _startLoc = ([COMPOSITIONS, START_KEY] call DICT_fnc_get) select 0;
	private _position =
	[
		[[_startLoc, 600]],
		[[_startLoc, 500]]
	] call BIS_fnc_randomPos;

	private _enemySide = [_enemyFaction] call Escape_fnc_GetFactionSide;

	private _enemyGroup = [
		600, // Max radius
		500, // Min radius
		random [4, 6, 8], // Size
		_enemySide,
		_enemyFaction,
		[
			UNIT_CLASS_LEADER, 0.1,
	        UNIT_CLASS_RIFLEMEN, 0.5,
	        UNIT_CLASS_AT, 0.1,
	        UNIT_CLASS_AUTORIFLEMEN, 0.2,
	        UNIT_CLASS_MARKSMEN, 0.1
	    ]
	] call compile preprocessFile "src\fnc\patrols\infantry\spawnPatrol.sqf";

	// Delete all waypoints from the group
	for "_i" from count waypoints _enemyGroup - 1 to 0 step -1 do
	{
		deleteWaypoint [_enemyGroup, _i];
	};

	_enemyGroup setBehaviour "AWARE";
	_enemyGroup setSpeedMode "NORMAL";
	_enemyGroup addWaypoint [_startLoc, 0];

	// Spawns flare at the enemy group's position
	private _flarePos = [position leader _enemyGroup, 0, 0] call BIS_fnc_relPos;
	private _flare = createVehicle ["F_40mm_White", _flarePos, [], 0, "NONE"];
	_flare setPosATL [getPosATL _flare select 0, getPosATL _flare select 1, 150 + (random 75)];
	_flare setVelocity [0,0,-0.1];
};

private _trgQrf = createTrigger ["EmptyDetector", [0,0,0]];
_trgQrf setTriggerStatements
[
	"true",
	format ["['%1'] call Escape_fnc_CrashedHeliQrf", _enemyFaction],
	""
];
_trgQrf setMusicEffect "LeadTrack02_F";
_trgQrf setTriggerTimeout [1, 1, 1, true];

// Set search chopper to arrive 120 seconds after mission starts
private _trgSearchChopper = createTrigger ["EmptyDetector", [0,0,0]];
_trgSearchChopper setTriggerStatements
[
	"true",
	format ["['%1'] execVM 'src\fnc\starts\spawnSearchHelicopter.sqf'", _enemyFaction],
	""
];
_trgSearchChopper setTriggerTimeout [120, 120, 120, true];
