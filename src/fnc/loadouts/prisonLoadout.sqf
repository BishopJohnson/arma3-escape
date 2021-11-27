/*

*/

params ["_side"];

private ["_weaponData", "_weapon", "_magazine"];

if (!hasInterface) exitWith {};

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "ItemRadio";

switch (_side) do
{
	case west:			{ player forceAddUniform "U_B_CombatUniform_mcam" };
	case east: 			{ player forceAddUniform "U_O_SpecopsUniform_ocamo" };
	case independent:	{ player forceAddUniform "U_I_CombatUniform" };
};

_weaponData = selectRandomWeighted
[/*  weapons                                                                        ammo                        weight */
	[["hgun_P07_F", "hgun_P07_snds_F", "hgun_P07_khk_F", "hgun_P07_khk_Snds_F"],	"16Rnd_9x21_Mag"],			4.0, // P07
	[["hgun_Rook40_F", "hgun_Rook40_snds_F"],										"16Rnd_9x21_Mag"],			4.0, // Rook
	[["hgun_ACPC2_F", "hgun_ACPC2_snds_F"],											"9Rnd_45ACP_Mag"],			3.5, // ACP
	[["hgun_Pistol_01_F"],															"10Rnd_9x21_Mag"],			1.0, // PM9
	[["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_snds_F"],						"11Rnd_45ACP_Mag"],			2.0, // 4-Five
	[["hgun_Pistol_heavy_02_F"],													"6Rnd_45ACP_Cylinder"],		2.0, // Zubr
	[["hgun_PDW2000_F", "hgun_PDW2000_snds_F"],										"30Rnd_9x21_Mag"],			1.0, // PDW
	[["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],		"50Rnd_570x28_SMG_03"],		0.5, // ADR
	[["SMG_01_F"],																	"30Rnd_45ACP_Mag_SMG_01"],	0.8, // Vermin
	[["SMG_02_F", "SMG_05_F"],														"30Rnd_9x21_Mag_SMG_02"],	0.8  // Sting and Protector
];

_weapon   = selectRandom (_weaponData select 0);
_magazine = _weaponData select 1;

for [{private _i = 0}, {_i < 3}, {_i = _i + 1}] do
{
	player addMagazine _magazine;
};
player addWeapon _weapon;
