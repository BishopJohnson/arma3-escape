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
		["Land_TTowerSmall_1_F",[-17.6777,4.28516,0],270,1,0,[0,0],"","",true,false],
		["Land_Cargo10_military_green_F",[2.30566,21.6079,0],288.177,1,0,[0,0],"","",true,false],
		["FlagCarrierCDF",[-17.769,12.8774,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo20_military_green_F",[-8.26782,21.4668,0.145],214.345,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_forest_F",[23.3796,-3.99805,0],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_forest_F",[23.436,-4.06055,0.038],180,1,0,[0,0],"","",true,false],
		["CamoNet_INDP_big_F",[-22.2505,-10.0918,0],270,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V1_F",[-24.2756,7.42627,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-0.357666,27.1416,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[3.96509,-25.5054,0],0,1,0,[0,0],"","",true,false],
		["CamoNet_INDP_big_F",[21.8645,14.188,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[8.6709,27.0557,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[13.0906,-24.8408,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-8.56299,27.0454,0],0,1,0,[0,0],"","",true,false],
		["WaterPump_01_forest_F",[-19.3591,20.8853,0],161.786,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[8.49268,27.2769,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-16.115,-25.4873,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[11.4343,-26.7578,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V1_F",[25.8875,-18.0161,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[14.5186,-26.6831,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-16.7566,26.627,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[13.5559,27.5337,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[-20.8359,-25.1221,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_forest_F",[-24.9944,20.7876,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-15.0757,28.8081,0],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_forest_F",[-25.0991,20.6812,0.031],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[20.9629,-24.8408,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.6216,3.13428,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-5.3833,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-21.01,-25.5552,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-33.3948,-1.04297,0],270,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-33.447,-3.21875,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[21.0645,-26.7578,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-3.6123,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.4573,11.7412,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-21.6304,28.8828,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-13.2583,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[34.1646,-6.71436,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-35.7917,-10.146,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[22.9978,27.6548,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-36.1396,-1.2002,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-24.6621,26.627,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-13.3159,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,7.21924,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[24.1487,-26.6831,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-24.7146,28.8081,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-30.3408,-25.7695,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[28.8684,-24.8408,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.2395,20.293,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.9875,5.50781,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[34.1646,-16.418,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[32.4641,-21.1284,-9.53674e-006],270,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,15.0894,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.9126,11.9097,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.7761,-18.1665,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[30.301,26.4956,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[30.7034,-26.7578,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-37.9875,15.0117,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[34.0896,-22.8198,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-31.2605,28.8828,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-33.7268,-24.4556,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-32.5344,26.627,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-36.0791,22.9644,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.9126,21.6133,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-34.3447,28.8081,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-37.9875,24.7153,0],90,1,0,[0,-0],"","",true,false]
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
	["I_Truck_02_box_F",[13.4011,-21.6802,0.114967],270,random [0.25, 0.5, 1],0,[0,0],"","",true,false]
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
	[RAND_VEH_MRAP_UNARMED_KEY, RAND_VEH_MRAP_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_MRAP_03_hmg_F",[21.5132,14.207,0.148828],270,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_MRAP_ARMED_KEY, RAND_VEH_IFV_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_APC_Wheeled_03_cannon_F",[-22.1689,-9.99365,0.112128],90,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
