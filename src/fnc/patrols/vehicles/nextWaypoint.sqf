/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
		Number - 
		Bool - 
*/

params ["_group", "_radius", "_onRoad"];

private ["_position", "_road", "_wp"];

if (!isServer) exitWith {};

//checks if road is preferred
if (_onRoad) then
{
    _position = [[[position ((units _group) select 0), _radius]]] call BIS_fnc_randomPos;
	_road = [_position, _radius, []] call BIS_fnc_nearestRoad;
	
	if (!isNull _road) then
	{
	    _wp = _group addWaypoint [getPosASL _road, 0];
        _wp setWaypointStatements
        [
            "true",
        	"[group this, " + format ["%1", _radius] + ", true] execVM ""src\fnc\patrols\vehicles\nextWaypoint.sqf"";"
        ];
	}
	else
	{
	    [_group, _radius, true] execVM "src\fnc\patrols\vehicles\nextWaypoint.sqf";
	}
}
else
{
    _wp = _group addWaypoint [[[[position ((units _group) select 0), _radius]]] call BIS_fnc_randomPos, 0];
    _wp setWaypointStatements
    [
        "true",
    	"[group this, " + format ["%1", _radius] + ", false] execVM ""src\fnc\patrols\vehicles\nextWaypoint.sqf"";"
    ];
};
