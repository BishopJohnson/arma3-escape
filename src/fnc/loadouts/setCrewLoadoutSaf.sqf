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
        case "rhssaf_army_m93_oakleaf_summer_crew";
        case "rhssaf_army_m10_digital_crew";
        case "rhssaf_army_m10_para_crew":
        {
            [_x] execVM "src\lists\units\saf\crewLight.sqf";
        };
        case "rhssaf_army_m10_digital_crew_armored":
        {
            [_x] execVM "src\lists\units\saf\crew.sqf";
        };
        case "rhssaf_army_m10_digital_crew_armored_nco":
        {
            [_x] execVM "src\lists\units\saf\crewCommander.sqf";
        };
        case "rhsgref_cdf_air_pilot":
        {
            [_x] execVM "src\lists\units\saf\heliPilot.sqf";
        };
        default
        {
            hint format ["Unhandled unit type %1 for SAF crew loadout.", _type];
        };
    };
} forEach _crew;
