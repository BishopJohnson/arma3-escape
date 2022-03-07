/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    "_pos",
    "_side",
    ["_faction", nil, [""]]
];

if (!isServer) exitWith {};

private "_sideStr";
if (typeName _side == "Side") then
{
    _sideStr = str _side;
}
else
{
    _sideStr = _side;
};

private _fnc = compile preprocessFile "src\fnc\units\getVehicleEntryFromDict.sqf";

private "_vehEntry";
switch (_sideStr) do
{
    case str west:
    {
        _side = west;

        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _sideStr;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case NATO_KEY:          { _vehEntry = [_side, NATO_KEY] call _fnc };
            case US_ARMY_KEY:       { _vehEntry = [_side, US_ARMY_KEY] call _fnc };
            case US_MARINES_KEY:
            {
                _vehEntry = [_side, US_MARINES_KEY,
                [
                    // Car (total = 50%)
                    RAND_VEH_CAR_UNARMED_KEY,   0.25,
                    RAND_VEH_CAR_ARMED_KEY,     0.25,

                    // MRAP (total = 45%)
                    RAND_VEH_MRAP_UNARMED_KEY,  0.225,
                    RAND_VEH_MRAP_ARMED_KEY,    0.225,

                    // Tank (total = 5%)
                    RAND_VEH_TANK_KEY,          0.05
                ]] call _fnc;
            };
            default                 { hint "No faction was selected for bluFor vehicle." };
        };
    };
    case str east:
    {
        _side = east;

        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _sideStr;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case CSAT_KEY:      { _vehEntry = [_side, CSAT_KEY] call _fnc };
            case CSAT_P_KEY:    { _vehEntry = [_side, CSAT_P_KEY] call _fnc };
            case RU_KEY:        { _vehEntry = [_side, RU_KEY] call _fnc };
            default             { hint "No faction was selected for opFor vehicle." };
        };
    };
    case str independent:
    {
        _side = independent;

        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _sideStr;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case AAF_KEY:   { _vehEntry = [_side, AAF_KEY] call _fnc };
            case LDF_KEY:
            {
                _vehEntry = [_side, LDF_KEY,
                [
                    // Quadbike (total = 2%)
                    RAND_VEH_QUADBIKE_KEY,      0.02,

                    // Car/Truck (total = 73%)
                    RAND_VEH_CAR_UNARMED_KEY,   0.243,
                    RAND_VEH_TRUCK_UNARMED_KEY, 0.243,
                    RAND_VEH_UTIL_KEY,          0.243,

                    // APC (total = 23%)
                    RAND_VEH_APC_KEY,           0.248,

                    // Artillery (total = 0.2%)
                    RAND_VEH_ARTY_KEY,          0.002
                ]] call _fnc;
            };
            case CDF_KEY:   { _vehEntry = [_side, CDF_KEY] call _fnc };
            case SAF_KEY:
            {
                _vehEntry = [_side, SAF_KEY,
                [
                    // Car/Truck (total = 44.8%)
                    RAND_VEH_CAR_UNARMED_KEY,   0.15,
                    RAND_VEH_CAR_ARMED_KEY,     0.15,
                    RAND_VEH_TRUCK_UNARMED_KEY, 0.074,
                    RAND_VEH_UTIL_KEY,          0.074,

                    // Tank (total = 5%)
                    RAND_VEH_TANK_KEY,          0.05,

                    // Artillery (total = 0.2%)
                    RAND_VEH_ARTY_KEY,          0.002
                ]] call _fnc;
            };
            default         { hint "No faction was selected for independent vehicle." };
        };
    };
    case str civilian:
    {
        _side = civilian;

        _vehEntry = [_side, CIVILIAN_KEY,
        [
            // Quadbike (total = 10%)
            RAND_VEH_QUADBIKE_KEY,      0.1,

            // Car/Truck (total = 80%)
            RAND_VEH_CAR_UNARMED_KEY,   0.5,
            RAND_VEH_TRUCK_UNARMED_KEY, 0.3,
            RAND_VEH_UTIL_KEY,          0.1
        ]] call _fnc;
    };
    default
    {
        hint "No side was selected for vehicle spawning.";
    };
};

if (isNil "_vehEntry") exitWith { hint "_vehEntry is nil." };

private _veh = _vehEntry select 0;
while { typeName _veh == "Array" } do
{
    _veh = selectRandom _veh;
};

private _variant = _vehEntry select 1;
private _loadout = _vehEntry select 2;

if (typeName _variant == "Array") then
{
    _variant = [selectRandom _variant, 1];
};

if (typeName _loadout == "Array") then
{
    _loadout = selectRandom _loadout;
};

private _vehGroup = [_pos, random 360, _veh, _side] call BIS_fnc_spawnVehicle;
if (isNil "_vehGroup") exitWith { hint "_vehGroup is nil." };

[_vehGroup select 0, _variant, _loadout] call BIS_fnc_initVehicle;

if (_side != civilian) then
{
    [_vehGroup select 1, _side, _faction] execVM "src\fnc\loadouts\setCrewLoadout.sqf";
};

_vehGroup
