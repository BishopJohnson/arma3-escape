/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "define.hpp"

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

Escape_Use_Rhs = "UseRhs" call BIS_fnc_getParamValue == 1;
Escape_Using_Heli = "IncludeHelicopters" call BIS_fnc_getParamValue == 1;
Escape_Using_Marksmen = "IncludeMarksmen" call BIS_fnc_getParamValue == 1;
Escape_Using_Apex = "IncludeApex" call BIS_fnc_getParamValue == 1;
Escape_Using_Jets = "IncludeJets" call BIS_fnc_getParamValue == 1;
Escape_Using_Orange = "IncludeOrange" call BIS_fnc_getParamValue == 1;
Escape_Using_Tanks = "IncludeTanks" call BIS_fnc_getParamValue == 1;
Escape_Using_Contact = "IncludeContact" call BIS_fnc_getParamValue == 1;

publicVariable "Escape_Use_Rhs";
publicVariable "Escape_Using_Heli";
publicVariable "Escape_Using_Marksmen";
publicVariable "Escape_Using_Apex";
publicVariable "Escape_Using_Jets";
publicVariable "Escape_Using_Orange";
publicVariable "Escape_Using_Tanks";
publicVariable "Escape_Using_Contact";

Escape_Nato_Use_Camo = "IncludeNato" call BIS_fnc_getParamValue == 2;
Escape_Csat_Use_Camo = "IncludeIranian" call BIS_fnc_getParamValue == 2;
Escape_Csat_Pacific_Use_Camo = "IncludeChinese" call BIS_fnc_getParamValue == 2;
Escape_Spetsnaz_Use_Camo = "IncludeSpetsnaz" call BIS_fnc_getParamValue == 2;
Escape_Aaf_Use_Camo = "IncludeAaf" call BIS_fnc_getParamValue == 2;
Escape_Ldf_Use_Camo = "IncludeLdf" call BIS_fnc_getParamValue == 2;

private _usArmyVal = "IncludeUsArmy" call BIS_fnc_getParamValue;
Escape_Us_Army_Use_Camo = _usArmyVal == 2 || _usArmyVal == 4;
Escape_Us_Army_Use_Ucp = _usArmyVal == 3 || _usArmyVal == 4;

Escape_Us_Marines_Use_Camo = "IncludeUsMarines" call BIS_fnc_getParamValue == 2;
Escape_Ru_Use_Camo = "IncludeRu" call BIS_fnc_getParamValue == 2;
Escape_Cdf_Use_Camo = "IncludeCdf" call BIS_fnc_getParamValue == 2;
Escape_Saf_Use_Camo = "IncludeSaf" call BIS_fnc_getParamValue == 2;

publicVariable "Escape_NATO_Use_Camo";
publicVariable "Escape_CSAT_Use_Camo";
publicVariable "Escape_CSAT_Pacific_Use_Camo";
publicVariable "Escape_Spetsnaz_Use_Camo";
publicVariable "Escape_Aaf_Use_Camo";
publicVariable "Escape_Ldf_Use_Camo";
publicVariable "Escape_Us_Army_Use_Camo";
publicVariable "Escape_Us_Army_Use_Ucp";
publicVariable "Escape_Us_Marines_Use_Camo";
publicVariable "Escape_Ru_Use_Camo";
publicVariable "Escape_Cdf_Use_Camo";
publicVariable "Escape_Saf_Use_Camo";

private _factionVal = "Faction" call BIS_fnc_getParamValue;
switch true do
{
	case (_factionVal == 1 && !Escape_Use_Rhs):	{ PLAYER_SIDE = west; PLAYER_FACTION = NATO_KEY; };       // Core
	case (_factionVal == 2 && !Escape_Use_Rhs):	{ PLAYER_SIDE = east; PLAYER_FACTION = CSAT_KEY; };       //
	case (_factionVal == 3 && !Escape_Use_Rhs):	{ PLAYER_SIDE = independent; PLAYER_FACTION = AAF_KEY; }; //
	case (_factionVal == 4 && Escape_Use_Rhs):	{ PLAYER_SIDE = west; PLAYER_FACTION = US_ARMY_KEY; };    // RHS
	case (_factionVal == 5 && Escape_Use_Rhs):	{ PLAYER_SIDE = west; PLAYER_FACTION = US_MARINES_KEY; }; //
	case (_factionVal == 6 && Escape_Use_Rhs):	{ PLAYER_SIDE = east; PLAYER_FACTION = RU_KEY; };         //
	case (_factionVal == 7 && Escape_Use_Rhs):	{ PLAYER_SIDE = independent; PLAYER_FACTION = CDF_KEY; }; //
	case (_factionVal == 8 && Escape_Use_Rhs):	{ PLAYER_SIDE = independent; PLAYER_FACTION = SAF_KEY; }; //
	default
	{
		PLAYER_SIDE = selectRandom [west, east, independent];
		switch PLAYER_SIDE do
		{
			case west:
			{
				if (Escape_Use_Rhs) then { PLAYER_FACTION = [US_ARMY_KEY, US_MARINES_KEY] }
				else { PLAYER_FACTION = NATO_KEY };
			};
			case east:
			{
				if (Escape_Use_Rhs) then { PLAYER_FACTION = RU_KEY }
				else { PLAYER_FACTION = CSAT_KEY };
			};
			case independent:
			{
				if (Escape_Use_Rhs) then { PLAYER_FACTION = CDF_KEY }
				else { PLAYER_FACTION = AAF_KEY };
			};
		};
	};
};

