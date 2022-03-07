/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _faction = US_ARMY_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["rhsusf_100Rnd_556x45_soft_pouch", 6],
    ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 24],
    ["rhsusf_20Rnd_762x51_m118_special_Mag", 6],
    ["rhsusf_mag_17Rnd_9x19_JHP", 6],
    ["rhsusf_mag_15Rnd_9x19_FMJ", 6],
    ["rhs_mag_M433_HEDP", 3],
    ["rhsusf_mag_40Rnd_46x30_FMJ", 6],
    ["rhsusf_mag_6Rnd_M433_HEDP", 1],
    ["rhs_mag_m67", 12],
    ["rhs_mag_maaws_HEAT", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["rhs_weap_m4", 1],
    ["rhs_weap_m4_carryhandle", 1],
    ["rhs_weap_m4_m203", 1],
    ["rhs_weap_m4_carryhandle_m203", 1],

    ["rhs_weap_m4a1", 1],
    ["rhs_weap_m4a1_carryhandle", 1],
    ["rhs_weap_m4a1_M203", 1],
    ["rhs_weap_m4a1_carryhandle_M203", 1],

    ["rhs_weap_m16a4", 1],
    ["rhs_weap_m16a4_carryhandle", 1],
    ["rhs_weap_m16a4_carryhandle_M203", 1],

    ["rhs_weap_m249_light_L", 2],
    ["rhsusf_weap_glock17g4", 1],
    ["rhsusf_weap_m9", 1],
    ["rhsusf_weap_MP7A2", 1]
];
_mags =
[
    ["rhsusf_100Rnd_556x45_soft_pouch", 2],
    ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 8],
    ["rhsusf_mag_17Rnd_9x19_JHP", 1],
    ["rhsusf_mag_15Rnd_9x19_FMJ", 1],
    ["rhsusf_mag_40Rnd_46x30_FMJ", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons =
[
    ["rhs_weap_m240B", 1],
    ["rhs_weap_m14ebrri", 1],
    ["rhs_weap_M590_8RD", 1],
    ["rhs_weap_m32", 1]
];
_mags =
[
    ["rhsusf_50Rnd_762x51", 3],
    ["rhsusf_20Rnd_762x51_m118_special_Mag", 6],
    ["rhsusf_5Rnd_300winmag_xm2010", 6],
    ["rhsusf_5Rnd_762x51_m993_Mag", 3],
    ["rhsusf_5Rnd_762x51_m62_Mag", 3],
    ["rhsusf_mag_10Rnd_STD_50BMG_M33", 8],
    ["rhsusf_8Rnd_00Buck", 6],
    ["rhsusf_mag_6Rnd_M433_HEDP", 3]
];
_items =
[
    ["rhsusf_acc_eotech_552", 1],
    ["rhsusf_acc_compm4", 1],
    ["rhsusf_acc_ACOG", 1],
    ["rhsusf_acc_ACOG2", 1],
    ["rhsusf_acc_ELCAN_ard", 1],
    ["rhsusf_acc_LEUPOLDMK4", 1]
];
_backpacks = [];

if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _weapons append
            [
                ["rhs_weap_XM2010_wd", 1],
                ["rhs_weap_m24sws_wd", 1],
                ["rhs_weap_M107_w", 1]
            ];
            _weapons append
            [
                ["rhsusf_acc_LEUPOLDMK4_wd", 1],
                ["rhsusf_acc_LEUPOLDMK4_2", 2]
            ];
        };
        default
        {
            _weapons append
            [
                ["rhs_weap_XM2010_d", 1],
                ["rhs_weap_m24sws_d", 1],
                ["rhs_weap_M107_d", 1]
            ];
            _items append
            [
                ["rhsusf_acc_LEUPOLDMK4_d", 1],
                ["rhsusf_acc_LEUPOLDMK4_2_d", 2]
            ];
        };
    };
}
else
{
    _weapons append
    [
        ["rhs_weap_XM2010", 1],
        ["rhs_weap_m24sws", 1],
        ["rhs_weap_M107", 1]
    ];
    _items append
    [
        ["rhsusf_acc_LEUPOLDMK4", 1],
        ["rhsusf_acc_LEUPOLDMK4_2", 2]
    ];
};

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons =
[
    ["rhs_weap_M136", 2],
    ["rhs_weap_M136_hedp", 2],
    ["rhs_weap_M136_hp", 2],
    ["rhs_weap_maaws", 1],
    ["rhs_weap_fgm148", 1], // Javelin
    ["rhs_weap_fim92", 1]   // Stinger
];
_mags =
[
    ["rhs_mag_maaws_HEAT", 2],
    ["rhs_mag_maaws_HEDP", 2],
    ["rhs_mag_maaws_HE", 2],
    ["rhs_fgm148_magazine_AT", 3],  // Javelin missile
    ["rhs_fim92_mag", 3]            // Stinger missile
];
_items = [["rhs_optic_maaws", 1]];
_backpacks = [["rhsusf_assault_eagleaiii_ucp", 3]];

