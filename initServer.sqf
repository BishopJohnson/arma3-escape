/*
	author: Bishop
	description: none
	returns: nothing
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

// Store asset usages and broadcast to clients
Escape_Using_Heli = "IncludeHelicopters" call BIS_fnc_getParamValue == 1;
Escape_Using_Marksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
Escape_Using_Apex = "IncludeApex" call BIS_fnc_getParamValue == 1;
Escape_Using_Jets = "IncludeJets" call BIS_fnc_getParamValue == 1;
Escape_Using_Orange = "IncludeOrange" call BIS_fnc_getParamValue == 1;
Escape_Using_Tanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;
Escape_Using_Contact = "IncludeContact" call BIS_fnc_getParamValue == 1;
publicVariable "Escape_Using_Heli";
publicVariable "Escape_Using_Marksmen";
publicVariable "Escape_Using_Apex";
publicVariable "Escape_Using_Jets";
publicVariable "Escape_Using_Orange";
publicVariable "Escape_Using_Tanks";
publicVariable "Escape_Using_Contact";

// Store map camo constraints and broadcast to clients
Escape_Nato_Use_Camo = "IncludeNato" call BIS_fnc_getParamValue == 2;
Escape_Csat_Use_Camo = "IncludeIranian" call BIS_fnc_getParamValue == 2;
Escape_Csat_Pacific_Use_Camo = "IncludeChinese" call BIS_fnc_getParamValue == 2;
Escape_Spetsnaz_Use_Camo = "IncludeSpetsnaz" call BIS_fnc_getParamValue == 2;
publicVariable "Escape_NATO_Use_Camo";
publicVariable "Escape_CSAT_Use_Camo";
publicVariable "Escape_CSAT_Pacific_Use_Camo";
publicVariable "Escape_Spetsnaz_Use_Camo";

call compile preprocessFile "src\lists\listsInit.sqf";

[] execVM "src\main.sqf";
