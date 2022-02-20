/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _side = east;
private _faction = RU_KEY;

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
		["Land_CamoNet_EAST_EP1",[-0.0852051,5.14502,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[7.6416,-0.999512,3.8147e-006],359.995,1,0,[0.000683415,0.000431982],"","",true,false],
		["Land_WaterBarrel_F",[7.63794,1.0332,4.29153e-006],359.999,1,0,[0.000440797,0.000478374],"","",true,false],
		["Land_HBarrier_5_F",[-2.24878,9.99609,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[10.0674,1.729,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-9.93262,1.729,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[9.99243,-4.67285,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10.0076,-4.67285,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10.0076,4.83105,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[9.99243,4.83105,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-1.72876,12.0674,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-4.81299,11.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[4.82593,11.9927,0],0,1,0,[0,0],"","",true,false],

		["Box_NATO_Ammo_F",[2,6,2.86102e-006],89.9929,1,0,[-0.000462344,-0.00165836],"",_ammoBoxInit,true,false],
		["Box_NATO_Wps_F",[4,6,-1.43051e-006],0.00020547,1,0,[0.000127121,-6.92237e-005],"",_basicBoxInit,true,false],
		["Box_NATO_WpsSpecial_F",[2,4,-1.43051e-006],2.23227e-005,1,0,[0.000227999,3.83659e-006],"",_specialBoxInit,true,false],
		["Box_NATO_WpsLaunch_F",[-2,4,4.29153e-006],359.998,1,0,[-0.0033009,-4.07657e-005],"",_launcherBoxInit,true,false],
		["Box_NATO_Grenades_F",[-2,6,2.86102e-006],89.9929,1,0,[-0.000459345,-0.00165867],"",_grenadeBoxInit,true,false],
		["Box_NATO_AmmoOrd_F",[0,6,1.90735e-006],89.9934,1,0,[-0.000348133,-0.00128004],"",_explosiveBoxInit,true,false],
		["Box_NATO_Support_F",[-4,6,1.90735e-006],89.9934,1,0,[-0.000345081,-0.00128015],"",_supportBoxInit,true,false],
		["Box_NATO_AmmoVeh_F",[-7.38892,0.0112305,0.0305414],2.31495e-005,1,0,[-3.48695e-006,1.07482e-006],"","",true,false]
	],
	"o_Ordnance", // Marker type
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
	["RHS_Ural_VDV_01",[15.8303,0.165039,-0.0312862],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false]
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
