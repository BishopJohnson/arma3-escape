/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _faction = RU_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["rhs_45Rnd_545X39_7N10_AK", 6],
    ["rhs_30Rnd_545x39_7N10_AK", 24],
    ["rhs_10Rnd_762x54mmR_7N1", 6],
    ["rhs_mag_9x18_8_57N181S", 6],
    ["rhs_mag_9x19_17", 6],
    ["rhs_VOG25", 3],
    ["rhs_mag_9x19mm_7n21_20", 6],
    ["rhs_mag_rgn", 12],
    ["rhs_rpg7_PG7VR_mag", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["rhs_weap_ak74m", 4],
    ["rhs_weap_ak74m_gp25", 2],
    ["rhs_weap_aks74u", 2],
    ["rhs_weap_pya", 1],
    ["rhs_weap_makarov_pm", 1],
    ["rhs_weap_rpk74m", 2],
    ["rhs_weap_pp2000", 1]
];
_mags =
[
    ["rhs_45Rnd_545X39_7N10_AK", 2],
    ["rhs_mag_9x19_17", 1],
    ["rhs_30Rnd_545x39_7N10_AK", 8],
    ["rhs_mag_9x19mm_7n21_20", 1],
    ["rhs_mag_9x18_8_57N181S", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons =
[
    ["rhs_weap_svdp", 1],
    ["rhs_weap_svds", 1],
    ["rhs_weap_vss", 1],
    ["rhs_weap_asval", 1],
    ["rhs_weap_t5000", 1],
    ["rhs_weap_pkm", 1],
    ["rhs_weap_pkp", 1]
];
_mags =
[
    ["rhs_10Rnd_762x54mmR_7N1", 8],
    ["rhs_20rnd_9x39mm_SP6", 8],
    ["rhs_5Rnd_338lapua_t5000", 8],
    ["rhs_100Rnd_762x54mmR", 3]
];
_items =
[
    ["rhs_acc_1p63", 1],
    ["rhs_acc_1p87", 1],
    ["rhs_acc_ekp1", 1],
    ["rhs_acc_ekp8_02", 1],
    ["rhs_acc_ekp8_18", 1],
    ["rhs_acc_rakursPM", 1],
    ["rhs_acc_pkas", 1],
    ["rhs_acc_dh520x56", 1],
    ["rhs_acc_pso1m2", 1],
    ["rhs_acc_pso1m21", 3]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons =
[
    ["rhs_weap_rpg7", 1],
    ["rhs_weap_rshg2", 2],
    ["rhs_weap_rpg26", 2],
    ["rhs_weap_igla", 1]
];
_mags =
[
    ["rhs_rpg7_PG7VL_mag", 3],
    ["rhs_rpg7_OG7V_mag", 1],
    ["rhs_rpg7_TBG7V_mag", 1],
    ["rhs_rpg7_PG7VR_mag", 1],
    ["rhs_mag_9k38_rocket", 3]
];
_items = [["rhs_acc_pgo7v3", 1]];
_backpacks = [["rhs_rpg_empty", 3]];

(Escape_Static_Cargo get CARGO_LAUNCHERS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Grenades box
_weapons = [];
_mags =
[
    ["rhs_VOG25", 12],
    ["rhs_GRD40_White", 2],
    ["rhs_GRD40_Green", 2],
    ["rhs_GRD40_Red", 2],
    ["rhs_VG40MD", 2],
    ["rhs_mag_rgn", 12],
    ["rhs_mag_rgo", 12],
    ["rhs_mag_nspd", 2],
    ["rhs_mag_nspn_green", 2],
    ["rhs_mag_nspn_red", 2],
    ["rhs_mag_nspn_yellow", 2],
    ["rhs_mag_rdg2_black", 2],
    ["rhs_mag_rdg2_white", 2],
    ["rhs_mag_fakel", 2],
    ["rhs_mag_fakels", 2],
    ["rhs_VG40OP_white", 2],
    ["rhs_VG40OP_green", 2],
    ["rhs_VG40OP_red", 2]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_GRENADES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Explosives box
_weapons = [];
_mags =
[
    ["rhs_mine_msk40p_green_mag", 5],
    ["rhs_mine_msk40p_red_mag", 5],
    ["rhs_mine_msk40p_white_mag", 5],
    ["rhs_mine_sm320_green_mag", 5],
    ["rhs_mine_sm320_red_mag", 5],
    ["rhs_mine_sm320_white_mag", 5],
    ["rhs_mine_ozm72_a_mag", 5],
    ["rhs_mine_ozm72_b_mag", 5],
    ["rhs_mine_ozm72_c_mag", 5],
    ["rhs_mine_pmn2_mag", 5],
    ["rhs_mine_tm62m_mag", 5]
];
_items = [];
_backpacks = [];

if (Escape_Ru_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _mags append [["rhs_ec75_mag", 5], ["rhs_ec200_mag", 5], ["rhs_ec400_mag", 5]];
        };
        default
        {
            _mags append [["rhs_ec75_sand_mag", 5], ["rhs_ec200_sand_mag", 5], ["rhs_ec400_sand_mag", 5]];
        };
    };
}
else
{
    _mags append [["rhs_ec75_sand_mag", 5], ["rhs_ec200_sand_mag", 5], ["rhs_ec400_sand_mag", 5]];
};

(Escape_Static_Cargo get CARGO_EXPLOSIVES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Support box
_weapons = [];
_mags = [];
_items =
[
    ["rhs_acc_2dpZenit", 5],
    ["rhs_acc_perst1ik", 5],
    ["rhs_acc_dtk4short", 5],
    ["rhs_acc_dtk4long", 5],
    ["rhs_acc_pbs1", 5],
    ["rhs_acc_tgpa", 5],
    ["rhs_acc_tgpv", 5],
    ["rhs_acc_tgpv2", 5],
    ["rhs_acc_harris_swivel", 3],
    ["Binocular", 1],
    ["Rangefinder", 1],
    ["ItemGPS", 5],
    ["FirstAidKit", 10],
    ["Medikit", 1],
    ["ToolKit", 1],
    ["MineDetector", 1],
    ["rhs_1PN138", 2]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["rhs_zsh7a_mike_green", 2],
    ["rhs_zsh7a", 2]
];
_backpacks =
[
    ["rhs_sidor", 2],
    ["rhs_rpg_empty", 2]
];

if (Escape_Ru_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case LIVONIA_KEY:
        {
            _items append
            [
                ["rhs_6b45_grn", 2],
                ["rhs_6b45_off", 2],
                ["rhs_6b45_holster", 2],
                ["rhs_6b45_rifleman", 2],
                ["rhs_6b45_rifleman_2", 2],
                ["rhs_6b23_digi_medic", 2],
                ["rhs_6sh117_rifleman", 2],

                ["rhs_vkpo_cap", 2],
                ["rhs_6b47_emr_1", 2],
                ["rhs_6b48", 2]
            ];
            _backpacks append [["rhs_rk_sht_30_emr", 2]];
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append
            [
                ["rhs_6b5_khaki", 2],
                ["rhs_6b5_rifleman_khaki", 2],
                ["rhs_6b5_sniper_khaki", 2],
                ["rhs_6b5_officer_khaki", 2],
                ["rhs_6b5_medic_khaki", 2],

                ["rhs_fieldcap_khk", 2],
                ["rhs_6b27m_green", 2],
                ["rhs_tsh4_ess", 2]
            ];
            _backpacks append [["rhs_assault_umbts", 2]];
        };
        default
        {
            _items append
            [
                ["rhs_6b23", 2],
                ["rhs_6b23_6sh92", 2],
                ["rhs_6b23_6sh92_vog", 2],
                ["rhs_6b23_6sh92_radio", 2],
                ["rhs_6b23_6sh92_headset_mapcase", 2],
                ["rhs_6b23_crew", 2],
                ["rhs_6b23_crewofficer", 2],
                ["rhs_6b23_medic", 2],

                ["rhs_fieldcap_vsr", 2],
                ["rhs_6b26", 2],
                ["rhs_tsh4_ess", 2]
            ];
            _backpacks append [["rhs_assault_umbts", 2]];
        };
    };
}
else
{
    _items append
    [
        ["rhs_6b45_grn", 2],
        ["rhs_6b45_off", 2],
        ["rhs_6b45_holster", 2],
        ["rhs_6b45_rifleman", 2],
        ["rhs_6b45_rifleman_2", 2],
        ["rhs_6b23_digi_medic", 2],
        ["rhs_6sh117_rifleman", 2],

        ["rhs_vkpo_cap", 2],
        ["rhs_6b47_emr_1", 2],
        ["rhs_6b48", 2]
    ];
    _backpacks append [["rhs_rk_sht_30_emr", 2]];
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items = [["rhs_uniform_df15", 4]];
_backpacks = [];

if (Escape_Ru_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case LIVONIA_KEY:
        {
            _items append [["rhs_uniform_flora", 4]];
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append [["rhs_uniform_emr_des_patchless", 4]];
        };
        default
        {
            _items append
            [
                ["rhs_uniform_vkpo", 4],
                ["rhs_uniform_vkpo_alt", 4],
                ["rhs_uniform_vkpo_gloves", 4],
                ["rhs_uniform_vkpo_gloves_alt", 4]
            ];
        };
    };
}
else
{
    _items append
    [
        ["rhs_uniform_vkpo", 4],
        ["rhs_uniform_vkpo_alt", 4],
        ["rhs_uniform_vkpo_gloves", 4],
        ["rhs_uniform_vkpo_gloves_alt", 4]
    ];
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
