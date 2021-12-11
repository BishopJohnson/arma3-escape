/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params ["_crew", "_side", "_faction"];

if (!isServer) exitWith {};

switch (_side) do
{
    case west:
    {
        switch (_faction) do
        {
            case NATO_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
        };
    };
    case east:
    {
        switch (_faction) do
        {
            case CSAT_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
            case CSAT_P_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
        };
    };
    case independent:
    {
        switch (_faction) do
        {
            case AAF_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
            case LDF_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
            };
        };
    };
};
