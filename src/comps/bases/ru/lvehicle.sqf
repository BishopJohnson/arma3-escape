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
        ["Land_HBarrier_3_F",[-13.2351,8.31592,0],358.394,1,0,[0,0],"","",true,false],
        ["Land_CncBarrierMedium4_F",[16.1775,-1.31689,0],90.9947,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_3_F",[13.7297,9.2334,0],69.0108,1,0,[0,0],"","",true,false],
        ["Land_Cargo20_sand_F",[-5.40088,16.5552,0],183.931,1,0,[8.4211e-006,7.98492e-007],"","",true,false],
        ["Land_HBarrier_5_F",[-16.3003,-10.6357,0],0,1,0,[0,0],"","",true,false],
        ["ContainmentArea_01_sand_F",[-18.634,-3.88037,-0.0735335],0,1,0,[0,0],"","",true,false],
        ["StorageBladder_01_fuel_sand_F",[-18.5779,-3.94043,8.10623e-005],180,1,0,[0,0],"","",true,false],
        ["WaterPump_01_sand_F",[19.592,-1.51514,0.000850201],206.362,1,0,[-9.14772e-005,-0.000335442],"","",true,false],
        ["Land_HBarrier_3_F",[-19.2651,6.53516,0],326.822,1,0,[0,0],"","",true,false],
        ["Land_CncBarrierMedium4_F",[6.91089,19.5869,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[-6.302,19.8037,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_3_F",[18.4736,7.54688,0],350.498,1,0,[0,0],"","",true,false],
        ["Land_TTowerSmall_2_F",[16.2654,-10.9087,0],270,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_3_F",[-19.6628,-10.6338,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_3_F",[-23.6125,5.9248,0],359.57,1,0,[0,0],"","",true,false],
        ["Land_CamoNetB_EAST_EP1",[19.6255,13.9722,0],90,1,0,[0,-0],"","",true,false],
        ["rhs_Flag_Russia_F",[16.103,-18.6113,0],180,1,0,[0,0],"","",true,false],
        ["Land_Cargo_Patrol_V3_F",[6.73364,25.0405,0],180,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_5_F",[-2.41284,25.2676,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_5_F",[-25.2549,-10.6104,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[5.63696,-24.8296,0],0,1,0,[0,0],"","",true,false],
        ["Land_CamoNetB_EAST_EP1",[-22.0715,12.1035,0],270,1,0,[0,0],"","",true,false],
        ["Land_FieldToilet_F",[-22.179,-13.0122,1.09673e-005],0.000312054,1,0,[-0.000626696,-0.000132843],"","",true,false],
        ["Land_HBarrier_5_F",[-8.09546,25.29,0],0,1,0,[0,0],"","",true,false],
        ["StorageBladder_02_water_sand_F",[25.9304,-1.53662,-3.62396e-005],180,1,0,[0,0],"","",true,false],
        ["Land_Cargo_HQ_V3_F",[22.229,-13.4624,0],0,1,0,[0,0],"","",true,false],
        ["ContainmentArea_02_sand_F",[26.0288,-1.42627,-0.066534],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[6.84595,25.27,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall4_F",[12.9746,-23.1924,0],180,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_5_F",[-26.603,2.59082,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_3_F",[-26.5955,-2.97363,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[-13.7332,25.3096,0],0,1,0,[0,0],"","",true,false],
        ["Land_FieldToilet_F",[-24.5415,-13.0879,1.43051e-006],360,1,0,[-7.40738e-005,-1.78524e-005],"","",true,false],
        ["Land_HBarrier_5_F",[-26.5874,-6.31201,0],90,1,0,[0,-0],"","",true,false],
        ["Land_Cargo_Patrol_V3_F",[-15.4646,-24.2744,0],0,1,0,[0,0],"","",true,false],
        ["Land_Razorwire_F",[-2.77222,28.2412,-2.38419e-006],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_1_F",[3.78247,28.1665,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_1_F",[-5.85645,28.1665,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[-15.6831,-24.6846,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[15.4067,25.4316,0],0,1,0,[0,0],"","",true,false],
        ["Land_Razorwire_F",[-12.4023,28.2412,-2.38419e-006],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_1_F",[14.2822,-26.5605,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_5_F",[16.3613,-24.5527,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[-18.7312,25.1748,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_1_F",[-15.4866,28.1665,0],0,1,0,[0,0],"","",true,false],
        ["Land_Cargo_Patrol_V3_F",[-33.1108,-1.21484,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrierWall6_F",[33.2512,4.87695,0],90,1,0,[0,-0],"","",true,false],
        ["Land_Razorwire_F",[17.3665,-26.4858,-2.38419e-006],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[-33.4832,-1.1123,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_Big_F",[33.4158,-3.95703,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_Big_F",[-33.7217,7.40771,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[-33.4199,-6.18652,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[22.0388,-24.5483,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[-24.2341,-24.9087,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall4_F",[-31.8687,-13.8301,0],270,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_Big_F",[23.9814,25.46,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_5_F",[33.5596,-8.82715,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_Big_F",[33.0576,12.9272,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[-35.4387,-4.37598,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[35.271,-5.5918,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[23.9124,-26.5605,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall6_F",[-27.5081,24.873,0],0,1,0,[0,0],"","",true,false],
        ["Land_Razorwire_F",[-35.3638,-7.47803,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
        ["Land_Razorwire_F",[35.3459,-8.69385,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrierWall4_F",[31.6626,19.7949,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_Big_F",[-33.9001,16.0728,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[33.5796,-14.5366,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[-35.4387,-14.0796,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[35.271,-15.2954,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[-33.2261,-17.1938,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[27.6992,-24.5088,0],0,1,0,[0,0],"","",true,false],
        ["Land_Razorwire_F",[26.9966,-26.4858,-2.38419e-006],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall_corner_F",[-31.1733,-23.8574,0],180,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall_corner_F",[31.1121,24.2847,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrierWall_corner_F",[-32.8223,23.0146,0],270,1,0,[0,0],"","",true,false],
        ["Land_Razorwire_F",[-35.3638,-17.1816,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_5_F",[33.5552,-20.2061,0],90,1,0,[0,-0],"","",true,false],
        ["Land_Razorwire_F",[35.3459,-18.3975,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[-35.4387,-23.5835,0],90,1,0,[0,-0],"","",true,false],
        ["Land_HBarrier_1_F",[33.5513,-26.5605,0],0,1,0,[0,0],"","",true,false],
        ["Land_HBarrier_1_F",[35.271,-24.7993,0],90,1,0,[0,-0],"","",true,false]
    ],
    "o_motor_inf", // Marker type
	45,            // Radius of composition area
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
    ["RHS_Ural_Repair_VDV_01",[7.09546,-18.4355,-0.0310216],270,random [0.25, 0.5, 1],0,[0,0],"","",true,false]
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
    ["rhs_tigr_sts_3camo_vdv",[-20.3176,12.1504,0.032794],90,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
    ["rhs_btr80a_vdv",[17.8687,13.8052,0.0323625],270,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
