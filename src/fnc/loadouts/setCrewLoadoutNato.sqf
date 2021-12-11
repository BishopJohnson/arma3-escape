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
        case "B_Soldier_F";
        case "B_T_Soldier_F";
        case "B_W_Soldier_F":
        {
            [_x] execVM "src\lists\units\nato\rifleman.sqf";
        };
        case "B_Crew_F";
        case "B_T_Crew_F";
        case "B_W_Crew_F":
        {
            [_x] execVM "src\lists\units\nato\crewman.sqf";
        };
        default
        {
            // TODO: Log unhandled unit type.
        };
    };
} forEach _crew;