FRIENDLY_FACTIONS = [];
ENEMY_FACTIONS = createHashMap;

if (Escape_Use_Rhs) then
{
	switch (PLAYER_SIDE) do
	{
		case west:
		{
			FRIENDLY_FACTIONS append [US_ARMY_KEY, US_MARINES_KEY];
			ENEMY_FACTIONS set [str west, []];
			ENEMY_FACTIONS set [str east, [RU_KEY]];
			ENEMY_FACTIONS set [str independent, [CDF_KEY]];
		};
		case east:
		{
			FRIENDLY_FACTIONS append [RU_KEY];
			ENEMY_FACTIONS set [str west, [US_ARMY_KEY, US_MARINES_KEY]];
			ENEMY_FACTIONS set [str east, []];
			ENEMY_FACTIONS set [str independent, [CDF_KEY]];
		};
		case independent:
		{
			FRIENDLY_FACTIONS append [CDF_KEY];
			ENEMY_FACTIONS set [str west, [US_ARMY_KEY, US_MARINES_KEY]];
			ENEMY_FACTIONS set [str east, [RU_KEY]];
			ENEMY_FACTIONS set [str independent, []];
		};
	};
}
else
{
	switch (PLAYER_SIDE) do
	{
		case west:
		{
			FRIENDLY_FACTIONS append [NATO_KEY];
			ENEMY_FACTIONS set [str west, []];
			ENEMY_FACTIONS set [str east, [CSAT_KEY, CSAT_P_KEY, SPETSNAZ_KEY]];
			ENEMY_FACTIONS set [str independent, [AAF_KEY, LDF_KEY]];
		};
		case east:
		{
			FRIENDLY_FACTIONS append [CSAT_KEY, CSAT_P_KEY, SPETSNAZ_KEY];
			ENEMY_FACTIONS set [str west, [NATO_KEY]];
			ENEMY_FACTIONS set [str east, []];
			ENEMY_FACTIONS set [str independent, [AAF_KEY, LDF_KEY]];
		};
		case independent:
		{
			FRIENDLY_FACTIONS append [AAF_KEY, LDF_KEY];
			ENEMY_FACTIONS set [str west, [NATO_KEY]];
			ENEMY_FACTIONS set [str east, [CSAT_KEY, CSAT_P_KEY, SPETSNAZ_KEY]];
			ENEMY_FACTIONS set [str independent, []];
		};
	};
};

publicVariable "PLAYER_SIDE";
publicVariable "PLAYER_FACTION";
publicVariable "FRIENDLY_FACTIONS";
publicVariable "ENEMY_FACTIONS";

playerGroup = createGroup PLAYER_SIDE;
(call BIS_fnc_listPlayers) joinSilent playerGroup;

Escape_fnc_GetFactionSide = {
	params
	[
		["_faction", nil, [""]]
	];

	if (isNil "_faction") exitWith {};

	private "_side";
	switch (_faction) do
	{
		case NATO_KEY;
		case US_ARMY_KEY;
		case US_MARINES_KEY:
		{
			_side = west;
		};
		case CSAT_KEY;
		case CSAT_P_KEY;
		case SPETSNAZ_KEY;
		case RU_KEY:
		{
			_side = east;
		};
		case AAF_KEY;
		case LDF_KEY;
		case CDF_KEY;
		case SAF_KEY:
		{
			_side = independent;
		};
	};

	if (isNil "_side") exitWith {};

	_side;
};

Escape_fnc_GetRandomEnemySide = {
	private _enemySide = selectRandom ([west, east, independent] - [PLAYER_SIDE]);

	_enemySide;
};

Escape_fnc_GetRandomEnemyFactionOfSide = {
	params ["_side"];
	if (typeName _side == "Side") then
	{
		_side = str _side;
	};

	private _enemyFactions = ENEMY_FACTIONS get _side;
	private _enemyFaction = selectRandom _enemyFactions;

	_enemyFaction;
};

Escape_fnc_GetRandomEnemyFaction = {
	private _enemySide = selectRandom ([west, east, independent] - [PLAYER_SIDE]);
	private _enemyFaction = [_enemySide] call Escape_fnc_GetRandomEnemyFactionOfSide;

	_enemyFaction;
};

private _listsHandler = [] execVM "src\lists\listsInit.sqf";
private _compsHandler = [] execVM "src\comps\compsInit.sqf";
waitUntil { scriptDone _listsHandler };
waitUntil { scriptDone _compsHandler };

[] execVM "src\main.sqf";
