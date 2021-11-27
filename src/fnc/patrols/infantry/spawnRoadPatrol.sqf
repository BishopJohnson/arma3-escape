/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
		Array or Config Path - 
		Number -
		Number -
	
	Returns:
	    Group - 
*/

#define RADIUS 100

params ["_side", "_group", "_maxRadius", "_minRadius"];

private ["_size", "_startIndex", "_currentIndex", "_position", "_result", "_wp", "_handler"];

if (!isServer) exitWith {};

_size = count units group player;
_startIndex = floor random _size;

//chooses a location on a road near a player
_position = getPosASL
[
    [
        [[position ((units group player) select _startIndex), _maxRadius]],
	    ["water", [position ((units group player) select _startIndex), _minRadius]]
    ] call BIS_fnc_randomPos,
	RADIUS
] BIS_fnc_nearestRoad;

//checks if location is too close to any players
_result = true;
for [{_currentIndex = _startIndex + 1}, {_currentIndex mod _size != _startIndex}, {_currentIndex = _currentIndex + 1}] do
{
    if (_position inArea [(units group player) select (_currentIndex mod _size), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

if (_result) then
{
    _group = [_position, _side, _group, [], [], [], [0.7, 0.8]] call BIS_fnc_spawnGroup; //updates _group with newly created group
	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group deleteGroupWhenEmpty true;
	_handler = [_group, nil] execVM "src\fnc\patrols\infantry\nextRoadWaypoint.sqf";
	
	/* TODO: Figure out why this loop
	 * doesn't work.
	 */
	//removes maps
	{
	    if (random 1 > 0.9) then {_x unlinkItem "ItemMap";};
	} forEach units _group;
	
	waitUntil {scriptDone _handler};
}
else
{
    _group = grpNull;
};

_group 