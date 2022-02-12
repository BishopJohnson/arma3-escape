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
        case "rhsusf_army_ocp_rifleman";
        case "rhsusf_army_ucp_rifleman";
        case "rhsusf_army_ocp_rifleman_m4";
        case "rhsusf_army_ucp_rifleman_m4";
        case "rhsusf_army_ocp_driver_armored";
        case "rhsusf_army_ucp_driver_armored";
        case "rhsusf_infantry_socom_armysf_rifleman";
        case "rhsusf_socom_marsoc_jtac":
        {
            [_x] execVM "src\lists\units\usArmy\rifleman.sqf";
        };
        case "rhsusf_army_ocp_grenadier";
        case "rhsusf_army_ucp_grenadier":
        {
            [_x] execVM "src\lists\units\usArmy\grenadier.sqf";
        };
        case "rhsusf_army_ocp_driver";
        case "rhsusf_army_ucp_driver":
        {
            [_x] execVM "src\lists\units\usArmy\driver.sqf";
        };
        case "rhsusf_army_ocp_crewman";
        case "rhsusf_army_ucp_crewman";
        case "rhsusf_army_ocp_combatcrewman";
        case "rhsusf_army_ucp_combatcrewman":
        {
            [_x] execVM "src\lists\units\usArmy\crewman.sqf";
        };
        case "rhsusf_army_ocp_helicrew";
        case "rhsusf_army_ucp_helicrew":
        {
            [_x] execVM "src\lists\units\usArmy\heliCrew.sqf";
        };
        case "rhsusf_army_ocp_helipilot";
        case "rhsusf_army_ucp_helipilot";
        case "rhsusf_army_ocp_ah64_pilot";
        case "rhsusf_army_ucp_ah64_pilot":
        {
            [_x] execVM "src\lists\units\usArmy\heliPilot.sqf";
        };
        default
        {
            hint format ["Unhandled unit type %1 for US Army crew loadout.", _type];
        };
    };
} forEach _crew;
