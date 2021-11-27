/*
    Author:
	    Bishop Johnson
    
    Parameter(s):
	    Side -
		String -
*/

params ["_position", "_radius", "_side", "_comp"];

private ["_nearRoads", "_xBar", "_yBar", "_azimuth", "_handler"];

if (!isServer) exitWith {};

_nearRoads = _position nearRoads 100;

if (count _nearRoads == 0) exitWith {};

_xBar = 0.0;
_yBar = 0.0;

{
	_xBar = _xBar + ((getPosASL _x) select 0);
	_yBar = _yBar + ((getPosASL _x) select 1);
} forEach _nearRoads;

_xBar = _xBar / (count _nearRoads);
_yBar = _yBar / (count _nearRoads);

// Gets the azimuth perpendicular from the road
_azimuth = 0;
if (_xBar != 0) then
{
	_azimuth = atan(_yBar / _xBar) + 90;
};

// Removes all terrain objects
{
	_x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_position, [], _radius];

_objects = [_position, _azimuth, _comp select 0] call BIS_fnc_ObjectsMapper;

_handler = [_objects] execVM "src\fnc\normalizeTilt\normalizeTilt.sqf";

waitUntil { scriptDone _handler };

[_position, _radius + 20, _radius, _side, true, 4] execVM "src\fnc\garrison\garrison.sqf";
