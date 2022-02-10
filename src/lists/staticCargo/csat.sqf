/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _include = "IncludeIranian" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _faction = CSAT_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["10Rnd_762x54_Mag", 12],
    ["150Rnd_762x54_Box", 4],
    ["16Rnd_9x21_Mag", 6],
    ["1Rnd_HE_Grenade_shell", 6],
    ["30Rnd_65x39_caseless_green", 24],
    ["30Rnd_9x21_Mag_SMG_02", 6],
    ["6Rnd_45ACP_Cylinder", 6],
    ["HandGrenade", 6],
    ["MiniGrenade", 6],
    ["RPG32_F", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["arifle_Katiba_C_F", 2],
    ["arifle_Katiba_F", 4],
    ["arifle_Katiba_GL_F", 2],
    ["hgun_Pistol_heavy_02_F", 1],
    ["hgun_Rook40_F", 1],
    ["LMG_Zafir_F", 2],
    ["SMG_02_F", 1]
];
_mags =
[
    ["150Rnd_762x54_Box", 2],
    ["16Rnd_9x21_Mag", 1],
    ["30Rnd_65x39_caseless_green", 8],
    ["30Rnd_9x21_Mag_SMG_02", 1],
    ["6Rnd_45ACP_Cylinder", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons = [["arifle_SDAR_F", 1], ["srifle_DMR_01_F", 1]];
_mags =
[
    ["20Rnd_556x45_UW_mag", 3],
    ["30Rnd_556x45_Stanag_green", 3],
    ["10Rnd_762x54_Mag", 8],
    ["5Rnd_127x108_APDS_Mag", 4],
    ["5Rnd_127x108_Mag", 4]
];
_items =
[
    ["optic_ACO_grn", 1],
    ["optic_ACO_grn_smg", 1],
    ["optic_Nightstalker", 1],
    ["optic_SOS", 1],
    ["optic_TWS", 1],
    ["optic_TWS_MG", 1],
    ["optic_Yorris", 1]
];
_backpacks = [];

if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weapons append [["srifle_GM6_ghex_F", 1]];
            _items append [["optic_ARCO_ghex_F", 1], ["optic_DMS_ghex_F", 1], ["optic_LRPS_ghex_F", 1]];

            if (Escape_Using_Marksmen) then
            {
                _weapons append [["MMG_01_tan_F", 1], ["srifle_DMR_04_F", 1], ["srifle_DMR_05_blk_F", 1]];
                _mags append [["10Rnd_127x54_Mag", 8], ["10Rnd_93x64_DMR_05_Mag", 8], ["150Rnd_93x64_Mag", 3]];
                _items append [["optic_KHS_blk", 3]];
            };
        };
        default
        {
            _weapons append [["srifle_GM6_camo_F", 1]];
            _items append [["optic_ARCO", 1], ["optic_DMS", 1], ["optic_LRPS", 1]];

            if (Escape_Using_Marksmen) then
            {
                _weapons append [["MMG_01_hex_F", 1], ["srifle_DMR_04_Tan_F", 1], ["srifle_DMR_05_hex_F", 1]];
                _mags append [["10Rnd_127x54_Mag", 8], ["10Rnd_93x64_DMR_05_Mag", 8], ["150Rnd_93x64_Mag", 3]];
                _items append [["optic_KHS_hex", 2], ["optic_KHS_tan", 1]];
            };
        };
    };
}
else
{
    _weapons append [["srifle_GM6_F", 1]];
    _items append [["optic_ARCO_blk_F", 1], ["optic_DMS", 1], ["optic_LRPS", 1]];

    if (Escape_Using_Marksmen) then
    {
        _weapons append [["MMG_01_hex_F", 1], ["srifle_DMR_04_F", 1], ["srifle_DMR_05_blk_F", 1]];
        _mags append [["10Rnd_127x54_Mag", 8], ["10Rnd_93x64_DMR_05_Mag", 8], ["150Rnd_93x64_Mag", 3]];
        _items append [["optic_KHS_blk", 3]];
    };
};

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons = [];
_mags = [["RPG32_F", 3], ["RPG32_HE_F", 1], ["Titan_AA", 3], ["Titan_AP", 2], ["Titan_AT", 3]];
_items = [];
_backpacks = [];

