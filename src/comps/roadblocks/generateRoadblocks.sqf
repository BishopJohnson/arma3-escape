/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Number -
*/

#define KEY "roadblocks"
#define DEFAULT_COUNT 30

private ["_sides", "_count", "_side", "_type", "_comp", "_radius", "_position", "_road", "_array"];

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

_count = DEFAULT_COUNT;

//if (count _this > 0) then {_count = _this select 0;};

_sides = [west, east, independent] - [PLAYER_SIDE];

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	_side = _sides select floor random (count _sides);
	_type = [] call compile preprocessFile "src\comps\roadblocks\roadblockTypes.sqf";

	// Gets the composition
	_comp = [_side, _type] call compile preprocessFile "src\comps\roadblocks\roadblocks.sqf";
	_radius = _comp select 1;

	// Selects roadblock position
	_position = [] call BIS_fnc_randomPos;
	while {!([_position, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
	{
		_position = [] call BIS_fnc_randomPos;
	};

	/* _road = [_position, _radius, []] call BIS_fnc_nearestRoad;

	_position = getPosASL _road; // Updates position to the road
	_position = [_position select 0, _position select 1, 0]; // Normalizes position to world surface */

	// Adds the comp data to the dictionary
	_array = [COMPOSITIONS, KEY] call DICT_fnc_get;
	_array append [[_position, _radius, _side, _comp]];
	[COMPOSITIONS, KEY, _array] call DICT_fnc_set;
};
