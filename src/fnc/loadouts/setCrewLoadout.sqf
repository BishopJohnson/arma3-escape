/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_crew", "_side", "_faction"];

if (!isServer) exitWith {};

if (typeName _side == "Side") then { _side = str _side };

switch (_side) do
{
    case str west:
    {
        switch (_faction) do
        {
            case NATO_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
            case US_ARMY_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutUsArmy.sqf";
            };
            case US_MARINES_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutUsMarines.sqf";
            };
        };
    };
    case str east:
    {
        switch (_faction) do
        {
            case CSAT_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutCsat.sqf";
            };
            case CSAT_P_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutCsatPacific.sqf";
            };
            case RU_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutRu.sqf";
            };
        };
    };
    case str independent:
    {
        switch (_faction) do
        {
            case AAF_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutAaf.sqf";
            };
            case LDF_KEY:
            {
                // TODO: Execute for LDF.
            };
            case CDF_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutCdf.sqf";
            };
        };
    };
};
