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
private _typeWeights =
[
    UNIT_CLASS_RIFLEMEN, 0.6,
    UNIT_CLASS_AT, 0.1,
    UNIT_CLASS_AUTORIFLEMEN, 0.2,
    UNIT_CLASS_MARKSMEN, 0.1
];

// Assign player loadouts
private _loadoutFnc = compile preprocessFile "src\fnc\units\getUnitEntryFromDict.sqf";
{
    private _loadoutEntry = [PLAYER_SIDE, PLAYER_FACTION,
    [
        UNIT_CLASS_RIFLEMEN, 0.7,
        UNIT_CLASS_AT, 0.1,
        UNIT_CLASS_AUTORIFLEMEN, 0.1,
        UNIT_CLASS_MARKSMEN, 0.1
    ]] call _loadoutFnc;

    _loadout = _loadoutEntry select 1;
    [_x] call _loadout;

    _x unlinkItem "ItemMap";
} forEach _players;

// The crash site's map marker
private _marker = createMarker ["start", _pos];
_marker setMarkerType "hd_start";

switch (PLAYER_SIDE) do
{
	case west:			{ _marker setMarkerColor "ColorWEST" };
	case east:			{ _marker setMarkerColor "ColorEAST" };
	case independent:	{ _marker setMarkerColor "ColorGUER" };
};

// Set search chopper to arrive 120 seconds after mission starts
private _enemyFaction = call Escape_fnc_GetRandomEnemyFaction;
_trg = createTrigger ["EmptyDetector", [0,0,0]];
_trg setTriggerStatements
[
	"true",
	format ["['%1'] execVM 'src\fnc\starts\spawnSearchHelicopter.sqf'", _enemyFaction],
	""
];
_trg setTriggerTimeout [120, 120, 120, true];
