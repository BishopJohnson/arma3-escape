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
		    [
				"arifle_AK12_F", "arifle_AK12_arid_F", "arifle_AK12_lush_F",
				"arifle_AK12U_F", "arifle_AK12U_arid_F", "arifle_AK12U_lush_F",
				"arifle_AK12_GL_F", "arifle_AK12_GL_arid_F", "arifle_AK12_GL_lush_F",
				"arifle_AKM_F"
			],
			["30Rnd_762x39_Mag_F", "30Rnd_762x39_Mag_Tracer_F"]
		], // AK 12 and AKM
		
		[
		    ["arifle_TRG21_F", "arifle_TRG21_GL_F", "arifle_TRG20_F"],
			["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"]
		], // TRG
		
		[
		    ["arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F"],
			["30Rnd_556x45_Stanag_red", "30Rnd_556x45_Stanag_Tracer_Red"]
		], // SPAR
		
		[
		    ["arifle_CTAR_blk_F", "arifle_CTAR_hex_F", "arifle_CTAR_ghex_F", "arifle_CTAR_GL_blk_F", "arifle_CTAR_GL_hex_F", "arifle_CTAR_GL_ghex_F"],
			["30Rnd_580x42_Mag_F", "30Rnd_580x42_Mag_Tracer_F"]
		], // CAR-95
		
		[
		    ["LMG_03_F"],
			["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"]
		] // LIM
	], // Common weapons
	
	[
	    [
		    [
				"arifle_MX_F", "arifle_MX_khk_F", "arifle_MX_Black_F",
				"arifle_MX_GL_F", "arifle_MX_GL_khk_F", "arifle_MX_GL_Black_F",
				"arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F"
			],
			["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag_Tracer"]
		], // MX
		
		[
		    ["arifle_Katiba_F", "arifle_Katiba_GL_F", "arifle_Katiba_C_F"],
			["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer"]
		], // Katiba
		
		[
		    ["arifle_Mk20_F", "arifle_Mk20_GL_F", "arifle_Mk20C_F"],
			["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"]
		], // Mk20
		
		[
		    ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F"],
			["100Rnd_65x39_caseless_mag", "100Rnd_65x39_caseless_mag_Tracer"]
		], // MXSW
		
		[
		    ["LMG_Zafir_F"],
			["150Rnd_762x54_Box", "150Rnd_762x54_Box_Tracer"]
		], // Zafir
		
		[
		    ["LMG_Mk200_F", "LMG_Mk200_black_F"],
			["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"]
		], // Mk200
		
		[
			[
				"arifle_MSBS65_F", "arifle_MSBS65_black_F", "arifle_MSBS65_camo_F", "arifle_MSBS65_sand_F",
				"arifle_MSBS65_GL_F", "arifle_MSBS65_GL_black_F", "arifle_MSBS65_GL_camo_F", "arifle_MSBS65_GL_sand_F",
				"arifle_MSBS65_UBS_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_UBS_camo_F", "arifle_MSBS65_UBS_sand_F"
			],
			[
				"30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer",
				"6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug"
			]
		], // Promet
		
		[
			[
				"arifle_RPK12_F",
				"arifle_RPK12_arid_F",
				"arifle_RPK12_lush_F"
			],
			[
				"75rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_Tracer_F",
				"75rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_Tracer_F",
				"75rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_Tracer_F"
			]
		] // RPK
	], // Uncommon weapons
	
	[
	    [
		    ["arifle_ARX_blk_F", "arifle_ARX_hex_F", "arifle_ARX_ghex_F"],
			["30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_green_mag_Tracer", "10Rnd_50BW_Mag_F"]
		], // Type 115
		
		[
		    ["arifle_CTARS_blk_F", "arifle_CTARS_hex_F", "arifle_CTARS_ghex_F"],
			["100Rnd_580x42_Mag_F", "100Rnd_580x42_Mag_Tracer_F"]
		], // CAR-95-1
		
		[
			["arifle_MSBS65_Mark_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_Mark_camo_F", "arifle_MSBS65_Mark_sand_F"],
			["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"]
		], // Promet MR
		
		[
		    ["arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F"],
			["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"]
		], // SPAR LMG
		
		[
		    ["arifle_AKS_F"],
			["30Rnd_545x39_Mag_F"]
		], // AKS
		
		[
		    ["arifle_SDAR_F"],
			["30Rnd_556x45_Stanag_red", "20Rnd_556x45_UW_mag"]
		], // SDAR
		
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
		], // Sting and Protector
		
		[
		    ["hgun_PDW2000_F"],
			["30Rnd_9x21_Mag"]
		], // PDW
		
		[
			["sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F"],
			["2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug"]
		] // Kozlice
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
