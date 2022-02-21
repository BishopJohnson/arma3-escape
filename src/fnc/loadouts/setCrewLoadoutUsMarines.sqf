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
        case "rhsusf_usmc_marpat_d_rifleman";
        case "rhsusf_usmc_marpat_d_rifleman_m4";
        case "rhsusf_infantry_socom_armysf_rifleman";
        case "rhsusf_socom_marsoc_jtac":
        {
            [_x] execVM "src\lists\units\usMarines\rifleman.sqf";
        };
        case "rhsusf_usmc_marpat_d_driver":
        {
            [_x] execVM "src\lists\units\usMarines\driver.sqf";
        };
        case "rhsusf_usmc_marpat_d_crewman";
        case "rhsusf_usmc_marpat_d_combatcrewman":
        {
            [_x] execVM "src\lists\units\usMarines\crewman.sqf";
        };
        case "rhsusf_usmc_marpat_d_helicrew":
        {
            [_x] execVM "src\lists\units\usMarines\heliCrew.sqf";
        };
        case "rhsusf_usmc_marpat_d_helipilot":
        {
            [_x] execVM "src\lists\units\usMarines\heliPilot.sqf";
        };
        default
        {
            hint format ["Unhandled unit type %1 for US Marines crew loadout.", _type];
        };
    };
} forEach _crew;
