/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Number - 
*/

#define KEY "comps"
#define DEFAULT_DENSITY 1

private ["_density", "_sides", "_size", "_count", "_side", "_types", "_weights", "_type", "_comp", "_radius", "_position", "_array"];

if (!isServer) exitWith {};

if (isNil "COMPOSITIONS") then
{
	/* The values for each key are multidimensional arrays formatted as
	 * [position, radius, side, comp] where comp is the array returned by the
	 * a given base file.
	 */
	COMPOSITIONS = call DICT_fnc_create;
	[COMPOSITIONS, KEY, []] call DICT_fnc_set;
	
	hint "nil in bases";
};

/*
_density = DEFAULT_DENSITY;

if (count _this > 0) then {_density = _this select 0;};

_size = worldSize;

_count = some function of size and density
*/
_count = 20;

_sides = [west, east, independent] - [PLAYER_FACTION];

_types =
[
	"COMMS",
	"HVEHICLE",
    "LVEHICLE",
	"AMMO",
	"MORTAR",
	"UAV"
];

_weights =
[
	0.1, // Comms Station
	0.1, // Heavy Vehicle Depot
	0.3, // Light Vehicle Depot
	0.3, // Ammo Depot
	0.1, // Mortar
	0.1  // UAV Station
];

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
    // Ensures that a communication station spawns for each enemy faction
    if (_i >= count _sides) then
	{
	    _side = selectRandom _sides;
	    _type = _types selectRandomWeighted _weights;
	}
	else
	{
	    _side = _sides select _i;
		_type = "COMMS";
	};
	
	// Gets the composition
	_comp = [_side, _type] call compile preprocessFile "src\comps\bases\bases.sqf";
	_radius = _comp select 2;

	// Selects base position
	_position = [] call BIS_fnc_randomPos;
	while {!([_position, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
	{
		_position = [] call BIS_fnc_randomPos;
	};
	
	// Adds the comp data to the dictionary
	_array = [COMPOSITIONS, KEY] call DICT_fnc_get;
	_array append [[_position, _radius, _side, _comp]];
	[COMPOSITIONS, KEY, _array] call DICT_fnc_set;
};
