/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _comp =
[
	[
		["CamoNet_OPFOR_F",[-0.0847168,5.14551,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[7.64185,-0.999023,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[7.63818,1.03369,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-2.24854,9.99658,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-9.93237,1.72949,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[10.0676,1.72949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10.0073,-4.67236,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[9.99268,-4.67236,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10.0073,4.83154,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[9.99268,4.83154,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-1.72852,12.0679,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-4.81274,11.9932,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[4.82617,11.9932,0],0,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_East_AmmoOrd_F",[0.000244141,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_Grenades_F",[-1.99976,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_Ammo_F",[2.00024,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_Wps_F",[4.00024,6.00049,0],0,1,0,[0,0],"","[this, 'BASIC'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false],
		["Box_East_Support_F",[-3.99976,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_AmmoVeh_F",[-7.38867,0.0117188,0],0,1,0,[0,0],"","",true,false],
		["Box_East_WpsLaunch_F",[-1.99976,4.00049,0],0,1,0,[0,0],"","[this, 'LAUNCHER'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false],
		["Box_East_WpsSpecial_F",[2.00024,4.00049,0],0,1,0,[0,0],"","[this, 'SPECIAL'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false]
	],
	"o_Ordnance", // Marker type
	20,           // Radius of composition area
	35,           // Radius of patrol
	CSAT_KEY
];

// Setup cars
private _carEntries =
[
	east,
	CSAT_KEY,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY, RAND_VEH_MRAP_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_Truck_03_covered_F",[15.8298,0.165527,0.114967],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false]
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
	east,
	CSAT_KEY,
	[RAND_VEH_TURRET_L_KEY, RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _turrets =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_HMG_01_high_F",[-10.1138,-8.99854,-0.0749998],225.936,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[9.80225,-9.68652,-0.0749998],135,1,0,[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[9.90991,9.76367,-0.0749998],44.1353,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[-9.3623,10.4614,-0.0749998],315.162,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// Removes two of the turrents
for [{ private _i = 0 }, { _i < 2 }, { _i = _i + 1 }] do
{
	_turrets = _turrets - [selectRandom _turrets];
};

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
