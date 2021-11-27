/*

*/

#define COMPS_KEY "comps"
#define ROADBLOCK_KEY "roadblocks"
#define MINEFIELD_KEY "minefields"

START_KEY = "start"; // Key for start location

/* The values for each key are multidimensional arrays formatted as [position, radius, side, comp] where comp is the
 * array returned by the a given base file.
 */
COMPOSITIONS = call DICT_fnc_create;
[COMPOSITIONS, COMPS_KEY, []] call DICT_fnc_set;
[COMPOSITIONS, ROADBLOCK_KEY, []] call DICT_fnc_set;
[COMPOSITIONS, MINEFIELD_KEY, []] call DICT_fnc_set;

[COMPOSITIONS, START_KEY, [/* position, radius */]] call DICT_fnc_set;

switch ("Faction" call BIS_fnc_getParamValue) do
{
	case 1: { PLAYER_FACTION = west };
	case 2: { PLAYER_FACTION = east };
	case 3: { PLAYER_FACTION = independent };
	default { PLAYER_FACTION = selectRandom [west, east, independent] };
};

{
	// Checks if the unit is not host
	if (!local _x) then
	{
		(owner _x) publicVariableClient "PLAYER_FACTION";
	};
} forEach (call BIS_fnc_listPlayers);

playerGroup = createGroup PLAYER_FACTION;
(call BIS_fnc_listPlayers) joinSilent playerGroup;

call compile preprocessFile "src\lists\listsInit.sqf";

[] execVM "src\main.sqf";
