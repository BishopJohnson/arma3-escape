/*
    Author:
	    Bishop Johnson

	Parameter(s):
	    Number -
*/

#define KEY "comps"

params
[
	["_count", 20, [0]],
	["_minimumCommsCount", 2, [0]]
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

	hint "nil in bases";
};

private "_typeWeights";
if (Escape_Use_Rhs) then
{
	_typeWeights =
	[
		"COMMS",	0.1,
		"HVEHICLE",	0.1,
	    "LVEHICLE",	0.35,
		"AMMO",		0.35,
		"MORTAR",	0.1
	];
}
else
{
	_typeWeights =
	[
		"COMMS",	0.1,
		"HVEHICLE",	0.1,
	    "LVEHICLE",	0.3,
		"AMMO",		0.3,
		"MORTAR",	0.1,
		"UAV",		0.1
	];
};

for [{private _i = 0}, {_i < _count + _minimumCommsCount}, {_i = _i + 1}] do
{
	private _factionKeys = keys Escape_Bases;
	private _faction = selectRandom (_factionKeys - FRIENDLY_FACTIONS);
	private _factionDict = Escape_Bases get _faction;

	private "_type";
    if (_i < _minimumCommsCount) then
	{
		_type = "COMMS";
	}
	else
	{
	    _type = selectRandomWeighted _typeWeights;
	};

	private _baseFnc = _factionDict get _type;

	// Gets the composition
	private _comp = call _baseFnc;
	private _radius = _comp select 2;

	// Selects base position
	private _position = [] call BIS_fnc_randomPos;
	while {!([_position, _radius] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
	{
		_position = [] call BIS_fnc_randomPos;
	};

	// Adds the comp data to the dictionary
	private _array = [COMPOSITIONS, KEY] call DICT_fnc_get;
	private _side = [_faction] call Escape_fnc_GetFactionSide;
	_array append [[_position, _radius, _side, _comp]];
	[COMPOSITIONS, KEY, _array] call DICT_fnc_set;
};