if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weapons append
            [
                ["launch_RPG32_ghex_F", 1],
                ["launch_O_Titan_ghex_F", 1],
                ["launch_O_Titan_short_ghex_F", 1]
            ];
            _backpacks append [["B_FieldPack_ghex_F", 3]];

            if (Escape_Using_Tanks) then { _weapons append [["launch_O_Vorona_green_F", 1]] };
        };
        default
        {
            _weapons append [["launch_RPG32_F", 1], ["launch_O_Titan_F", 1], ["launch_O_Titan_short_F", 1]];
            _backpacks append [["B_FieldPack_ocamo", 3]];

            if (Escape_Using_Tanks) then { _weapons append [["launch_O_Vorona_brown_F", 1]] };
        };
    };
}
else
{
    _weapons append [["launch_RPG32_F", 1], ["launch_O_Titan_F", 1], ["launch_O_Titan_short_F", 1]];
    _backpacks append [["B_FieldPack_ocamo", 3]];

    if (Escape_Using_Tanks) then { _weapons append [["launch_O_Vorona_brown_F", 1]] };
};

if (Escape_Using_Tanks) then { _mags append [["Vorona_HE", 1], ["Vorona_HEAT", 1]] };

(Escape_Static_Cargo get CARGO_LAUNCHERS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Grenades box
_weapons = [];
_mags =
[
    ["1Rnd_HE_Grenade_shell", 12],
    ["1Rnd_Smoke_Grenade_shell", 2],
    ["1Rnd_SmokeBlue_Grenade_shell", 2],
    ["1Rnd_SmokeGreen_Grenade_shell", 2],
    ["1Rnd_SmokeOrange_Grenade_shell", 2],
    ["1Rnd_SmokePurple_Grenade_shell", 2],
    ["1Rnd_SmokeRed_Grenade_shell", 2],
    ["1Rnd_SmokeYellow_Grenade_shell", 2],
    ["HandGrenade", 12],
    ["MiniGrenade", 12],
    ["O_IR_Grenade", 8],
    ["SmokeShell", 2],
    ["SmokeShellBlue", 2],
    ["SmokeShellGreen", 2],
    ["SmokeShellOrange", 2],
    ["SmokeShellPurple", 2],
    ["SmokeShellRed", 2],
    ["SmokeShellYellow", 2],
    ["UGL_FlareRed_F", 2],
    ["UGL_FlareYellow_F", 2]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_GRENADES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Explosives box
_weapons = [];
_mags =
[
    ["APERSBoundingMine_Range_Mag", 5],
    ["APERSMine_Range_Mag", 5],
    ["APERSTripMine_Wire_Mag", 5],
    ["ATMine_Range_Mag", 5],
    ["ClaymoreDirectionalMine_Remote_Mag", 5],
    ["DemoCharge_Remote_Mag", 5],
    ["SatchelCharge_Remote_Mag", 5],
    ["SLAMDirectionalMine_Wire_Mag", 5]
];
_items = [];
_backpacks = [];

if (Escape_Using_Orange) then { _mags append [["APERSMineDispenser_Mag", 5]] };

(Escape_Static_Cargo get CARGO_EXPLOSIVES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Support box
_weapons = [];
_mags = [["Laserbatteries", 5]];
_items =
[
    ["acc_flashlight", 5],
    ["acc_pointer_IR", 5],
    ["muzzle_snds_acp", 5],
    ["muzzle_snds_H", 5],
    ["muzzle_snds_b", 5],
    ["muzzle_snds_L", 5],
    ["Binocular", 1],
    ["Rangefinder", 1],
    ["ItemGPS", 5],
    ["FirstAidKit", 10],
    ["Medikit", 1],
    ["ToolKit", 1],
    ["MineDetector", 1],
    ["O_NVGoggles_urb_F", 2]
];
_backpacks = [];

if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["bipod_02_F_blk", 2],
                ["bipod_02_F_tan", 1],
                ["Laserdesignator_02_ghex_F", 1],
                ["O_NVGoggles_ghex_F", 4]
            ];

            if (Escape_Using_Marksmen) then { _items append [["muzzle_snds_93mmg", 5]] };
            if (Escape_Using_Apex) then { _items append [["muzzle_snds_65_TI_ghex_F", 2]] };
        };
        default
        {
            _items append
            [
                ["bipod_02_F_hex", 2],
                ["bipod_02_F_tan", 1],
                ["Laserdesignator_02", 1],
                ["O_NVGoggles_hex_F", 4]
            ];

            if (Escape_Using_Marksmen) then { _items append [["muzzle_snds_93mmg_tan", 5]] };
            if (Escape_Using_Apex) then { _items append [["muzzle_snds_65_TI_hex_F", 2]] };
        };
    };
}
else
{
    _items append [["bipod_02_F_blk", 2], ["bipod_02_F_hex", 1], ["Laserdesignator_02", 1], ["NVGoggles_OPFOR", 4]];

    if (Escape_Using_Marksmen) then { _items append [["muzzle_snds_93mmg", 5]] };
    if (Escape_Using_Apex) then { _items append [["muzzle_snds_65_TI_blk_F", 2]] };
};

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["V_TacVest_blk", 2],
    ["V_Rangemaster_belt", 2],
    ["V_HarnessO_gry", 2],
    ["V_HarnessOGL_gry", 2],
    ["V_RebreatherIR", 2],
    ["H_HelmetLeaderO_oucamo", 2],
    ["H_HelmetO_oucamo", 2],
    ["H_HelmetSpecO_blk", 2],
    ["H_CrewHelmetHeli_O", 2],
    ["H_PilotHelmetHeli_O", 2],
    ["H_PilotHelmetFighter_O", 2]
];
_backpacks = [];

