/*
    Author:
	    Bishop Johnson
*/

if (!isServer) exitWith {};

// Waits until mission starts
waitUntil { time > 0 };

private _start = selectRandom
[
    "src\fnc\starts\prisonStart.sqf"
];

call compile preprocessFile _start;
