/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_array", "_i", "_rarity", "_weapons", "_ammo", "_weapon"];

if (!isServer) exitWith {};

_array =
[
    [
	    [
		    ["hgun_P07_F", "hgun_P07_snds_F", "hgun_P07_khk_F", "hgun_P07_khk_Snds_F"],
			["16Rnd_9x21_Mag"]
		], // P07
		
		[
		    ["hgun_Rook40_F", "hgun_Rook40_snds_F"],
			["16Rnd_9x21_Mag"]
		], // Rook-40
		
		[
		    ["hgun_ACPC2_F", "hgun_ACPC2_snds_F"],
			["9Rnd_45ACP_Mag"]
		], // ACP-C2
		
		[
		    ["hgun_Pistol_01_F"],
			["10Rnd_9x21_Mag"]
		] // PM 9
	], // Common weapons
	
    [
	    [
		    ["hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_01_green_F"],
			["11Rnd_45ACP_Mag"]
		], // 4-Five
		
		[
		    ["hgun_Pistol_heavy_02_F"],
			["6Rnd_45ACP_Cylinder"]
		], // Zubr
		
		[
		    ["hgun_PDW2000_F", "hgun_PDW2000_snds_F"],
			["30Rnd_9x21_Mag"]
		] // PDW
	], // Uncommon weapons
	
	[
		[
		    ["SMG_03_black", "SMG_03_TR_black", "SMG_03C_black", "SMG_03C_TR_black"],
			["50Rnd_570x28_SMG_03"]
		], // P90
		
		[
		    ["SMG_01_F"],
			["30Rnd_45ACP_Mag_SMG_01"]
		], // Vermin
		
		[
		    ["SMG_02_F", "SMG_05_F"],
			["30Rnd_9x21_Mag_SMG_02"]
		] // Sting and Protector
	] // Rare weapons
];

_i = random 1;

_rarity = _array select 0; // Assumed common as default

// Check for uncommon
if (_i > 0.5) then
{
    _rarity = _array select 1;
};

// Check for rare
if (_i > 0.85) then
{
    _rarity = _array select 2;
};

_weapons = selectRandom _rarity; // Chooses the weapon group

_weapon = selectRandom (_weapons select 0); // Gets the weapon
_ammo = _weapons select 1;                  // Gets the ammo(s)

_array = [_weapon, _ammo];

_array
