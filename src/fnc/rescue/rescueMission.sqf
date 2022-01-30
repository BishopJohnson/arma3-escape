/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array -
*/

#define SPAWN_RADIUS 300
#define MAX_RADIUS_1 75 // The LZs have different radii to avoid collision between the
#define MAX_RADIUS_2 60 // helicopters.
#define MIN_RADIUS_1 55 //
#define MIN_RADIUS_2 40 //

params ["_position"];

private ["_lzPos1", "_lzPos2", "_transport", "_attack", "_heliPos", "_attackHeli", "_crew1", "_crew2", "_crewAttack", "_wp"];

if (!isServer) exitWith {};

//{ [side player, "Base"] sideRadio "RescueMissionEnroute"; } remoteExec ["bis_fnc_call"];
{ hint "Rescue transports are on the way."; } remoteExec ["bis_fnc_call"];

// Get helipad positions
_lzPos1 = [[[_position, MAX_RADIUS_1]], ["water", [_position, MIN_RADIUS_1]]] call BIS_fnc_randomPos;
_lzPos2 = [[[_position, MAX_RADIUS_2]], ["water", [_position, MIN_RADIUS_2]]] call BIS_fnc_randomPos;

// Spawns helipads
"Land_HelipadEmpty_F" createVehicle _lzPos1;
"Land_HelipadEmpty_F" createVehicle _lzPos2;

_transport = "";
_attack = "";
switch (PLAYER_SIDE) do
{
    case west:
	{
	    _transport = "B_Heli_Transport_03_F"; // Huron armed
		_attack = "B_Heli_Attack_01_dynamicLoadout_F"; // Blackfoot
	};
	case east:
	{
	    _transport = "O_Heli_Transport_04_covered_F"; // Taru transport
		_attack = "O_Heli_Attack_02_dynamicLoadout_F"; // Kajman
	};
	case independent:
	{
	    _transport = "I_Heli_Transport_02_F"; // Mohawk
		_attack = "I_Heli_light_03_dynamicLoadout_F"; // Hellcat armed
	};
};

// Chooses the helicopter spawn location
_heliPos = [_position, 2] call compile preprocessFile "src\fnc\findNearestMapEdge.sqf";

// DEBUG CODE
//private _marker = createMarker [format ["HeliMarker%1", floor random [0, 5000, 10000]], _heliPos];
//_marker setMarkerType "mil_start";

// Spawns helicopters
heli1 = createVehicle [_transport, _heliPos, [], SPAWN_RADIUS, "FLY"];
heli2 = createVehicle [_transport, _heliPos, [], SPAWN_RADIUS, "FLY"];
_attackHeli = createVehicle [_attack, _heliPos, [], SPAWN_RADIUS, "FLY"];

// Creates crews
_crew1 = createGroup side player;
_crew2 = createGroup side player;
_crewAttack = createGroup side player;
[heli1, _crew1] call BIS_fnc_spawnCrew;
[heli2, _crew2] call BIS_fnc_spawnCrew;
[_attackHeli, _crewAttack] call BIS_fnc_spawnCrew;

// Move gunners to null group to have waypoints and other effects apply only to pilots
_driver1 = driver heli1;
_driver2 = driver heli2;
(units _crew1 - [_driver1]) joinSilent grpNull;
(units _crew2 - [_driver2]) joinSilent grpNull;

// Modify AI of pilots to force them to land at LZ
_driver1 setBehaviour "CARELESS";
_driver2 setBehaviour "CARELESS";
{_driver1 disableAI _x} forEach ["TARGET", "AUTOTARGET", "FSM", "SUPPRESSION", "CHECKVISIBLE", "AUTOCOMBAT", "COVER"];
{_driver2 disableAI _x} forEach ["TARGET", "AUTOTARGET", "FSM", "SUPPRESSION", "CHECKVISIBLE", "AUTOCOMBAT", "COVER"];

// Sets waypoints to rescue LZ to pickup players
_wp = _crew1 addWaypoint [_lzPos1, 0];
_wp setWaypointStatements
[
	"({_x in heli1} count call BIS_fnc_listPlayers) + ({_x in heli2} count call BIS_fnc_listPlayers) == count call BIS_fnc_listPlayers",
	""
];
_wp setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
[_crew1, _wp select 1] setWaypointType "SCRIPTED";

_wp = _crew2 addWaypoint [_lzPos2, 0];
_wp setWaypointStatements
[
	"({_x in heli1} count call BIS_fnc_listPlayers) + ({_x in heli2} count call BIS_fnc_listPlayers) == count call BIS_fnc_listPlayers",
	""
];
_wp setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
[_crew2, _wp select 1] setWaypointType "SCRIPTED";

_wp = _crewAttack addWaypoint [_position, 0];
_wp setWaypointStatements
[
	"({_x in heli1} count call BIS_fnc_listPlayers) + ({_x in heli2} count call BIS_fnc_listPlayers) == count call BIS_fnc_listPlayers",
	""
];
[_crewAttack, 0] setWaypointType "LOITER";

// Sets waypoints to leave rescue LZ with players
_crew1 addWaypoint [_heliPos, 0];
_crew2 addWaypoint [_heliPos, 0];
_crewAttack addWaypoint [_heliPos, 0];

// Set trigger to win mission
_trigger = createTrigger ["EmptyDetector", _heliPos, true];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerArea [500, 500, 0, false];
_trigger setTriggerStatements
[
    "this && ({_x in heli1} count call BIS_fnc_listPlayers) + ({_x in heli2} count call BIS_fnc_listPlayers) == count call BIS_fnc_listPlayers",
	"'EveryoneWon' call BIS_fnc_endMissionServer;",
	""
];

// Set trigger to notify players when transports are destroyed
_trigger = createTrigger ["EmptyDetector", [0, 0], true];
_trigger setTriggerStatements
[
    "!(canMove heli1 || canMove heli2)",
	//"{ [side player, 'Base'] sideRadio 'RescueMissionDestroyed'; } remoteExec ['bis_fnc_call'];",
	"{ hint 'Rescue transports were destroyed.'; } remoteExec ['bis_fnc_call'];",
	""
];
