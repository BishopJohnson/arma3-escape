/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_pos", "_side"];

if (!isServer) exitWith {};

if (typeName _side == "Side") then
{
    _side = str _side;
};

private "_vehGroup";
switch (_side) do
{
    case str west:
    {
        _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnNatoVehicle.sqf";
    };
    case str east:
    {
        private _factionDict = Escape_Random_Vehicles get _side;
        private _factionKeys = keys _factionDict;
        private _faction = selectRandom _factionKeys;
        switch (_faction) do
        {
            case CSAT_KEY:
            {
                _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnCsatVehicle.sqf";
            };
            case CSAT_P_KEY:
            {
                _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnCsatPacificVehicle.sqf";
            };
        };
    };
    case str independent:
    {
        private _factionDict = Escape_Random_Vehicles get _side;
        private _factionKeys = keys _factionDict;
        private _faction = selectRandom _factionKeys;
        switch (_faction) do
        {
            case AAF_KEY:
            {
                _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnAafVehicle.sqf";
            };
            case LDF_KEY:
            {
                _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnLdfVehicle.sqf";
            };
        };
    };
    case str civilian:
    {
        _vehGroup = [_pos] call compile preprocessFile "src\fnc\units\spawnCivilianVehicle.sqf";
    };
};

_vehGroup
