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
            // Quadbike (total = 2%)
            RAND_VEH_QUADBIKE_KEY,      0.02,

            // Car (total = 28%)
            RAND_VEH_CAR_UNARMED_KEY,   0.08,
            RAND_VEH_CAR_ARMED_KEY,     0.08,
            RAND_VEH_TRUCK_UNARMED_KEY, 0.02,
            RAND_VEH_TRUCK_ARMED_KEY,   0.02,
            RAND_VEH_UTIL_KEY,          0.08,

            // MRAP (total = 45%)
            RAND_VEH_MRAP_UNARMED_KEY,  0.225,
            RAND_VEH_MRAP_ARMED_KEY,    0.225,

            // IFV/APC (total = 15%)
            RAND_VEH_IFV_KEY,           0.075,
            RAND_VEH_APC_KEY,           0.075,

            // Tank (total = 6%)
            RAND_VEH_TANK_KEY,          0.08,

            // Tank special (total = 2%)
            RAND_VEH_TANK_KEY,          0.02,

            // AA (total = 1.8%)
            RAND_VEH_AA_KEY,            0.018,

            // Artillery (total = 0.2%)
            RAND_VEH_ARTY_KEY,          0.002
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
    private _typeDict = Escape_Random_Vehicles get _side get _faction get _type;
    if (isNil "_typeDict") then { continue };

    private _typeKeys = keys _typeDict;
    if (count _typeKeys > 0) then
    {
        _vehEntry = _typeDict get selectRandom _typeKeys;
    };
};

if (isNil "_vehEntry") exitWith {};

_vehEntry
