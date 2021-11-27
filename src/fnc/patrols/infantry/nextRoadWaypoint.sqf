/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
		Number -
*/

#define RADIUS 100

params ["_group", "_azimuth"];

private ["_wp"];

if (!isServer) exitWith {};

_wp = _group addWaypoint [[[[position ((units _group) select 0), _radius]]] call BIS_fnc_randomPos, 0];
_wp setWaypointStatements
[
    "true",
	"[group this] execVM ""src\fnc\patrols\infantry\nextRoadWaypoint.sqf"";"
];
