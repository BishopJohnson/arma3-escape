/*
    author: Bishop
    description: none
    returns: nothing
*/

params
[
    "_arr",
    "_veh",
    ["_variant", true, [true, []]],
    ["_loadout", true, [true, []]]
];

while { typeName _veh == "Array"} do
{
    _veh = selectRandom _veh;
};

if (typeName _variant == "Array") then
{
    _variant = [selectRandom _variant, 1];
};

if (typeName _loadout == "Array") then
{
    _loadout = selectRandom _loadout;
};

private _init = (_arr select 7) + format ["[this, %1, '%2'] call BIS_fnc_initVehicle;", _variant, _loadout];

_arr set [0, _veh];
_arr set [7, _init];

_arr
