/*
	Author:
	    Bishop Johnson
*/

/*
#define MAX_WAIT_PERIOD 240
#define MID_WAIT_PERIOD 210
#define MIN_WAIT_PERIOD 180
*/

#define MAX_WAIT_PERIOD 30
#define MID_WAIT_PERIOD 30
#define MIN_WAIT_PERIOD 30

#define RADIUS 500
#define AMOUNT 20//15
#define FREQUENCY 3//5 // In seconds

params [];

private ["_group", "_groups", "_handler"];

while {true} do
{
	sleep random [MIN_WAIT_PERIOD, MID_WAIT_PERIOD, MAX_WAIT_PERIOD];
	
	/*
	_groups = [];
	
	// TODO: Do not include playerGroup if all players are in escape vehicles.
	_groups pushBack playerGroup;
	_groups pushBack infantryPatrols; // From `patrolMaster`
	
	if (count _groups > 0) then
	{
		_group = _groups call BIS_fnc_selectRandom;
		
		_handler =
		[
			position leader _group,
			RADIUS,
			AMOUNT,
			FREQUENCY
		] execVM "src\fnc\ordnance\artilleryBarrage.sqf";
		waitUntil { scriptDone _handler };
	};
	*/
	
	_handler =
	[
		[nil, ["water"]] call BIS_fnc_randomPos,
		RADIUS,
		AMOUNT,
		FREQUENCY
	] execVM "src\fnc\ordnance\artilleryBarrage.sqf";
	waitUntil { scriptDone _handler };
};
