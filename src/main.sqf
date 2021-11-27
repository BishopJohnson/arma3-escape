/*
    Author:
	    Bishop Johnson
*/

#define FADE_IN_TIME 5

// Minefield settings
#define MINEFIELD_COUNT 10

// Player movement task settings
#define MOVEMENT_FOOT_DISTANCE 100 // In meters
#define MOVEMENT_CAR_DISTANCE 500 // In meters
#define MOVEMENT_AIR_DISTANCE 1000 // In meters
#define MOVEMENT_INTERVAL 10 // In seconds

private ["_handler"];

if (!isServer) exitWith {};

// Cuts audio and sets screen to black
/*
{
	if (!hasInterface) exitWith {};
	
	onPreloadFinished
	{
		disableUserInput true;
		0 fadeSound 0;
		titleCut ["Loading Please Wait...", "BLACK FADED", 999];
	};
} remoteExec ["bis_fnc_call"];
*/

{
    [] execVM "src\fnc\actions\hackUavBackpack.sqf";
    [] execVM "src\fnc\actions\hackUavTerminal.sqf";
	[] execVM "src\fnc\rescue\rescueInit.sqf";
	[] execVM "src\fnc\revive\reviveInit.sqf";
} remoteExec ["bis_fnc_call"];

_handler = [] execVM "src\missionStart.sqf";
waitUntil { scriptDone _handler };

_handler = [] execVM "src\compsMaster.sqf";
waitUntil { scriptDone _handler };

// Audio and screen fade in
/*
{
	if (!hasInterface) exitWith {};

	disableUserInput false;
	FADE_IN_TIME fadeSound 1;
	titleCut ["", "BLACK IN", FADE_IN_TIME];
} remoteExec ["bis_fnc_call"];
*/

[] execVM "src\patrolMaster.sqf";
[] execVM "src\artilleryMaster.sqf";

[
	MOVEMENT_FOOT_DISTANCE,
	MOVEMENT_CAR_DISTANCE,
	MOVEMENT_AIR_DISTANCE,
	MOVEMENT_INTERVAL,
	"Escape_PlayerPositionUpdated"
] execVM "src\fnc\scheduledTasks\playerMovement.sqf";
[MINEFIELD_COUNT] execVM "src\fnc\ordnance\minefieldInit.sqf";
