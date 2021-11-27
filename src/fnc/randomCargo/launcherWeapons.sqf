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
		    ["launch_MRAWS_sand_F", "launch_MRAWS_green_F", "launch_MRAWS_olive_F", "launch_MRAWS_sand_rail_F", "launch_MRAWS_green_rail_F", "launch_MRAWS_olive_rail_F"],
			["MRAWS_HEAT_F", "MRAWS_HE_F"]
		], // MRAWS Mod 1 and MRAWS Mod 0
		
		[
		    ["launch_RPG32_F", "launch_RPG32_ghex_F", "launch_RPG32_green_F"],
			["RPG32_F", "RPG32_HE_F"]
		], // RPG 32
		
		[
		    ["launch_RPG7_F"],
			["RPG7_F"]
		] // RPG 7
	], // Common weapons
	
	[
	    [
		    ["launch_NLAW_F"],
			["NLAW_F"]
		], // PCML
		
		[
		    ["launch_O_Vorona_brown_F", "launch_O_Vorona_green_F"],
			["Vorona_HEAT", "Vorona_HE"]
		] // Vorona
	], // Uncommon weapons
	
	[
	    [
		    ["launch_Titan_F", "launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_B_Titan_olive_F", "launch_O_Titan_F", "launch_O_Titan_ghex_F", "launch_I_Titan_F", "launch_I_Titan_eaf_F"],
			["Titan_AA"]
		], // Titan AA
		
		[
		    ["launch_Titan_short_F", "launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_O_Titan_short_ghex_F", "launch_I_Titan_short_F"],
			["Titan_AT", "Titan_AP"]
		] // Titan AT
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
