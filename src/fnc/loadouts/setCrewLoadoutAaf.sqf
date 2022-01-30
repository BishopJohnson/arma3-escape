/*
    author: Bishop
    description: none
    returns: nothing
*/

params ["_crew"];

if (!isServer) exitWith {};

{
    switch (typeOf _x) do
    {
        case "I_Soldier_F":
        {
            [_x] execVM "src\lists\units\aaf\rifleman.sqf";
        };
        case "I_Crew_F":
        {
            [_x] execVM "src\lists\units\aaf\crewman.sqf";
        };
        default
        {
            // TODO: Log unhandled unit type.
        };
    };
} forEach _crew;
