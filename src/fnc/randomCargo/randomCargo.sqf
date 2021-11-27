/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object - 
		String - 
		Number (Optional) - 
		Number (Optional) - 
*/

#define DEFAULT_WEAPONS 5
#define DEFAULT_AMMO 8

params ["_box", "_type"];

private ["_weaponCount", "_ammoCount", "_weapon", "_i", "_j"];

if (!isServer) exitWith {};

_weaponCount = DEFAULT_WEAPONS;
_ammoCount = DEFAULT_AMMO;

if (count _this > 2) then {_weaponCount = _this select 2;};
if (count _this > 3) then {_ammoCount = _this select 3;};

switch (_type) do
{
    case "BASIC":
	{
	    _type = "src\fnc\randomCargo\basicWeapons.sqf";
	};
	case "SPECIAL":
	{
	    _type = "src\fnc\randomCargo\specialWeapons.sqf";
	};
	case "LAUNCHER":
	{
	    _type = "src\fnc\randomCargo\launcherWeapons.sqf";
	};
	case "START":
	{
	    _type = "src\fnc\randomCargo\startWeapons.sqf";
	};
	default
	{
	    _type = nil;
	};
};

/*if (isNil _type) exitWith {hint "is nil";};*/

for [{_i = 0}, {_i < _weaponCount}, {_i = _i + 1}] do
{
    _weapon = [] call compile preprocessFile _type;
	
	_box addWeaponCargoGlobal [_weapon select 0, 1];
	
	for [{_j = 0}, {_j < (count (_weapon select 1))}, {_j = _j + 1}] do
	{
	    _box addMagazineCargoGlobal [(_weapon select 1) select _j, _ammoCount];
	};
};
