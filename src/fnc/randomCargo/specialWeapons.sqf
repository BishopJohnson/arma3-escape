/*
    author: Bishop Johnson
	
	arguments:
	
	return: [String, Array]
*/

private ["_array", "_i", "_rarity", "_weapons", "_ammo", "_weapon"];

if (!isServer) exitWith {};

_array =
[
    [
	    [
		    ["srifle_DMR_06_camo_F", "srifle_DMR_06_olive_F", "srifle_DMR_06_hunter_F"],
			["20Rnd_762x51_Mag"]
		], // Mk14
		
		[
		    ["arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F"],
			["20Rnd_762x51_Mag"]
		], // SPAR marksmen
		
		[
		    ["srifle_EBR_F"],
			["20Rnd_762x51_Mag"]
		], // Mk18 ABR
		
		[
		    ["srifle_DMR_03_F", "srifle_DMR_03_khaki_F", "srifle_DMR_03_multicam_F", "srifle_DMR_03_tan_F", "srifle_DMR_03_woodland_F"],
			["20Rnd_762x51_Mag"]
		], // MkI EMR
		
		[
		    ["srifle_DMR_04_F", "srifle_DMR_04_Tan_F"],
			["10Rnd_127x54_Mag"]
		], // ASP-1
		
		[
		    ["srifle_DMR_07_blk_F", "srifle_DMR_07_hex_F", "srifle_DMR_07_ghex_F"],
			["20Rnd_650x39_Cased_Mag_F"]
		] // CMR-76
	], // Common weapons
	
	[
	    [
		    ["MMG_01_hex_F", "MMG_01_tan_F"],
			["150Rnd_93x64_Mag"]
		], // Navid
		
		[
		    ["MMG_02_black_F", "MMG_02_sand_F", "MMG_02_camo_F"],
			["200Rnd_338_Mag"]
		], // SPMG
		
		[
		    ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F"],
			["30Rnd_65x39_caseless_mag"]
		], // MXM
		
		[
		    ["srifle_DMR_01_F"],
			["10Rnd_762x54_Mag"]
		], // Rahim
		
		[
		    ["srifle_DMR_02_F", "srifle_DMR_02_camo_F", "srifle_DMR_02_sniper_F"],
			["10Rnd_338_Mag"]
		], // MAR-10
		
		[
		    ["srifle_DMR_05_blk_F", "srifle_DMR_05_hex_F", "srifle_DMR_05_tan_f"],
			["10Rnd_93x64_DMR_05_Mag"]
		] // Cyrus
	], // Uncommon weapons
	
	[
	    [
		    ["srifle_LRR_F", "srifle_LRR_camo_F", "srifle_LRR_tna_F"],
			["7Rnd_408_Mag"]
		], // LRR
		
		[
		    ["srifle_GM6_F", "srifle_GM6_camo_F", "srifle_GM6_ghex_F"],
			["5Rnd_127x108_Mag", "5Rnd_127x108_APDS_Mag"]
		] // Lynex
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
