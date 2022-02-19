/*
    author: Bishop
    description: none
    returns: nothing
*/

params ["_crew"];

if (!isServer) exitWith {};

{
    private _type = typeOf _x;
    switch (_type) do
    {
        case "rhsgref_cdf_reg_rifleman":
        {
            [_x] execVM "src\lists\units\cdf\rifleman.sqf";
        };
        case "rhsgref_cdf_reg_crew";
        case "rhsgref_cdf_para_crew":
        {
            [_x] execVM "src\lists\units\cdf\crew.sqf";
        };
        case "rhsgref_cdf_reg_crew_commander":
        {
            [_x] execVM "src\lists\units\cdf\crewCommander.sqf";
        };
        case "rhsgref_cdf_air_pilot":
        {
            [_x] execVM "src\lists\units\cdf\pilot.sqf";
        };
        default
        {
            hint format ["Unhandled unit type %1 for CDF crew loadout.", _type];
        };
    };
} forEach _crew;
