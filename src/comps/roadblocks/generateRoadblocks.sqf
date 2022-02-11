/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Number -
*/

#define KEY "roadblocks"

params
[
	["_count", 30, [0]]
];

if (!isServer) exitWith {};

if (isNil "COMPOSITIONS") then
{
	/* The values for each key are multidimensional arrays formatted as
	 * [position, radius, side, comp] where comp is the array returned by the
	 * a given base file.
	 */
	COMPOSITIONS = call DICT_fnc_create;
	[COMPOSITIONS, KEY, []] call DICT_fnc_set;
};

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	private _factionKeys = keys Escape_Roadblocks;
	private _faction = selectRandom (_factionKeys - [PLAYER_FACTION]);
	private _factionDict = Escape_Roadblocks get _faction;

	private _typeKey = selectRandom keys _factionDict;
	private _roadblockFnc = _factionDict get _typeKey;

	// Gets the composition
	private _comp = [_faction, _typeKey] call _roadblockFnc;
	private _radius = _comp select 1;

	// Selects roadblock position
	private _position = [] call BIS_fnc_randomPos;
	while {!([_position, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
	{
		_position = [] call BIS_fnc_randomPos;
	};

	/* private _road = [_position, _radius, []] call BIS_fnc_nearestRoad;

	_position = getPosASL _road; // Updates position to the road
	_position = [_position select 0, _position select 1, 0]; // Normalizes position to world surface */

	// Adds the comp data to the dictionary
	private _array = [COMPOSITIONS, KEY] call DICT_fnc_get;
	private _side = [_faction] call Escape_fnc_GetFactionSide;
	_array append [[_position, _radius, _side, _comp]];
	[COMPOSITIONS, KEY, _array] call DICT_fnc_set;
};
