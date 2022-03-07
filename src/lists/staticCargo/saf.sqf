/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _faction = SAF_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["rhs_VOG25", 6],
    ["rhsgref_10Rnd_792x57_m76", 6],
    ["rhsgref_30rnd_556x45_m21", 24],
    ["rhssaf_30Rnd_762x39mm_M67", 24],
    ["rhsgref_20rnd_765x17_vz61", 6],
    ["rhsusf_mag_17Rnd_9x19_FMJ", 6],
    ["rhssaf_mag_br_m84", 12],
    ["rhs_mag_smaw_HEAA", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["rhs_weap_m21a", 4],
    ["rhs_weap_m21a_pbg40", 2],
    ["rhs_weap_m21s", 2],
    ["rhs_weap_m70b3n", 4],
    ["rhs_weap_m70b3n_pbg40", 2],
    ["rhs_weap_m92", 2],
    ["rhs_weap_cz99", 1],
    ["rhs_weap_scorpion", 1]
];
_mags =
[
    ["rhsgref_30rnd_556x45_m21", 8],
    ["rhssaf_30Rnd_762x39mm_M67", 8],
    ["rhsgref_20rnd_765x17_vz61", 1],
    ["rhssaf_mag_15Rnd_9x19_FMJ", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons = [["rhs_weap_m76", 4], ["rhs_weap_m84", 1], ["rhs_weap_m82a1", 1]];
_mags = [["rhsgref_10Rnd_792x57_m76", 24], ["rhs_100Rnd_762x54mmR", 3], ["rhsusf_mag_10Rnd_STD_50BMG_M33", 8]];
_items = [["rhs_acc_ekp8_02", 1], ["rhs_acc_pkas", 1], ["rhs_acc_pso1m2", 1], ["rhsusf_acc_premier", 1]];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons = [["rhs_weap_m80", 3], ["rhs_weap_smaw_green", 1], ["rhs_weap_igla", 1]];
_mags = [["rhs_mag_smaw_HEAA", 4], ["rhs_mag_9k38_rocket", 3]];
_items = [["rhs_weap_optic_smaw", 1]];
_backpacks = [];

if (Escape_Saf_Use_Camo) then
{
    switch (_map) do
    {
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _backpacks append [["B_Kitbag_tan", 3]];
        };
        default
        {
            _backpacks append [["rhssaf_kitbag_digital", 3]];
        };
    };
}
else
{
    _backpacks append [["rhssaf_Kitbag_smb", 3]];
};

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
    ["rhssaf_mag_br_m84", 12],
    ["rhssaf_mag_br_m75", 12],
    ["rhssaf_mag_brd_m83_white", 2],
    ["rhssaf_mag_brd_m83_green", 2],
    ["rhssaf_mag_brd_m83_red", 2],
    ["rhssaf_mag_brd_m83_blue", 2],
    ["rhssaf_mag_brd_m83_orange", 2],
    ["rhssaf_mag_brd_m83_yellow", 2],
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
    ["rhssaf_mine_pma3_mag", 5],
    ["rhssaf_mine_tma4_mag", 5],
    ["rhssaf_mine_mrud_a_mag", 5],
    ["rhssaf_mine_mrud_b_mag", 5],
    ["rhssaf_mine_mrud_c_mag", 5],
    ["rhssaf_mine_mrud_d_mag", 5],
    ["rhssaf_tm100_mag", 5],
    ["rhssaf_tm200_mag", 5],
    ["rhssaf_tm500_mag", 5]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_EXPLOSIVES_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////////////// Support box
_weapons = [];
_mags = [];
_items =
[
    ["rhs_acc_2dpZenit", 5],
    ["rhs_acc_pbs1", 5],
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
    ["rhssaf_beret_green", 2],
    ["rhs_tsh4", 2],
    ["rhsusf_hgu56p_visor_saf", 2],
    ["rhs_zsh7a_alt", 2]
];
_backpacks = [];

if (Escape_Saf_Use_Camo) then
{
    switch (_map) do
    {
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append
            [
                ["rhssaf_vest_md12_digital_desert", 2],
                ["rhsgref_6b23_khaki", 2],
                ["rhsgref_6b23_khaki_officer", 2],

                ["rhssaf_bandana_digital_desert", 2],
                ["rhssaf_helmet_m97_black_nocamo", 2],
                ["rhssaf_helmet_m97_black_nocamo_black_ess", 2],
                ["rhssaf_helmet_m97_black_nocamo_black_ess_bare", 2]
            ];
            _backpacks append [["B_Kitbag_tan", 2]];
        };
        default
        {
            _items append
            [
                ["rhssaf_vest_md12_digital_desert", 2],
                ["rhssaf_vest_md12_m70_rifleman", 2],
                ["rhssaf_vest_md99_digital", 2],
                ["rhsgref_6b23_ttsko_digi_officer", 2],

                ["rhssaf_booniehat_digital", 2],
                ["rhssaf_helmet_m97_digital", 2],
                ["rhssaf_helmet_m97_digital_black_ess", 2],
                ["rhssaf_helmet_m97_digital_black_ess_bare", 2]
            ];
            _backpacks append [["rhssaf_kitbag_digital", 2]];
        };
    };
}
else
{
    _items append
    [
        ["rhssaf_vest_md12_digital_desert", 2],
        ["rhssaf_vest_md12_m70_rifleman", 2],
        ["rhssaf_vest_md99_digital", 2],
        ["rhsgref_6b23_ttsko_digi_officer", 2],

        ["rhssaf_booniehat_digital", 2],
        ["rhssaf_helmet_m97_digital", 1],
        ["rhssaf_helmet_m97_digital_black_ess", 1],
        ["rhssaf_helmet_m97_digital_black_ess_bare", 1],
        ["rhssaf_helmet_m97_olive_nocamo", 1],
        ["rhssaf_helmet_m97_olive_nocamo_black_ess", 1],
        ["rhssaf_helmet_m97_olive_nocamo_black_ess_bare", 1]
    ];
    _backpacks append [["rhssaf_Kitbag_smb", 2]];
};

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items = [["rhssaf_uniform_heli_pilot", 4], ["rhssaf_uniform_mig29_pilot", 4]];
_backpacks = [];

if (Escape_Saf_Use_Camo) then
{
    switch (_map) do
    {
        case TAKISTAN_KEY;
        case ZARGABAD_KEY:
        {
            _items append [["rhssaf_uniform_m10_digital_desert", 4]];
        };
        default
        {
            _items append [["rhssaf_uniform_m10_digital_summer", 4]];
        };
    };
}
else
{
    _items append [["rhssaf_uniform_m10_digital_summer", 4]];
};

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
