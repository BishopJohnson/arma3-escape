/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object - 
		String - 
		Number (Optional) - 
		Number (Optional) - 
*/

#include "..\..\..\define.hpp"

#define DEFAULT_WEAPON_COUNT 5
#define DEFAULT_AMMO_COUNT 8

params
[
    "_box",
    "_type",
    ["_weaponCount", DEFAULT_WEAPON_COUNT, [0]],
    ["_ammoCount", DEFAULT_AMMO_COUNT, [0]]
];

if (!isServer) exitWith {};

private "_map";
switch (_type) do
{
    case "BASIC":
	{
	    _map = Escape_Random_Cargo_Basic;
	};
	case "SPECIAL":
	{
	    _map = Escape_Random_Cargo_Special;
	};
	case "LAUNCHER":
	{
	    _map = Escape_Random_Cargo_Launcher;
	};
	case "START":
	{
	    _map = Escape_Random_Cargo_Prison;
	};
	default
	{
	    _map = nil;
	};
};

if (isNil "_map") exitWith { hint format ["Recieved invalid random cargo type '%1'", _type] };

for [{ private _i = 0 }, { _i < _weaponCount }, { _i = _i + 1 }] do
{
    private _rarity = selectRandomWeighted
    [/* commonality key          weight */
        RAND_CARGO_COMMON_KEY,   0.5,
        RAND_CARGO_UNCOMMON_KEY, 0.35,
        RAND_CARGO_RARE_KEY,     0.15
    ];

    private _weaponGroupKeys = [_map, _rarity] call DICT_fnc_get call DICT_fnc_keys;
    private _weaponGroup = [_map, _rarity, selectRandom _weaponGroupKeys] call DICT_fnc_get;

	_box addWeaponCargoGlobal [selectRandom (_weaponGroup select 0), 1];

	{
	    _box addMagazineCargoGlobal [_x, _ammoCount];
	} forEach _weaponGroup select 1;
};
