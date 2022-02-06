/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _side = west;
private _faction = US_ARMY_KEY;

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
		["Box_NATO_Ammo_F",[1.99951,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Wps_F",[3.99951,6.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_WpsSpecial_F",[1.99951,4.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_WpsLaunch_F",[-2.00049,4.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_Grenades_F",[-2.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_AmmoOrd_F",[-0.000488281,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Support_F",[-4.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-7.10132,0.0117188,0],0,1,0,[0,0],"","",true,false]
	],
	"b_Ordnance", // Marker type
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

_comp
