/*
    Author:
	    Bishop Johnson
	
*/

private ["_sides", "_startTypes", "_start"];

if (!isServer) exitWith {};

// Waits until mission starts
waitUntil { time > 0 };

_sides = [east, west, independent] - [PLAYER_SIDE];

_startTypes =
[
    "src\fnc\starts\prisonStart.sqf"
];

_start = _startTypes select floor random (count _startTypes);

[selectRandom _sides] call compile preprocessFile _start;
