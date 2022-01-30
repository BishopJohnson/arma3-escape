/*
    Author: Bishop Johnson

	Parameter(s):
	    Side -
        Number
		Number -
		Number -
        Array (Optional) -

	Returns:
	    Group -
*/

params
[
    "_maxRadius",
    "_minRadius",
    "_size",
    "_side",
    ["_faction", "", [""]],
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};

private _players = call BIS_fnc_listPlayers;
private _playerCount = count _players;
private _startIdx = floor random _playerCount;

// Chooses a location near a player
private _pos =
[
    [[position (_players select _startIdx), _maxRadius]],
	["water", [position (_players select _startIdx), _minRadius]]
] call BIS_fnc_randomPos;

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
    _pos set [2, 0]; // Sets height to 0 in case that players are in the air

    private _fnc = compile preprocessFile "src\fnc\units\spawnGroup.sqf";
    if (isNil "_typeWeight") then
    {
        _group = [_pos, _size, _side] call _fnc;
    }
    else
    {
        _group = [_pos, _size, _side, "", _typeWeight] call _fnc;
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

    [_group] execVM "src\fnc\patrols\infantry\nextWaypoint.sqf";
};

_group
