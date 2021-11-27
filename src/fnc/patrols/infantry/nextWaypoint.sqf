/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
*/

#define RADIUS 500

params ["_group"];

private ["_wp"];

if (!isServer) exitWith {};

_wp = _group addWaypoint [[[[position ((units _group) select 0), RADIUS]]] call BIS_fnc_randomPos, 0];
_wp setWaypointStatements
[
    "true",
	"[group this] execVM ""src\fnc\patrols\infantry\nextWaypoint.sqf"";"
];
