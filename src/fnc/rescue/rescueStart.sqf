/*
    Author:
	    Bishop Johnson
*/

#define LZ_AREA 100

params ["_position", "_radius"];

private ["_terrainObjects", "_pos", "_marker", "_trigger"];

if (!isServer) exitWith {};

// First LZ
_pos = [nil, ["water", [_position, _radius]]] call BIS_fnc_randomPos;

// Checks if LZ is flat enough
while {!([_pos, LZ_AREA] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
{
    _pos = [nil, ["water", [_position, _radius]]] call BIS_fnc_randomPos;
};

// Clears the LZ of trees
_terrainObjects = nearestTerrainObjects [_pos, ["Tree"], LZ_AREA];
{
    _x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach _terrainObjects;

_marker = createMarker [format ["rescue%1_%2", floor random [0, 5000, 10000], floor random [0, 5000, 10000]], _pos];
_marker setMarkerType "mil_pickup";
_marker setMarkerColor format ["Color%1", side player];
_marker setMarkerText "Rescue LZ";

_trigger = createTrigger ["EmptyDetector", _pos, true];
_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", false];
_trigger setTriggerArea [LZ_AREA, LZ_AREA, 0, false];
_trigger setTriggerStatements
[
    "this",
	"[" + format ["%1", _pos] + "] execVM 'src\fnc\rescue\rescueMission.sqf'",
	""
];
_trigger setTriggerTimeout [5, 5, 5, true];

//{ [side player, "Base"] sideRadio "RescueStart"; } remoteExec ["bis_fnc_call"];
{ hint "Proceed to the rescue marker on your map."; } remoteExec ["bis_fnc_call"];
