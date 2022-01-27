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
        case "O_Soldier_F";
        case "O_T_Soldier_F":
        {
            [_x] execVM "src\lists\units\csatP\rifleman.sqf";
        };
        case "O_Crew_F";
        case "O_T_Crew_F":
        {
            [_x] execVM "src\lists\units\csatP\crewman.sqf";
        };
        default
        {
            // TODO: Log unhandled unit type.
        };
    };
} forEach _crew;
