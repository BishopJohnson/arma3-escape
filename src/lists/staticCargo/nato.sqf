/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _faction = NATO_KEY;
private _map = worldName;
private _useMapCamo = "IncludeNato" call BIS_fnc_getParamValue == 2;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["11Rnd_45ACP_Mag", 6],
    ["16Rnd_9x21_Mag", 6],
    ["1Rnd_HE_Grenade_shell", 3],
    ["30Rnd_45ACP_Mag_SMG_01", 6],
    ["3Rnd_HE_Grenade_shell", 1],
    ["HandGrenade", 6],
    ["MiniGrenade", 6],
    ["NLAW_F", 1]
];
_items = [];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _mags append [["100Rnd_65x39_caseless_khaki_mag", 6], ["30Rnd_65x39_caseless_khaki_mag", 24]];
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _mags append [["100Rnd_65x39_caseless_black_mag", 6], ["30Rnd_65x39_caseless_black_mag", 24]];
        };
        default
        {
            _mags append [["100Rnd_65x39_caseless_mag", 6], ["30Rnd_65x39_caseless_mag", 24]];
        };
    };
}
else
{
    _mags append [["100Rnd_65x39_caseless_mag", 6], ["30Rnd_65x39_caseless_mag", 24]];
};

if (Escape_Using_Marksmen) then
{
    _mags append [["20Rnd_762x51_Mag", 6]];
};

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons = [["hgun_Pistol_heavy_01_F", 1], ["SMG_01_F", 1]];
_mags = [["11Rnd_45ACP_Mag", 1], ["16Rnd_9x21_Mag", 1], ["30Rnd_45ACP_Mag_SMG_01", 1]];
_items = [];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weapons append
            [
                ["arifle_MX_khk_F", 4],
                ["arifle_MX_GL_khk_F", 2],
                ["arifle_MX_SW_khk_F", 2],
                ["arifle_MXC_khk_F", 2],
                ["hgun_P07_khk_F", 1]
            ];
            _mags append [["100Rnd_65x39_caseless_khaki_mag", 2], ["30Rnd_65x39_caseless_khaki_mag", 8]];
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weapons append
            [
                ["arifle_MX_Black_F", 4],
                ["arifle_MX_GL_Black_F", 2],
                ["arifle_MX_SW_Black_F", 2],
                ["arifle_MXC_Black_F", 2],
                ["hgun_P07_khk_F", 1]
            ];
            _mags append [["100Rnd_65x39_caseless_Black_mag", 2], ["30Rnd_65x39_caseless_Black_mag", 8]];
        };
        default
        {
            _weapons append
            [
                ["arifle_MX_F", 4],
                ["arifle_MX_GL_F", 2],
                ["arifle_MX_SW_F", 2],
                ["arifle_MXC_F", 2],
                ["hgun_P07_F", 1]
            ];
            _mags append [["100Rnd_65x39_caseless_mag", 2], ["30Rnd_65x39_caseless_mag", 8]];
        };
    };
}
else
{
    _weapons append
    [
        ["arifle_MX_F", 4],
        ["arifle_MX_GL_F", 2],
        ["arifle_MX_SW_F", 2],
        ["arifle_MXC_F", 2],
        ["hgun_P07_F", 1]
    ];
    _mags append [["100Rnd_65x39_caseless_Black_mag", 2], ["30Rnd_65x39_caseless_Black_mag", 8]];
};

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons = [["arifle_SDAR_F", 1]];
_mags = [["30Rnd_556x45_Stanag_red", 3], ["20Rnd_556x45_UW_mag", 3], ["7Rnd_408_mag", 8]];
_items =
[
    ["optic_ACO", 1],
    ["optic_ACO_smg", 1],
    ["optic_DMS", 1],
    ["optic_MRD", 1],
    ["optic_NVS", 1],
    ["optic_TWS", 1],
    ["optic_TWS_MG", 1]
];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weapons append [["arifle_MXM_Black_F", 1], ["srifle_LRR_F", 1]];
            _mags append [["30Rnd_65x39_caseless_black_mag", 6]];
            _items append [["optic_Hamr", 1], ["optic_Holosight_blk_F", 1], ["optic_SOS", 1], ["optic_LRPS", 1]];

            if (Escape_Using_Marksmen) then
            {
                _weapons append [["MMG_02_black_F", 1], ["srifle_DMR_02_F", 1], ["srifle_DMR_03_F", 1]];
                _mags append [["130Rnd_338_Mag", 3], ["10Rnd_338_Mag", 6], ["20Rnd_762x51_Mag", 6]];
                _items append [["optic_AMS", 3]];
            };
        };
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weapons append [["arifle_MXM_khk_F", 1], ["srifle_LRR_tna_F", 1]];
            _mags append [["30Rnd_65x39_caseless_khaki_mag", 6]];
            _items append
            [
                ["optic_Hamr_khk_F", 1],
                ["optic_Holosight_khk_F", 1],
                ["optic_SOS_khk_F", 1],
                ["optic_LRPS_tna_F", 1]
            ];

            if (Escape_Using_Marksmen) then
            {
                _weapons append [["MMG_02_black_F", 1], ["srifle_DMR_02_camo_F", 1], ["srifle_DMR_03_khaki_F", 1]];
                _mags append [["130Rnd_338_Mag", 3], ["10Rnd_338_Mag", 6], ["20Rnd_762x51_Mag", 6]];
                _items append [["optic_AMS_khk", 3]];
            };
        };
        default
        {
            _weapons append [["arifle_MXM_F", 1], ["srifle_LRR_camo_F", 1]];
            _mags append [["30Rnd_65x39_caseless_mag", 6]];
            _items append [["optic_Hamr", 1], ["optic_Holosight", 1], ["optic_SOS", 1], ["optic_LRPS", 1]];

            if (Escape_Using_Marksmen) then
            {
                _weapons append [["MMG_02_camo_F", 1], ["srifle_DMR_02_sniper_F", 1], ["srifle_DMR_03_tan_F", 1]];
                _mags append [["130Rnd_338_Mag", 3], ["10Rnd_338_Mag", 6], ["20Rnd_762x51_Mag", 6]];
                _items append [["optic_AMS_snd", 3]];
            };
        };
    };
}
else
{
    _weapons append [["arifle_MXM_F", 1], ["srifle_LRR_camo_F", 1]];
    _mags append [["30Rnd_65x39_caseless_mag", 6]];
    _items append [["optic_Hamr", 1], ["optic_Holosight", 1], ["optic_SOS", 1], ["optic_LRPS", 1]];

    if (Escape_Using_Marksmen) then
    {
        _weapons append [["MMG_02_sand_F", 1], ["srifle_DMR_02_sniper_F", 1], ["srifle_DMR_03_tan_F", 1]];
        _mags append [["130Rnd_338_Mag", 3], ["10Rnd_338_Mag", 6], ["20Rnd_762x51_Mag", 6]];
        _items append [["optic_AMS", 3]];
    };
};

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons = [["launch_NLAW_F", 1]];
_mags = [["NLAW_F", 3], ["Titan_AA", 3], ["Titan_AP", 3], ["Titan_AT", 3]];
_items = [];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Contact);
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weapons append [["launch_B_Titan_tna_F", 1], ["launch_B_Titan_short_tna_F", 1]];

            if (Escape_Using_Tanks) then
            {
                _weapons append [["launch_MRAWS_green_F", 1]];
                _mags append [["MRAWS_HE_F", 3], ["MRAWS_HEAT_F", 3]];
            };
        };
        default
        {
            _weapons append [["launch_B_Titan_F", 1], ["launch_B_Titan_short_F", 1]];

            if (Escape_Using_Tanks) then
            {
                _weapons append [["launch_MRAWS_sand_F", 1]];
                _mags append [["MRAWS_HE_F", 3], ["MRAWS_HEAT_F", 3]];
            };
        };
    };
}
else
{
    if (Escape_Using_Tanks) then
    {
        _weapons append [["launch_MRAWS_sand_F", 1]];
        _mags append [["MRAWS_HE_F", 3], ["MRAWS_HEAT_F", 3]];
    };
};

