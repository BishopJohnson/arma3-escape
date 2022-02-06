/*
    author: Bishop
    description: none
    returns: nothing
*/

#include "..\..\..\define.hpp"

params
[
    "_crew",
    "_side",
    ["_faction", "", [""]]
];

if (!isServer) exitWith {};

switch (_side) do
{
    case west:
    {
        _faction = [_side] call Escape_fnc_GetRandomEnemyFactionOfSide;

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
        _faction = [_side] call Escape_fnc_GetRandomEnemyFactionOfSide;

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
        };
    };
    case independent:
    {
        _faction = [_side] call Escape_fnc_GetRandomEnemyFactionOfSide;

        switch (_faction) do
        {
            case AAF_KEY:
            {
                [_crew] execVM "src\fnc\loadouts\setCrewLoadoutAaf.sqf";
            };
        };
    };
};
