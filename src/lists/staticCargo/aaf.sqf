/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_weapons", "_mags", "_items"];

if (!isServer) exitWith {};

private _include = "IncludeAaf" call BIS_fnc_getParamValue;
if (_include == 0) exitWith {};

private _faction = AAF_KEY;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////// Ammo box
_weapons = [];
_mags =
[
    ["1Rnd_HE_Grenade_shell", 6],
    ["200Rnd_65x39_cased_Box", 3],
    ["20Rnd_762x51_Mag", 6],
    ["30Rnd_556x45_Stanag", 24],
    ["30Rnd_9x21_Mag", 6],
    ["9Rnd_45ACP_Mag", 6],
    ["HandGrenade", 6],
    ["MiniGrenade", 6],
    ["NLAW_F", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_AMMO_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////// Basic weapons box
_weapons =
[
    ["arifle_Mk20_F", 4],
    ["arifle_Mk20_GL_F", 2],
    ["arifle_Mk20C_F", 2],
    ["hgun_ACPC2_F", 1],
    ["hgun_PDW2000_F", 1],
    ["LMG_Mk200_F", 2]
];
_mags =
[
    ["200Rnd_65x39_cased_Box", 2],
    ["30Rnd_556x45_Stanag", 8],
    ["30Rnd_9x21_Mag", 1],
    ["9Rnd_45ACP_Mag", 1]
];
_items = [];
_backpacks = [];

(Escape_Static_Cargo get CARGO_BASIC_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

//////////////////////////////////////////////////////////////////////////////////////////////////// Special weapons box
_weapons =
[
    ["arifle_SDAR_F", 1],
    ["srifle_EBR_F", 4],
    ["srifle_GM6_F", 1]
];
_mags =
[
    ["20Rnd_556x45_UW_mag", 3],
    ["20Rnd_762x51_Mag", 24],
    ["30Rnd_556x45_Stanag", 3],
    ["5Rnd_127x108_Mag", 8]
];
_items =
[
    ["optic_ACO_grn", 1],
    ["optic_DMS", 1],
    ["optic_Holosight", 1],
    ["optic_Holosight_smg", 1],
    ["optic_LRPS", 1],
    ["optic_MRCO", 1],
    ["optic_NVS", 1],
    ["optic_SOS", 1],
    ["optic_TWS", 1],
    ["optic_TWS_MG", 1]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SPECIAL_WEAPONS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Launchers box
_weapons = [["launch_I_Titan_F", 1], ["launch_I_Titan_short_F", 1], ["launch_NLAW_F", 1]];
_mags = [["Titan_AA", 3], ["Titan_AT", 3], ["Titan_AP", 3], ["NLAW_F", 3]];
_items = [];
_backpacks = [["B_Fieldpack_oli", 3]];

if (Escape_Using_Tanks) then
{
    _weapons append [["launch_MRAWS_olive_rail_F", 1]];
    _mags append [["MRAWS_HE_F", 3], ["MRAWS_HEAT_F", 3]];
};

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
    ["I_IR_Grenade", 8],
    ["MiniGrenade", 12],
    ["SmokeShell", 2],
    ["SmokeShellBlue", 2],
    ["SmokeShellGreen", 2],
    ["SmokeShellOrange", 2],
    ["SmokeShellPurple", 2],
    ["SmokeShellRed", 2],
    ["SmokeShellYellow", 2],
    ["UGL_FlareGreen_F", 2],
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
    ["Binocular", 1],
    ["bipod_03_F_blk", 3],
    ["bipod_03_F_oli", 3],
    ["FirstAidKit", 10],
    ["ItemGPS", 5],
    ["Laserdesignator_03", 1],
    ["Medikit", 1],
    ["MineDetector", 1],
    ["muzzle_snds_acp", 5],
    ["muzzle_snds_b", 5],
    ["muzzle_snds_H", 2],
    ["muzzle_snds_L", 5],
    ["muzzle_snds_M", 5],
    ["Rangefinder", 1],
    ["ToolKit", 1]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_SUPPORT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

////////////////////////////////////////////////////////////////////////////////////////////////////////// Equipment box
_weapons = [];
_mags = [];
_items =
[
    ["V_PlateCarrierIA1_dgtl", 2],
    ["V_PlateCarrierIA2_dgtl", 2],
    ["V_BandollierB_oli", 2],
    ["V_Chestrig_oli", 2],
    ["V_Rangemaster_belt", 2],
    ["V_TacVest_oli", 2],
    ["V_RebreatherIA", 2],
    ["H_Booniehat_oli", 2],
    ["H_Booniehat_dgtl", 2],
    ["H_MilCap_dgtl", 2],
    ["H_Cap_blk_Raven", 2],
    ["H_HelmetIA", 10],
    ["H_HelmetCrew_I", 2],
    ["H_CrewHelmetHeli_I", 2],
    ["H_PilotHelmetHeli_I", 2],
    ["H_PilotHelmetFighter_I", 2]
];
_backpacks = [];

if (Escape_Aaf_Use_Camo) then
{
    _items append [["V_PlateCarrierIAGL_dgtl", 2]];
}
else
{
    _items append [["V_PlateCarrierIAGL_dgtl", 1], ["V_PlateCarrierIAGL_oli", 1]];
};

if (Escape_Using_Apex) then { _items append [["V_TacChestrig_oli_F", 2]] };

(Escape_Static_Cargo get CARGO_EQUIPMENT_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Uniforms box
_weapons = [];
_mags = [];
_items =
[
    ["U_I_CombatUniform", 4],
    ["U_I_CombatUniform_shortsleeve", 4],
    ["U_I_OfficerUniform", 4],
    ["U_I_GhillieSuit", 4],
    ["U_I_FullGhillie_ard", 4],
    ["U_I_FullGhillie_lsh", 4],
    ["U_I_FullGhillie_sard", 4],
    ["U_I_HeliPilotCoveralls", 4],
    ["U_I_pilotCoveralls", 4],
    ["U_I_Wetsuit", 4]
];
_backpacks = [];

(Escape_Static_Cargo get CARGO_UNIFORMS_KEY) set [_faction, [_weapons, _mags, _items, _backpacks]];
