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
        case "rhs_msv_rifleman";
        case "rhs_msv_driver_armored":
        {
            [_x] execVM "src\lists\units\ru\rifleman.sqf";
        };
        case "rhs_msv_grenadier":
        {
            [_x] execVM "src\lists\units\ru\grenadier.sqf";
        };
        case "rhs_msv_sergeant":
        {
            [_x] execVM "src\lists\units\ru\sergeant.sqf";
        };
        case "rhs_msv_machinegunner":
        {
            [_x] execVM "src\lists\units\ru\machineGunner.sqf";
        };
        case "rhs_msv_driver":
        {
            [_x] execVM "src\lists\units\ru\driver.sqf";
        };
        case "rhs_msv_crew";
        case "rhs_msv_emr_crew";
        case "rhs_vdv_crew";
        case "rhs_msv_armoredcrew";
        case "rhs_msv_emr_armoredcrew";
        case "rhs_vdv_armoredcrew":
        {
            [_x] execVM "src\lists\units\ru\crew.sqf";
        };
        case "rhs_msv_crew_commander";
        case "rhs_msv_emr_crew_commander";
        case "rhs_vdv_crew_commander":
        {
            [_x] execVM "src\lists\units\ru\crewCommander.sqf";
        };
        case "rhs_pilot";
        case "rhs_pilot_combat_heli";
        case "rhs_pilot_transport_heli":
        {
            // Do nothing
        };
        default
        {
            hint format ["Unhandled unit type %1 for RU crew loadout.", _type];
        };
    };
} forEach _crew;
