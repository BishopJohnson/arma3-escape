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
            // Car (total = 30%)
            RAND_VEH_CAR_UNARMED_KEY,   0.1,
            RAND_VEH_CAR_ARMED_KEY,     0.1,
            RAND_VEH_UTIL_KEY,          0.1,

            // MRAP (total = 45%)
            RAND_VEH_MRAP_UNARMED_KEY,  0.225,
            RAND_VEH_MRAP_ARMED_KEY,    0.225,

            // IFV/APC (total = 15%)
            RAND_VEH_IFV_KEY,           0.075,
            RAND_VEH_APC_KEY,           0.075,

            // Tank (total = 8%)
            RAND_VEH_TANK_KEY,          0.08,

            // AA (total = 1.8%)
            RAND_VEH_AA_KEY,            0.018,

            // Artillery (total = 0.2%)
            RAND_VEH_ARTY_KEY,          0.002
        ],
        [[]]
    ]
];

if (!isServer) exitWith {};

private "_vehEntry";
private _attempt = 0;
while {isNil "_vehEntry" && _attempt < 5} do
{
    _attempts = _attempt + 1;

    private _type = selectRandomWeighted _typeWeights;
    private _typeDict = ((Escape_Random_Vehicles get str _side) get _faction) get _type;
    private _typeKeys = keys _typeDict;
    if (count _typeKeys > 0) then
    {
        _vehEntry = _typeDict get (selectRandom _typeKeys);
    };
};

_vehEntry
