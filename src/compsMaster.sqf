/*
    Author:
	    Bishop Johnson
*/

#define COMPS_KEY "comps"
#define ROADBLOCK_KEY "roadblocks"
#define MINEFIELD_KEY "minefields"
#define START_KEY "start"
#define PRIORITY_DISTANCE 1600

private ["_handler", "_array", "_startPos", "_startRadius", "_priority", "_comp", "_compPos"];

if (!isServer) exitWith {};

if (isNil "COMPOSITIONS") then
{
	/* The values for each key are multidimensional arrays formatted as
	 * [position, radius, side, comp] where comp is the array returned by the
	 * a given base file.
	 */
	COMPOSITIONS = call DICT_fnc_create;
	[COMPOSITIONS, COMPS_KEY, []] call DICT_fnc_set;
	[COMPOSITIONS, ROADBLOCK_KEY, []] call DICT_fnc_set;
};

_handler = [] execVM "src\comps\bases\generateBases.sqf";
waitUntil { scriptDone _handler };

_handler = [] execVM "src\comps\roadblocks\generateRoadblocks.sqf";
waitUntil { scriptDone _handler };

/* TODO: Add minefield generation script.
 */

_handler = [] execVM "src\comps\misc\planeCrash.sqf";
waitUntil { scriptDone _handler };

// Only performs priority section if a start location exists
if ([COMPOSITIONS, START_KEY] call DICT_fnc_exists) then
{
	_array = [COMPOSITIONS, START_KEY] call DICT_fnc_get;
	_startPos = _array select 0;
	_startRadius = _array select 1;

	///////// START PRIORITY SECTION /////////

	// Gets all comps within the object render distance and spawns them first
	_priority = [];
	_array = [COMPOSITIONS, COMPS_KEY] call DICT_fnc_get;
	for [{private _i = 0}, {_i < count _array}, {_i = _i + 1}] do
	{
		_comp = _array select _i;
		_compPos = _comp select 0;

		// Moves comps to priority if the are within the priority radius
		if (_compPos distance2D _startPos < PRIORITY_DISTANCE) then
		{
			_priority append [_comp];
			_array deleteAt _i;
			_i = _i - 1;

			[COMPOSITIONS, COMPS_KEY, _array] call DICT_fnc_set;
		};
	};

	{
		_handler = _x execVM "src\comps\bases\spawnBase.sqf";
		waitUntil { scriptDone _handler };
	} forEach _priority;

	// Gets all roadblocks within the object render distance and spawns them first
	_priority = [];
	_array = [COMPOSITIONS, ROADBLOCK_KEY] call DICT_fnc_get;
	for [{private _i = 0}, {_i < count _array}, {_i = _i + 1}] do
	{
		_comp = _array select _i;
		_compPos = _comp select 0;

		// Moves comps to priority if the are within the priority radius
		if (_compPos distance2D _startPos < PRIORITY_DISTANCE) then
		{
			_priority append [_comp];
			_array deleteAt _i;
			_i = _i - 1;

			[COMPOSITIONS, ROADBLOCK_KEY, _array] call DICT_fnc_set;
		};
	};

	{
		_handler = _x execVM "src\comps\roadblocks\spawnRoadblock.sqf";
		waitUntil { scriptDone _handler };
	} forEach _priority;

	///////// END PRIORITY SECTION /////////
};

// Spawns all remaining comps
{
	_x execVM "src\comps\bases\spawnBase.sqf";
} forEach ([COMPOSITIONS, COMPS_KEY] call DICT_fnc_get);

// Spawns all remaining roadblocks
{
	_x execVM "src\comps\roadblocks\spawnRoadblock.sqf";
} forEach ([COMPOSITIONS, ROADBLOCK_KEY] call DICT_fnc_get);