if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["V_TacVest_oli", 2],
                ["V_BandollierB_ghex_F", 2],
                ["V_Chestrig_oli", 2],
                ["V_HarnessO_ghex_F", 2],
                ["V_HarnessOGL_ghex_F", 2],
                ["H_Booniehat_oli", 2],
                ["H_HelmetCrew_O_ghex_F", 2],
                ["H_HelmetLeaderO_ghex_F", 2],
                ["H_HelmetO_ghex_F", 2],
                ["H_HelmetSpecO_ghex_F", 2],
                ["H_MilCap_ghex_F", 2]
            ];

            if (Escape_Using_Apex) then { _items append [["V_TacChestrig_oli_F", 2]] };
            if (Escape_Using_Contact) then { _items append [["H_HelmetO_ViperSP_ghex_F", 2]] };
        };
        default
        {
            _items append
            [
                ["V_TacVest_khk", 2],
                ["V_BandollierB_khk", 2],
                ["V_Chestrig_khk", 2],
                ["V_HarnessO_brn", 2],
                ["V_HarnessOGL_brn", 2],
                ["H_Cap_brn_SPECOPS", 2],
                ["H_Booniehat_khk", 2],
                ["H_HelmetCrew_O", 2],
                ["H_HelmetLeaderO_ocamo", 2],
                ["H_HelmetO_ocamo", 2],
                ["H_HelmetSpecO_ocamo", 2],
                ["H_MilCap_ocamo", 2]
            ];

            if (Escape_Using_Apex) then { _items append [["V_TacChestrig_cbr_F", 2]] };
            if (Escape_Using_Contact) then { _items append [["H_HelmetO_ViperSP_hex_F", 2]] };
        };
    };
}
else
{
    _items append
    [
        ["V_TacVest_khk", 2],
        ["V_BandollierB_khk", 2],
        ["V_Chestrig_khk", 2],
        ["V_HarnessO_brn", 2],
        ["V_HarnessOGL_brn", 2],
        ["H_Cap_brn_SPECOPS", 2],
        ["H_Booniehat_khk", 2],
        ["H_HelmetCrew_O", 2],
        ["H_HelmetLeaderO_ocamo", 2],
        ["H_HelmetO_ocamo", 2],
        ["H_HelmetSpecO_ocamo", 2],
        ["H_MilCap_ocamo", 2]
    ];

    if (Escape_Using_Apex) then { _items append [["V_TacChestrig_cbr_F", 2]] };
    if (Escape_Using_Contact) then { _items append [["H_HelmetO_ViperSP_hex_F", 2]] };
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items =
[
    ["U_O_CombatUniform_oucamo", 4],
    ["U_O_Wetsuit", 4],
    ["U_O_PilotCoveralls", 4]
];
_backpacks = [];

if (Escape_Csat_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex);
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["U_O_T_Soldier_F", 4],
                ["U_O_T_Officer_F", 4],
                ["U_O_T_Sniper_F", 4],
                ["U_O_T_FullGhillie_tna_F", 4]
            ];

            if (Escape_Using_Apex) then { _items append [["U_O_V_Soldier_Viper_F", 4]] };
        };
        default
        {
            _items append
            [
                ["U_O_CombatUniform_ocamo", 4],
                ["U_O_OfficerUniform_ocamo", 4],
                ["U_O_GhillieSuit", 4],
                ["U_O_FullGhillie_ard", 4],
                ["U_O_FullGhillie_lsh", 4],
                ["U_O_FullGhillie_sard", 4]
            ];

            if (Escape_Using_Apex) then { _items append [["U_O_V_Soldier_Viper_hex_F", 4]] };
        };
    };
}
else
{
    _items append
    [
        ["U_O_CombatUniform_ocamo", 4],
        ["U_O_OfficerUniform_ocamo", 4],
        ["U_O_GhillieSuit", 4],
        ["U_O_FullGhillie_ard", 4],
        ["U_O_FullGhillie_lsh", 4],
        ["U_O_FullGhillie_sard", 4]
    ];

    if (Escape_Using_Apex) then { _items append [["U_O_V_Soldier_Viper_hex_F", 4]] };
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
