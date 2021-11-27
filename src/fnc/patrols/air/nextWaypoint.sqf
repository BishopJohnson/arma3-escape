/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
		Number - 
		Bool - 
*/

params ["_group", "_position", "_radius", "_loiter"];

private ["_wp"];

if (!isServer) exitWith {};

_wp = _group addWaypoint [_position, _radius];

if (_loiter) then
{
    _wp setWaypointType "LOITER";
}
else
{
	_wp setWaypointType "SAD";
};
