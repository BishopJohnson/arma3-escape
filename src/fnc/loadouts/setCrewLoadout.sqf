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
        [_crew] execVM "src\fnc\loadouts\setCrewLoadoutNato.sqf";
    };
    case east:
    {
        if (count _faction == 0) then
        {
            _faction = selectRandom [CSAT_KEY, CSAT_P_KEY];
        };

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
};
