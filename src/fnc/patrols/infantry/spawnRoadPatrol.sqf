/*
    Author: Bishop Johnson

	Parameter(s):
		Number -
		Number -
        Side -
        String (Optional) -
        Array (Optional) -

	Returns:
	    Group -
*/

#define RADIUS 100

params
[
    "_maxRadius",
    "_minRadius",
    "_side",
    ["_faction", "", [""]],
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};

private _players = call BIS_fnc_listPlayers;
private _playerCount = count _players;
private _startIdx = floor random _playerCount;

// Chooses a location on a road near a player
private _pos = getPosASL
[
    [
        [[position (_players select _startIdx), _maxRadius]],
	    ["water", [position (_players select _startIdx), _minRadius]]
    ] call BIS_fnc_randomPos,
	RADIUS
] call BIS_fnc_nearestRoad;

// Checks if location is too close to any players
private _result = true;
for [{ private _i = _startIdx + 1 }, { _i mod _playerCount != _startIdx }, { _i = _i + 1 }] do
{
    if (_pos inArea [_players select (_i mod _playerCount), _minRadius, _minRadius, 0, false]) then
	{
	    _result = false;
	};
};

private _group = grpNull;
if (_result) then
{
    private _fnc = compile preprocessFile "src\fnc\units\spawnGroup.sqf";
    if (isNil "_typeWeight") then
    {
        _group = [_pos, _playerCount, _side] call _fnc;
    }
    else
    {
        _group = [_pos, _playerCount, _side, "", _typeWeight] call _fnc;
    };

	_group setBehaviour "SAFE";
	_group setSpeedMode "LIMITED";
	_group deleteGroupWhenEmpty true;
	_group enableDynamicSimulation true;
	addToRemainsCollector units _group;

	{
        _x setVehicleAmmo random [0.5, 0.6, 0.8];
        _x triggerDynamicSimulation false;
    } forEach units _group;

    [_group, nil] execVM "src\fnc\patrols\infantry\nextRoadWaypoint.sqf";
};

_group
