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
		["Box_East_Ammo_F",[2.00024,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_Wps_F",[4.00024,6.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_East_WpsSpecial_F",[2.00024,4.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_East_WpsLaunch_F",[-1.99976,4.00049,0],0,1,0,[0,0],"","",true,false],
		["Box_East_Grenades_F",[-1.99976,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_AmmoOrd_F",[0.000244141,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_Support_F",[-3.99976,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_East_AmmoVeh_F",[-7.38867,0.0117188,0],0,1,0,[0,0],"","",true,false]
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

_comp
