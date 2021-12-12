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
		["CamoNet_BLUFOR_F",[0.407959,6.70068,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[7.9292,-0.999023,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterBarrel_F",[7.92554,1.03369,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[9.99561,2.24902,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-10.0044,2.24902,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-2.24927,10.9966,0],0,1,0,[0,0],"","",true,false],

		// Item crates
        ["Box_NATO_AmmoOrd_F",[-0.000488281,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Ammo_F",[1.99951,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Grenades_F",[-2.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-7.10132,0.0117188,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_Wps_F",[3.99951,6.00049,0],0,1,0,[0,0],"","[this, 'BASIC'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false],
		["Box_NATO_Support_F",[-4.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_WpsLaunch_F",[-2.00049,4.00049,0],0,1,0,[0,0],"","[this, 'LAUNCHER'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false],
		["Box_NATO_WpsSpecial_F",[1.99951,4.00049,0],0,1,0,[0,0],"","[this, 'SPECIAL'] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false]
	],
	"b_Ordnance", // Marker type
	20,           // Radius of composition area
	35,           // Radius of patrol
	NATO_KEY
];

// Setup cars
private _carEntries =
[
	west,
	NATO_KEY,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY, RAND_VEH_MRAP_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_Truck_01_covered_F",[16.1875,-0.159668,0.114967],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false]
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
	west,
	NATO_KEY,
	[RAND_VEH_TURRET_L_KEY, RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _turrets =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_HMG_01_high_F",[-9.27026,10.4614,-0.0749998],315.162,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["B_HMG_01_high_F",[10.002,9.76367,-0.0749998],44.1353,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["B_HMG_01_high_F",[9.89429,-9.68652,-0.0749998],135,1,0,[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["B_HMG_01_high_F",[-10.0217,-8.99854,-0.0749998],225.936,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
