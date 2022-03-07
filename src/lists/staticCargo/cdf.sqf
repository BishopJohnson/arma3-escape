/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _faction = CDF_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["rhs_VOG25", 6],
    ["rhs_45Rnd_545X39_7N6M_AK", 3],
    ["rhsgref_10Rnd_792x57_m76", 6],
    ["rhs_30Rnd_545x39_7N6M_AK", 24],
    ["rhsgref_20rnd_765x17_vz61", 6],
    ["rhsusf_mag_17Rnd_9x19_FMJ", 6],
    ["rhs_mag_rgd5", 12],
    ["rhs_rpg7_PG7VL_mag", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["rhs_weap_aks74", 4],
    ["rhs_weap_ak74_gp25", 2],
    ["rhs_weap_aks74u", 2],
    ["rhsusf_weap_glock17g4", 1],
    ["rhs_weap_scorpion", 1],
    ["rhs_weap_rpk74m", 2]
];
_mags =
[
    ["rhs_45Rnd_545X39_7N6M_AK", 2],
    ["rhs_30Rnd_545x39_7N6M_AK", 8],
    ["rhsgref_20rnd_765x17_vz61", 1],
    ["rhsusf_mag_17Rnd_9x19_FMJ", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons = [["rhs_weap_m76", 4], ["rhs_weap_pkm", 1]];
_mags = [["rhsgref_10Rnd_792x57_m76", 24], ["rhs_100Rnd_762x54mmR", 3]];
_items = [["rhs_acc_pso1m2", 1]];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons = [["rhs_weap_rpg75", 3], ["rhs_weap_rpg7", 1], ["rhs_weap_igla", 1]];
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
    ["rhs_mag_rgd5", 12],
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

if (Escape_Cdf_Use_Camo) then
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
    ["rhs_acc_dtk4short", 5],
    ["rhs_acc_pbs1", 5],
    ["rhs_acc_tgpa", 5],
    ["Binocular", 1],
    ["Rangefinder", 1],
    ["ItemGPS", 5],
    ["FirstAidKit", 10],
    ["Medikit", 1],
    ["ToolKit", 1],
    ["MineDetector", 1]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["rhs_vest_commander", 2],
    ["rhs_tsh4", 2],
    ["rhs_tsh4_ess", 2],
    ["rhs_zsh7a_mike", 2]
];
_backpacks = [["rhs_rpg_empty", 2]];

if (Escape_Cdf_Use_Camo) then
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
                ["rhs_6b5", 2],
                ["rhs_6b5_rifleman", 2],
                ["rhs_6b5_officer", 2],
                ["rhs_6b5_medic", 2],
                ["rhs_6b5_sniper", 2],

                ["rhsgref_6b27m_ttsko_forest", 2],
                ["rhsgref_fieldcap_ttsko_forest", 2]
            ];
            _backpacks append
            [
                ["rhsgref_wdl_alicepack", 2],
                ["B_Carryall_oli", 2]
            ];
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append
            [
                ["rhs_6b5_khaki", 2],
                ["rhs_6b5_rifleman_khaki", 2],
                ["rhs_6b5_officer_khaki", 2],
                ["rhs_6b5_medic_khaki", 2],
                ["rhs_6b5_sniper_khaki", 2],

                ["rhsgref_helmet_pasgt_3color_desert", 4]
            ];
            _backpacks append
            [
                ["rhsgref_hidf_alicepack", 2],
                ["B_Carryall_cbr", 2]
            ];
        };
        default
        {
            _items append
            [
                ["rhs_6b5_ttsko", 2],
                ["rhs_6b5_rifleman_ttsko", 2],
                ["rhs_6b5_officer_ttsko", 2],
                ["rhs_6b5_medic_ttsko", 2],
                ["rhs_6b5_sniper_ttsko", 2],

                ["rhsgref_6b27m_ttsko_mountain", 2],
                ["rhsgref_fieldcap_ttsko_mountain", 2]
            ];
            _backpacks append
            [
                ["rhsgref_ttsko_alicepack", 2],
                ["B_Carryall_oli", 2]
            ];
        };
    };
}
else
{
    _items append
    [
        ["rhs_6b5_ttsko", 2],
        ["rhs_6b5_rifleman_ttsko", 2],
        ["rhs_6b5_officer_ttsko", 2],
        ["rhs_6b5_medic_ttsko", 2],
        ["rhs_6b5_sniper_ttsko", 2],

        ["rhsgref_6b27m_ttsko_mountain", 2],
        ["rhsgref_fieldcap_ttsko_mountain", 2]
    ];
    _backpacks append
    [
        ["rhsgref_ttsko_alicepack", 2],
        ["B_Carryall_oli", 2]
    ];
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items = [];
_backpacks = [];

if (Escape_Cdf_Use_Camo) then
{
    switch (_map) do
    {
        case BYSTRICA_KEY;
        case CHERNARUS_KEY;
        case CHERNARUS_SUMMER_KEY;
        case LIVONIA_KEY;
        case TANOA_KEY:
        {
            _items append [["rhsgref_uniform_ttsko_forest", 4]];
        };
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append [["rhsgref_uniform_3color_desert", 4]];
        };
        default
        {
            _items append [["rhsgref_uniform_ttsko_mountain", 4]];
        };
    };
}
else
{
    _items append [["rhsgref_uniform_ttsko_mountain", 4]];
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
