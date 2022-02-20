/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _side = independent;
private _faction = CDF_KEY;

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
		["Land_CamoNet_EAST_EP1",[0.112061,6.46436,0.456253],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[9.26172,0.825684,0],360,1,0,[-4.66034e-006,-1.60593e-005],"","",true,false],
		["Land_WaterBarrel_F",[9.20386,2.74268,0],4.54064e-005,1,0,[7.10394e-006,-1.04418e-005],"","",true,false],
		["Land_BagFence_End_F",[-0.11499,9.91211,-0.000999928],1.35747,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.94849,-0.126465,-0.000999928],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[10.0396,-0.0546875,-0.000999928],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[0.196777,10.0381,-0.000999928],179.31,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-7.15259,7.04883,-0.000999928],314.698,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[7.2854,7.00586,-0.000999928],223.805,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[-1.86426,9.96924,-0.000999928],1.35747,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[0.00415039,10.0024,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[10.0022,-0.00390625,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-10.0022,0.00390625,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Short_F",[-9.97607,-1.94287,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Short_F",[10.012,-1.87109,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-7.10083,7.1167,-9.53674e-006],135,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Short_F",[-8.39429,5.81543,-0.000999928],314.698,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[7.15112,7.0874,-9.53674e-006],225,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[2.01343,10.0322,-0.000999928],359.31,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[8.57739,5.729,-0.000999928],43.8052,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.9917,-3.69336,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[9.99634,-3.62158,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-3.67969,10.0396,-0.000999928],181.357,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-9.69141,4.54297,-0.000999928],134.698,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[3.76343,10.0376,-0.000999928],359.31,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[9.82983,4.50684,-0.000999928],43.8052,1,0,[0,0],"","",true,false],

		["Box_NATO_Ammo_F",[2,6,2.86102e-006],89.9929,1,0,[-0.000462344,-0.00165836],"",_ammoBoxInit,true,false],
		["Box_NATO_Wps_F",[4,6,-1.43051e-006],0.00020547,1,0,[0.000127121,-6.92237e-005],"",_basicBoxInit,true,false],
		["Box_NATO_WpsSpecial_F",[2,4,-1.43051e-006],2.23227e-005,1,0,[0.000227999,3.83659e-006],"",_specialBoxInit,true,false],
		["Box_NATO_WpsLaunch_F",[-2,4,4.29153e-006],359.998,1,0,[-0.0032983,-4.03362e-005],"",_launcherBoxInit,true,false],
		["Box_NATO_Grenades_F",[-2,6,2.86102e-006],89.9929,1,0,[-0.000462344,-0.00165836],"",_grenadeBoxInit,true,false],
		["Box_NATO_AmmoOrd_F",[0,6,1.90735e-006],89.9934,1,0,[-0.000348133,-0.00128004],"",_explosiveBoxInit,true,false],
		["Box_NATO_Support_F",[-4,6,1.90735e-006],89.9934,1,0,[-0.000348133,-0.00128004],"",_supportBoxInit,true,false],
		["Box_NATO_AmmoVeh_F",[-8.33008,-1.93018,0.0305424],359.999,1,0,[-5.08407e-005,9.83497e-005],"","",true,false]
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
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsgref_cdf_ural",[16.8213,0.189941,0],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false]
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

_comp