(Escape_Static_Cargo get CARGO_LAUNCHERS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Grenades box
_weapons = [];
_mags =
[
    ["rhs_mag_M397_HET", 3],
    ["rhs_mag_M433_HEDP", 3],
    ["rhs_mag_m713_Red", 2],
    ["rhs_mag_m714_White", 2],
    ["rhs_mag_m715_Green", 2],
    ["rhs_mag_m716_yellow", 2],
    ["rhsusf_mag_6Rnd_M397_HET", 3],
    ["rhsusf_mag_6Rnd_M433_HEDP", 3],
    ["rhs_mag_m67", 24],
    ["rhs_mag_an_m8hc", 2],
    ["rhs_mag_m18_green", 2],
    ["rhs_mag_m18_purple", 2],
    ["rhs_mag_m18_red", 2],
    ["rhs_mag_m18_yellow", 2],
    ["rhs_mag_m661_green", 2],
    ["rhs_mag_M583A1_white", 2],
    ["rhs_mag_mk84", 2],
    ["rhs_mag_mk3a2", 32],
    ["rhs_mag_m7a3_cs", 2],
    ["rhs_mag_an_m14_th3", 2]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_GRENADES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Explosives box
_weapons = [];
_mags =
[
    ["rhsusf_m112_mag", 5],
    ["rhsusf_m112x4_mag", 5],
    ["rhsusf_mine_m14_mag", 5],
    ["SLAMDirectionalMine_Wire_Mag", 5],
    ["ClaymoreDirectionalMine_Remote_Mag", 5],
    ["rhs_mine_M19_mag", 5],
    ["rhsusf_mine_m49a1_3m_mag", 5],
    ["rhsusf_mine_m49a1_6m_mag", 5],
    ["rhsusf_mine_m49a1_10m_mag", 5]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_EXPLOSIVES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Support box
_weapons = [];
_mags = [];
_items =
[
    ["rhsusf_acc_nt4_black", 5],
    ["rhsusf_acc_rotex5_grey", 5],
    ["rhsusf_acc_SF3P556", 5],
    ["rhsusf_acc_SFMB556", 5],
    ["rhsusf_acc_aac_762sd_silencer", 5],
    ["rhsusf_acc_omega9k", 5],
    ["rhsusf_acc_rotex_mp7", 5],

    ["rhsusf_acc_grip1", 2],
    ["rhsusf_acc_grip2", 2],
    ["rhsusf_acc_grip3", 2],
    ["rhsusf_acc_grip4", 2],
    ["rhsusf_acc_grip4_bipod", 2],
    ["rhsusf_acc_kac_grip", 2],
    ["rhsusf_acc_harris_bipod", 2],
    ["rhsusf_acc_saw_bipod", 2],
    ["rhsusf_acc_saw_lw_bipod", 2],
    ["rhsusf_acc_kac_grip_saw_bipod", 2],
    ["rhsusf_acc_grip_m203_blk", 2],

    ["rhsusf_acc_M952V", 5],
    ["acc_flashlight_pistol", 5],

    ["Binocular", 1],
    ["Rangefinder", 1],
    ["FirstAidKit", 10],
    ["ItemGPS", 5],
    ["Medikit", 1],
    ["MineDetector", 1],
    ["ToolKit", 1],
    ["rhsusf_ANPVS_14", 4],
    ["rhsusf_ANPVS_15", 4]
];
_backpacks = [];

if (Escape_Us_Army_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _items append
            [
                ["rhsusf_acc_m24_muzzlehider_wd", 5],
                ["rhsusf_acc_m24_silencer_wd", 5],

                ["rhsusf_acc_anpeq15side_bk", 5],
                ["rhsusf_acc_anpeq15_bk_top", 5],
                ["rhsusf_acc_anpeq15_bk", 5],
                ["rhsusf_acc_anpeq15_bk_light", 5]
            ];
        };
        default
        {
            _items append
            [
                ["rhsusf_acc_m24_muzzlehider_d", 5],
                ["rhsusf_acc_m24_silencer_d", 5],

                ["rhsusf_acc_anpeq15side", 5],
                ["rhsusf_acc_anpeq15_top", 5],
                ["rhsusf_acc_anpeq15", 5],
                ["rhsusf_acc_anpeq15_light", 5]
            ];
        };
    };
}
else
{
    _items append
    [
        ["rhsusf_acc_m24_muzzlehider_black", 5],
        ["rhsusf_acc_m24_silencer_black", 5],

        ["rhsusf_acc_anpeq15side", 5],
        ["rhsusf_acc_anpeq15_top", 5],
        ["rhsusf_acc_anpeq15", 5],
        ["rhsusf_acc_anpeq15_light", 5]
    ];
};

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["H_Cap_headphones", 2],
    ["rhsusf_hgu56p_mask", 2],
    ["rhsusf_hgu56p", 2],
    ["RHS_jetpilot_usaf", 2]
];
_backpacks = [["rhsusf_falconii", 2]];

