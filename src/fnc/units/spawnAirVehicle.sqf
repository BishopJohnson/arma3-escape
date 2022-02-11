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

if (typeName _side == "Side") then
{
    _side = str _side;
};

private _fnc = compile preprocessFile "src\fnc\units\getAirVehicleEntryFromDict.sqf";

private "_vehEntry";
switch (_side) do
{
    case str west:
    {
        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case NATO_KEY:
            {
                _vehEntry = [_side, NATO_KEY] call _fnc;
            };
            case US_ARMY_KEY:
            {
                _vehEntry = [_side, US_ARMY_KEY,
                [
                    // Helicopter (total = 80%)
                    RAND_VEH_HELI_L_KEY,    0.6,
                    RAND_VEH_HELI_H_KEY,    0.2,

                    // Plane (total = 20%)
                    RAND_VEH_PLANE_KEY,     0.2,
                ]] call _fnc;
            };
        };
    };
    case str east:
    {
        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case CSAT_KEY:
            {
                _vehEntry = [_side, CSAT_KEY] call _fnc;
            };
            case CSAT_P_KEY:
            {
                _vehEntry = [_side, CSAT_P_KEY] call _fnc;
            };
            case RU_KEY:
            {
                _vehEntry = [_side, RU_KEY,
                [
                    // Helicopter (total = 80%)
                    RAND_VEH_HELI_L_KEY,    0.6,
                    RAND_VEH_HELI_H_KEY,    0.2,

                    // Plane (total = 20%)
                    RAND_VEH_PLANE_KEY,     0.2,
                ]] call _fnc;
            };
        };
    };
    case str independent:
    {
        if (isNil "_faction") then
        {
            private _factionDict = Escape_Random_Vehicles get _side;
            private _factionKeys = keys _factionDict;
            _faction = selectRandom _factionKeys;
        };

        switch (_faction) do
        {
            case AAF_KEY:
            {
                _vehEntry = [_side, AAF_KEY] call _fnc;
            };
            case LDF_KEY:
            {
                _vehEntry = [_side, LDF_KEY] call _fnc;
            };
            case CDF_KEY:
            {
                _vehEntry = [_side, CDF_KEY,
                [
                    // Helicopter (total = 80%)
                    RAND_VEH_HELI_L_KEY,    0.6,
                    RAND_VEH_HELI_H_KEY,    0.2,

                    // Plane (total = 20%)
                    RAND_VEH_PLANE_KEY,     0.2,
                ]] call _fnc;
            };
        };
    };
};

if (isNil "_vehEntry") exitWith {};

private _veh = selectRandom (_vehEntry select 0);
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
if (isNil "_vehGroup") exitWith {};

[_vehGroup select 0, _variant, _loadout] call BIS_fnc_initVehicle;

_vehGroup
