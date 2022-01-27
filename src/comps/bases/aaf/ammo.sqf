/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _side = independent;
private _faction = AAF_KEY;

private _cargoPath = "src\fnc\cargo\cargo.sqf";
private _randCargoPath = "src\fnc\randomCargo\randomCargo.sqf";
private _ammoBoxInit = format ["[this, '%1', '%2'] execVM '%3';", CARGO_AMMO_KEY, _faction, _cargoPath];
private _basicBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'BASIC'] execVM '%4';",
	CARGO_BASIC_WEAPONS_KEY, _faction, _cargoPath, _randCargoPath
];
private _specialBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'SPECIAL'] execVM '%4';",
	CARGO_SPECIAL_WEAPONS_KEY, _faction, _cargoPath, _randCargoPath
];
private _launcherBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'LAUNCHER'] execVM '%4'",
	CARGO_LAUNCHERS_KEY, _faction, _cargoPath, _randCargoPath
];
private _grenadeBoxInit = format ["[this, '%1', '%2'] execVM '%3'", CARGO_GRENADES_KEY, _faction, _cargoPath];
private _explosiveBoxInit = format ["[this, '%1', '%2'] execVM '%3'", CARGO_EXPLOSIVES_KEY, _faction, _cargoPath];
private _supportBoxInit = format ["[this, '%1', '%2'] execVM '%3'", CARGO_SUPPORT_KEY, _faction, _cargoPath];

private _comp =
[
	[
		["CamoNet_INDP_F",[0.112549,6.46387,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[9.26196,0.825195,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[9.2041,2.74219,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-0.11499,9.91162,0],1.35747,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.94824,-0.126953,0],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[10.0398,-0.0551758,0],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[0.197021,10.0376,0],179.31,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-7.15234,7.04785,0],314.698,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[7.28564,7.00586,0],223.805,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[-1.86401,9.96826,0],1.35747,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[0.00439453,10.002,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-10.002,0.00341797,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[10.0024,-0.00439453,0],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[-9.97583,-1.94336,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Short_F",[10.0122,-1.87158,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-7.10059,7.11621,0],135,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Short_F",[-8.39429,5.81494,0],314.698,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[7.15137,7.08691,0],225,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[2.01367,10.0317,0],359.31,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[8.57764,5.72852,0],43.8052,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.99146,-3.69385,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[9.99658,-3.62207,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-3.6792,10.0391,0],181.357,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.69116,4.54297,0],134.698,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[3.76367,10.0371,0],359.31,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[9.83008,4.50586,0],43.8052,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_IND_Ammo_F",[2.00024,5.99951,0],90,1,0,[0,-0],"",_ammoBoxInit,true,false],
		["Box_IND_Wps_F",[4.00024,5.99951,0],0,1,0,[0,0],"",_basicBoxInit,true,false],
		["Box_IND_WpsSpecial_F",[2.00024,3.99951,0],0,1,0,[0,0],"",_specialBoxInit,true,false],
		["Box_IND_WpsLaunch_F",[-1.99976,3.99951,0],0,1,0,[0,0],"",_launcherBoxInit,true,false],
		["Box_IND_Grenades_F",[-1.99976,5.99951,0],90,1,0,[0,-0],"",_grenadeBoxInit,true,false],
		["Box_IND_AmmoOrd_F",[0.000244141,5.99951,0],90,1,0,[0,-0],"",_explosiveBoxInit,true,false],
		["Box_IND_Support_F",[-3.99976,5.99951,0],90,1,0,[0,-0],"",_supportBoxInit,true,false],
		["Box_IND_AmmoVeh_F",[-8.32959,-1.93018,0],0,1,0,[0,0],"","",true,false]
	],
	"n_Ordnance", // Marker type
	20,           // Radius of composition area
	35,           // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_TRUCK_UNARMED_KEY, RAND_VEH_MRAP_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_Truck_02_covered_F",[16.8208,0.191406,0.114967],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false]
];
for  [{ private _i = 0 }, { _i < count _cars }, { _i = _i + 1 }] do
{
	(selectRandom _carEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_cars select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_cars set [_i, _arr];
};
(_comp select 0) append _cars;

// Setup turrets
private _turretEntries =
[
	_side,
	_faction,
	[RAND_VEH_TURRET_L_KEY, RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _turrets =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_HMG_01_high_F",[9.4187,-9.6875,-0.0749998],135,1,0,[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[-10.4978,-9.00049,-0.0749998],225.936,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];
for  [{ private _i = 0 }, { _i < count _turrets }, { _i = _i + 1 }] do
{
	(selectRandom _turretEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_turrets select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_turrets set [_i, _arr];
};
(_comp select 0) append _turrets;

_comp