if (Escape_Us_Marines_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _items append [["rhsusf_cvc_green_ess", 2]];
        };
        default
        {
            _items append [["rhsusf_cvc_ess", 2]];
        };
    };
}
else
{
    _items append [["rhsusf_cvc_ess", 2]];
};

if (Escape_Us_Army_Use_Ucp) then
{
    _items append
    [
        ["rhsusf_iotv_ucp", 2],
        ["rhsusf_iotv_ucp_Rifleman", 2],
        ["rhsusf_iotv_ucp_Grenadier", 2],
        ["rhsusf_iotv_ucp_SAW", 2],
        ["rhsusf_iotv_ucp_Teamleader", 2],
        ["rhsusf_iotv_ucp_Squadleader", 2],
        ["rhsusf_iotv_ucp_Medic", 2],
        ["rhsusf_iotv_ucp_Repair", 2],
        ["rhsusf_patrolcap_ucp", 2],
        ["rhs_Booniehat_ucp", 2],
        ["rhsusf_ach_helmet_ucp", 2],
        ["rhsusf_ach_helmet_ESS_ucp", 2],
        ["rhsusf_ach_helmet_headset_ucp", 2],
        ["rhsusf_ach_helmet_headset_ess_ucp", 2]
    ];
    _backpacks append [["rhsusf_assault_eagleaiii_ucp", 2]];
}
else
{
    _items append
    [
        ["rhsusf_iotv_ocp", 2],
        ["rhsusf_iotv_ocp_Rifleman", 2],
        ["rhsusf_iotv_ocp_Grenadier", 2],
        ["rhsusf_iotv_ocp_SAW", 2],
        ["rhsusf_iotv_ocp_Teamleader", 2],
        ["rhsusf_iotv_ocp_Squadleader", 2],
        ["rhsusf_iotv_ocp_Medic", 2],
        ["rhsusf_iotv_ocp_Repair", 2],
        ["rhsusf_patrolcap_ocp", 2],
        ["rhs_Booniehat_ocp", 2],
        ["rhsusf_ach_helmet_ocp", 2],
        ["rhsusf_ach_helmet_ESS_ocp", 2],
        ["rhsusf_ach_helmet_headset_ocp", 2],
        ["rhsusf_ach_helmet_headset_ess_ocp", 2]
    ];
    _backpacks append [["rhsusf_assault_eagleaiii_ocp", 2]];
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items = [["U_B_HeliPilotCoveralls", 4]];
_backpacks = [];

if (Escape_Us_Army_Use_Ucp) then
{
    _items append [["rhs_uniform_acu_ucp2", 4]];
}
else
{
    _items append [["rhs_uniform_acu_oefcp", 4]];
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
