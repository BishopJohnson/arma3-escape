/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    "_side",
    "_faction",
    [
        "_typeWeights",
        [
            // Helicopter (total = 75%)
            RAND_VEH_HELI_L_KEY,    0.6,
            RAND_VEH_HELI_H_KEY,    0.15,

            // Plane (total = 10%)
            RAND_VEH_PLANE_KEY,     0.1,

            // UAV (total = 15%)
            RAND_VEH_HELI_UAV_KEY,  0.75,
            RAND_VEH_PLANE_UAV_KEY, 0.75
        ],
        [[]]
    ]
];

if (!isServer) exitWith {};

if (typeName _side == "Side") then { _side = str _side };

private "_vehEntry";
private _attempt = 0;
while {isNil "_vehEntry" && _attempt < 5} do
{
    _attempts = _attempt + 1;

    private _type = selectRandomWeighted _typeWeights;
    private _typeDict = Escape_Random_Vehicles get str _side get _faction get _type;
    if (isNil "_typeDict") then { continue };

    private _typeKeys = keys _typeDict;
    if (count _typeKeys > 0) then
    {
        _vehEntry = _typeDict get selectRandom _typeKeys;
    };
};

if (isNil "_vehEntry") exitWith {};

_vehEntry
