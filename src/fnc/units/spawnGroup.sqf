/*
    author: Bishop
    description: none
    returns: nothing
*/

params
[
    "_pos",
    "_size",
    "_side",
    ["_faction", "", [""]],
    ["_typeWeight", nil, [[]]]
];

if (!isServer) exitWith {};
if (_size < 1) exitWith { hint "Group size must be greater than 0" };

private "_groupSide";
if (typeName _side == "Side") then
{
    _groupSide = _side;
    _side = str _side;
}
else
{
    switch (_side) do
    {
        case str west:          { _groupSide = west };
        case str east:          { _groupSide = east };
        case str independent:   { _groupSide = independent };
    };
};

private _group = createGroup _groupSide;
if (isNull _group) exitWith { hint format ["Unable to create anymore groups for side %1", _side] };

private _fnc = compile preprocessFile "src\fnc\units\spawnUnit.sqf";
for [{ private _i = 0 }, { _i < _size }, { _i = _i + 1 }] do
{
    private "_unit";
    if (isNil "_typeWeight") then
    {
        _unit = [_pos, _side, _faction, _group] call _fnc;
    }
    else
    {
        _unit = [_pos, _side, _faction, _group, _typeWeight] call _fnc;
    };
};

_group
