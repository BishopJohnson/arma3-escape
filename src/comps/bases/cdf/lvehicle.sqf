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

private _comp =
[
	[
		["ContainmentArea_01_sand_F",[13.386,-5.23877,-0.0734525],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_sand_F",[13.3823,-5.29346,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[10.717,-14.1626,0],183.821,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[-17.8994,5.01514,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo10_sand_F",[2.30591,21.6079,0],288.177,1,0,[3.20373e-007,1.77816e-007],"","",true,false],
		["FlagCarrierCDF",[-17.769,12.8784,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[18.0371,-15.5293,0],183.26,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[-8.26782,21.4673,-4.76837e-007],214.345,1,0,[5.10109e-005,7.49441e-006],"","",true,false],
		["Land_HBarrierWall6_F",[24.9326,-1.11865,0],92.7825,1,0,[0,-0],"","",true,false],
		["Land_CamoNetB_EAST_EP1",[-22.2505,-10.0913,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[23.6025,-8.41211,0],92.783,1,0,[0,-0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-24.2756,7.42676,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-0.357666,27.1421,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[3.96509,-25.5049,0],0,1,0,[0,0],"","",true,false],
		["Land_CamoNetB_EAST_EP1",[21.8645,14.1885,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[23.5928,-13.9492,0],91.0295,1,0,[0,-0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[8.6709,27.0562,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[13.0906,-24.8403,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-8.56299,27.0459,0],0,1,0,[0,0],"","",true,false],
		["WaterPump_01_sand_F",[-19.3589,20.8862,0.000850201],161.786,1,0,[-5.93398e-005,0.000181711],"","",true,false],
		["Land_HBarrier_Big_F",[8.49268,27.2773,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-16.115,-25.4868,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[11.4343,-26.7573,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[14.5186,-26.6826,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-16.7566,26.6274,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[13.5559,27.5342,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-20.8359,-25.1216,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_sand_F",[-25,20.792,-0.066534],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_sand_F",[-25.0996,20.6816,-3.62396e-005],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-15.0757,28.8086,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[20.9629,-24.8403,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.6216,3.13477,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-5.38281,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-21.01,-25.5547,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-33.3948,-1.04248,4.29153e-006],270,1,0,[-0.000161546,0.000100973],"","",true,false],
		["Land_FieldToilet_F",[-33.447,-3.21826,-6.19888e-006],269.999,1,0,[0.000631423,0.000318599],"","",true,false],
		["Land_HBarrier_1_F",[21.0645,-26.7573,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-3.61182,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.4573,11.7417,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-21.6304,28.8833,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-13.2578,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[34.1646,-6.71387,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-35.7917,-10.1455,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[22.9978,27.6553,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-36.1396,-1.19971,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-24.6621,26.6274,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-13.3154,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,7.21973,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[24.1487,-26.6826,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-24.7146,28.8086,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-30.3408,-25.769,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[28.8684,-24.8403,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.2395,20.2935,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.9875,5.5083,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[34.1646,-16.4175,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-21.1279,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,15.0898,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.9126,11.9102,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.7761,-18.166,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[30.301,26.4961,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[30.7034,-26.7573,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-37.9875,15.0122,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-22.8193,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-31.2605,28.8833,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-33.7268,-24.4551,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-32.5344,26.6274,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,22.9648,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.9126,21.6138,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-34.3447,28.8086,0],0,1,0,[0,0],"","",true,false]
	],
    "n_motor_inf", // Marker type
	50,            // Radius of composition area
	80,            // Radius of patrol
	_faction
];

// Setup utility car
private _utilEntries =
[
	_side,
	_faction,
	[RAND_VEH_UTIL_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _utilCars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsgref_cdf_b_ural_repair",[12.9849,-20.7251,0],270,random [0.25, 0.5, 1],0,[0,0],"","",true,false]
];
for  [{ private _i = 0 }, { _i < count _utilCars }, { _i = _i + 1 }] do
{
	(selectRandom _utilEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_utilCars select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_utilCars set [_i, _arr];
};
(_comp select 0) append _utilCars;

// Setup vehicle port 1
private _vehEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_CAR_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsgref_cdf_b_reg_uaz_dshkm",[21.5154,14.2075,0],270,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];
for  [{ private _i = 0 }, { _i < count _vehPort1 }, { _i = _i + 1 }] do
{
	(selectRandom _vehEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_vehPort1 select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_vehPort1 set [_i, _arr];
};
(_comp select 0) append _vehPort1;

// Setup vehicle port 2
private _vehEntries =
[
    _side,
    _faction,
	[RAND_VEH_CAR_ARMED_KEY, RAND_VEH_MRAP_ARMED_KEY, RAND_VEH_APC_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsgref_cdf_b_btr80",[-22.1702,-9.99268,0],90,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];
for  [{ private _i = 0 }, { _i < count _vehPort2 }, { _i = _i + 1 }] do
{
	(selectRandom _vehEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_vehPort2 select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_vehPort2 set [_i, _arr];
};
(_comp select 0) append _vehPort2;

_comp