(Escape_Static_Cargo get CARGO_LAUNCHERS_KEY) set [_faction, [_weapons, _mags, _items]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Grenades box
_weapons = [];
_mags =
[
    ["1Rnd_HE_Grenade_shell", 3],
    ["1Rnd_Smoke_Grenade_shell", 2],
    ["1Rnd_SmokeBlue_Grenade_shell", 2],
    ["1Rnd_SmokeGreen_Grenade_shell", 2],
    ["1Rnd_SmokeOrange_Grenade_shell", 2],
    ["1Rnd_SmokePurple_Grenade_shell", 2],
    ["1Rnd_SmokeRed_Grenade_shell", 2],
    ["1Rnd_SmokeYellow_Grenade_shell", 2],
    ["3Rnd_HE_Grenade_shell", 3],
    ["B_IR_Grenade", 8],
    ["HandGrenade", 12],
    ["MiniGrenade", 12],
    ["SmokeShell", 2],
    ["SmokeShellBlue", 2],
    ["SmokeShellGreen", 2],
    ["SmokeShellOrange", 2],
    ["SmokeShellPurple", 2],
    ["SmokeShellRed", 2],
    ["SmokeShellYellow", 2],
    ["UGL_FlareGreen_F", 2],
    ["UGL_FlareWhite_F", 2]
];
_items = [];

(Escape_Static_Cargo get CARGO_GRENADES_KEY) set [_faction, [_weapons, _mags, _items]];

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

if (Escape_Using_Orange) then
{
    _mags append [["APERSMineDispenser_Mag", 5]];
};

(Escape_Static_Cargo get CARGO_EXPLOSIVES_KEY) set [_faction, [_weapons, _mags, _items]];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Support box
_weapons = [];
_mags = [["Laserbatteries", 5]];
_items =
[
    ["acc_flashlight", 5],
    ["acc_pointer_IR", 5],
    ["muzzle_snds_acp", 5],
    ["muzzle_snds_L", 5],
    ["Binocular", 1],
    ["FirstAidKit", 10],
    ["ItemGPS", 5],
    ["Medikit", 1],
    ["MineDetector", 1],
    ["Rangefinder", 1],
    ["ToolKit", 1]
];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["bipod_01_F_blk", 8],
                ["Laserdesignator_01_khk_F", 1],
                ["muzzle_snds_H", 10],
                ["NVGoggles_INDEP", 4]
            ];

            if (Escape_Using_Apex) then { _items append [["NVGogglesB_blk_F", 6]] };
            if (Escape_Using_Marksmen) then
            {
                _items append [["muzzle_snds_338_black", 6], ["muzzle_snds_b", 5]];
            };
        };
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _items append
            [
                ["bipod_01_F_khk", 8],
                ["bipod_01_F_blk", 2],
                ["Laserdesignator_01_khk_F", 1],
                ["muzzle_snds_H_khk_F", 10],
                ["NVGoggles_tna_F", 4],
                ["NVGogglesB_grn_F", 6]
            ];

            if (Escape_Using_Marksmen) then
            {
                _items append [["muzzle_snds_338_green", 4], ["muzzle_snds_338_black", 2], ["muzzle_snds_b_khk_F", 5]];
            };
        };
        default
        {
            _items append
            [
                ["bipod_01_F_snd", 6],
                ["bipod_01_F_mtp", 2],
                ["Laserdesignator", 1],
                ["muzzle_snds_H", 10],
                ["NVGoggles", 4]
            ];

            if (Escape_Using_Apex) then { _items append [["NVGogglesB_gry_F", 6]] };
            if (Escape_Using_Marksmen) then { _items append [["muzzle_snds_338_sand", 6], ["muzzle_snds_b_snd_F", 5]] };
        };
    };
}
else
{
    _items append
    [
        ["bipod_01_F_snd", 4],
        ["bipod_01_F_blk", 4],
        ["Laserdesignator", 1],
        ["muzzle_snds_H", 10],
        ["NVGoggles", 4]
    ];

    if (Escape_Using_Apex) then { _items append [["NVGogglesB_gry_F", 3], ["NVGogglesB_blk_F", 3]] };
    if (Escape_Using_Marksmen) then
    {
        _items append [["muzzle_snds_338_sand", 3], ["muzzle_snds_338_black", 3], ["muzzle_snds_b_snd_F", 5]];
    };
};

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["V_PlateCarrier1_rgr_noflag_F", 2],
    ["V_PlateCarrier2_rgr_noflag_F", 2],
    ["V_PlateCarrier1_blk", 2],
    ["V_PlateCarrier2_blk", 2],
    ["V_PlateCarrierGL_blk", 1],
    ["V_PlateCarrierSpec_blk", 1],
    ["V_TacVest_blk", 2],
    ["V_Chestrig_rgr", 2],
    ["V_Chestrig_blk", 2],
    ["V_BandollierB_rgr", 2],
    ["V_BandollierB_blk", 2],
    ["V_Rangemaster_belt", 2],
    ["V_RebreatherB", 2],
    ["H_HelmetCrew_B", 2],
    ["H_CrewHelmetHeli_B", 2],
    ["H_PilotHelmetHeli_B", 2],
    ["H_PilotHelmetFighter_B", 2]
];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["V_PlateCarrier1_wdl", 2],
                ["V_PlateCarrier2_wdl", 2],
                ["V_PlateCarrierGL_wdl", 2],
                ["V_PlateCarrierSpec_wdl", 2],
                ["H_Booniehat_wdl", 4],
                ["H_MilCap_wdl", 2],
                ["H_HelmetB_plain_wdl", 7],
                ["H_HelmetB_Light_wdl", 6],
                ["H_HelmetSpecB_wdl", 6]
            ];

            if (Escape_Using_Apex) then { _items append [["V_TacChestrig_grn_F", 2], ["H_HelmetB_TI_tna_F", 2]] };
        };
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _items append
            [
                ["V_PlateCarrier1_tna_F", 2],
                ["V_PlateCarrier2_tna_F", 2],
                ["V_PlateCarrierGL_tna_F", 2],
                ["V_PlateCarrierSpec_tna_F", 2],
                ["V_TacChestrig_grn_F", 2],
                ["H_Booniehat_tna_F", 4],
                ["H_MilCap_tna_F", 2],
                ["H_HelmetB_tna_F", 7],
                ["H_HelmetB_Light_tna_F", 6],
                ["H_HelmetB_Enh_tna_F", 6],
                ["H_HelmetB_TI_tna_F", 2]
            ];
        };
        default
        {
            _items append
            [
                ["V_PlateCarrierSpec_mtp", 2],
                ["V_PlateCarrierGL_mtp", 2],
                ["V_PlateCarrier1_rgr", 2],
                ["V_PlateCarrier2_rgr", 2],
                ["H_Booniehat_mcamo", 4],
                ["H_MilCap_mcamo", 2],
                ["H_Cap_tan_specops_US", 2],

                ["H_HelmetB", 1],
                ["H_HelmetB_black", 1],
                ["H_HelmetB_camo", 1],
                ["H_HelmetB_desert", 1],
                ["H_HelmetB_grass", 1],
                ["H_HelmetB_sand", 1],
                ["H_HelmetB_snakeskin", 1],

                ["H_HelmetB_light", 1],
                ["H_HelmetB_light_black", 1],
                ["H_HelmetB_light_desert", 1],
                ["H_HelmetB_light_grass", 1],
                ["H_HelmetB_light_sand", 1],
                ["H_HelmetB_light_snakeskin", 1],

                ["H_HelmetSpecB", 1],
                ["H_HelmetSpecB_blk", 1],
                ["H_HelmetSpecB_paint1", 1],
                ["H_HelmetSpecB_paint2", 1],
                ["H_HelmetSpecB_sand", 1],
                ["H_HelmetSpecB_snakeskin", 1]
            ];

            if (Escape_Using_Apex) then { _items append [["V_TacChestrig_grn_F", 2], ["H_HelmetB_TI_arid_F", 2]] };
        };
    };
}
else
{
    _items append
    [
        ["V_PlateCarrierSpec_rgr", 2],
        ["V_PlateCarrierGL_rgr", 2],
        ["V_PlateCarrier1_rgr", 2],
        ["V_PlateCarrier2_rgr", 2],
        ["H_Booniehat_mcamo", 2],
        ["H_Booniehat_tan", 2],
        ["H_MilCap_mcamo", 2],
        ["H_Cap_tan_specops_US", 2],

        ["H_HelmetB", 1],
        ["H_HelmetB_black", 1],
        ["H_HelmetB_camo", 1],
        ["H_HelmetB_desert", 1],
        ["H_HelmetB_grass", 1],
        ["H_HelmetB_sand", 1],
        ["H_HelmetB_snakeskin", 1],

        ["H_HelmetB_light", 1],
        ["H_HelmetB_light_black", 1],
        ["H_HelmetB_light_desert", 1],
        ["H_HelmetB_light_grass", 1],
        ["H_HelmetB_light_sand", 1],
        ["H_HelmetB_light_snakeskin", 1],

        ["H_HelmetSpecB", 1],
        ["H_HelmetSpecB_blk", 1],
        ["H_HelmetSpecB_paint1", 1],
        ["H_HelmetSpecB_paint2", 1],
        ["H_HelmetSpecB_sand", 1],
        ["H_HelmetSpecB_snakeskin", 1]
    ];

    if (Escape_Using_Apex) then { _items append [["V_TacChestrig_grn_F", 2], ["H_HelmetB_TI_arid_F", 2]] };
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items =
[
    ["U_B_CTRG_1", 4],
    ["U_B_CTRG_2", 4],
    ["U_B_CTRG_3", 4],
    ["U_B_HeliPilotCoveralls", 4],
    ["U_B_PilotCoveralls", 4],
    ["U_B_Wetsuit", 4]
];

if (_useMapCamo) then
{
    switch true do
    {
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _items append
            [
                ["U_B_CombatUniform_mcam_wdl_f", 4],
                ["U_B_CombatUniform_tshirt_mcam_wdL_f", 4],
                ["U_B_CombatUniform_vest_mcam_wdl_f", 4],
                ["U_B_FullGhillie_lsh", 4]
            ];

            if (Escape_Using_Apex) then
            {
                _items append
                [
                    ["U_B_CTRG_Soldier_F", 4],
                    ["U_B_CTRG_Soldier_2_F", 4],
                    ["U_B_CTRG_Soldier_3_F", 4],
                    ["U_B_T_FullGhillie_tna_F", 4]
                ];
            };
        };
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _items append
            [
                ["U_B_T_Soldier_AR_F", 4],
                ["U_B_T_Soldier_F", 4],
                ["U_B_T_Soldier_SL_F", 4],
                ["U_B_CTRG_Soldier_F", 4],
                ["U_B_CTRG_Soldier_2_F", 4],
                ["U_B_CTRG_Soldier_3_F", 4],
                ["U_B_T_Sniper_F", 4],
                ["U_B_FullGhillie_lsh", 4],
                ["U_B_T_FullGhillie_tna_F", 4]
            ];
        };
        default
        {
            _items append
            [
                ["U_B_CombatUniform_mcam", 4],
                ["U_B_CombatUniform_mcam_tshirt", 4],
                ["U_B_CombatUniform_mcam_vest", 4],
                ["U_B_GhillieSuit", 4],
                ["U_B_FullGhillie_ard", 4],
                ["U_B_FullGhillie_lsh", 4],
                ["U_B_FullGhillie_sard", 4]
            ];

            if (Escape_Using_Apex) then
            {
                _items append
                [
                    ["U_B_CTRG_Soldier_Arid_F", 4],
                    ["U_B_CTRG_Soldier_2_Arid_F", 4],
                    ["U_B_CTRG_Soldier_3_Arid_F", 4]
                ];
            };
        };
    };
}
else
{
    _items append
    [
        ["U_B_CombatUniform_mcam", 4],
        ["U_B_CombatUniform_mcam_tshirt", 4],
        ["U_B_CombatUniform_mcam_vest", 4],
        ["U_B_GhillieSuit", 4],
        ["U_B_FullGhillie_ard", 4],
        ["U_B_FullGhillie_lsh", 4],
        ["U_B_FullGhillie_sard", 4]
    ];

    if (Escape_Using_Apex) then
    {
        _items append
        [
            ["U_B_CTRG_Soldier_Arid_F", 4],
            ["U_B_CTRG_Soldier_2_Arid_F", 4],
            ["U_B_CTRG_Soldier_3_Arid_F", 4]
        ];
    };
};

if (Escape_Using_Apex) then
{
    _items append
    [
        ["U_B_CTRG_Soldier_urb_1_F", 4],
        ["U_B_CTRG_Soldier_urb_2_F", 4],
        ["U_B_CTRG_Soldier_urb_3_F", 4]
    ];
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items]];
