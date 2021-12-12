/*
    Author:
	    Bishop Johnson

	Parameter(s):
		Side -
		String -
*/

#define SPOT_DISTANCE 300

params ["_position", "_radius", "_side", "_comp"];

if (!isServer) exitWith {};

// Removes all terrain objects
{
	_x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_position, [], _radius];

private _objects = [_position, random 360, _comp select 0] call BIS_fnc_ObjectsMapper;

private _handler = [_objects] execVM "src\fnc\normalizeTilt\normalizeTilt.sqf";

// The composition's map marker
private _marker = createMarker [format ["marker%1_%2", floor random [0, 5000, 10000], floor random [0, 5000, 10000]], _position];
_marker setMarkerType "hd_unknown";
_marker setMarkerColor "ColorRed";

/* Trigger that updates map marker of the composition only once a player
 * is within its activation area.
 */
private _markerTrigger = createTrigger ["EmptyDetector", _position, true];
_markerTrigger setTriggerType "NONE";
_markerTrigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_markerTrigger setTriggerArea [SPOT_DISTANCE, SPOT_DISTANCE, 0, false];
_markerTrigger setTriggerStatements
[
	"this",
	"_marker = """ + _marker + """;
	 _marker setMarkerType """ + (_comp select 1) + """;
	 _marker setMarkerColor 'Default';",
	""
];
_markerTrigger setTriggerTimeout [0, 0, 0, true];

waitUntil { scriptDone _handler };

[_position, _comp select 3, _radius, _side, _comp select 4] execVM "src\fnc\garrison\garrison.sqf";
