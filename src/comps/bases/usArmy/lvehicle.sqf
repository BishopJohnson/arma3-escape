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
		["Land_CncBarrierMedium_F",[8.69409,11.7998,0],0,1,0,[0,0],"","",true,false],
		["Land_CncBarrierMedium_F",[10.5313,11.7944,0],180,1,0,[0,0],"","",true,false],
		["Land_CncBarrierMedium_F",[12.3687,11.814,0],0,1,0,[0,0],"","",true,false],
		["Land_CncBarrierMedium_F",[7.99658,15.9971,0],269.169,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[18.0874,-4.67334,0],326.822,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-19.9973,-6.15967,0],345.774,1,0,[0,0],"","",true,false],
		["Flag_US_F",[15.4512,14.1133,0],180,1,0,[0,0],"","",true,false],
		["WaterPump_01_sand_F",[20.4626,7.56836,0.000851154],180.393,1,0,[-5.30162e-005,0.000304353],"","",true,false],
		["Land_CncBarrierMedium4_F",[7.92969,20.6353,0],269.169,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-16.0315,-17.5845,0],326.822,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[17.687,-16.145,0],247.375,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[-10.9019,20.4067,-4.76837e-007],243.534,1,0,[-4.27963e-005,5.80257e-006],"","",true,false],
		["StorageBladder_01_fuel_sand_F",[-22.6863,5.30518,0],89.682,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_sand_F",[-22.7468,5.24902,-0.0734525],269.682,1,0,[0,0],"","",true,false],
		["Land_CamoNetB_NATO_EP1",[-19.6938,-12.1538,0],270,1,0,[0,0],"","",true,false],
		["Land_CamoNetB_NATO_EP1",[22.5759,-9.38477,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo20_sand_F",[-15.8853,20.2007,4.76837e-007],256.758,1,0,[2.00408e-005,-4.03289e-006],"","",true,false],
		["Land_HBarrierWall4_F",[2.87207,26.1821,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-4.46216,26.8848,0],180,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_sand_F",[26.1042,7.62354,-0.0665331],180.393,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[8.95142,-26.5732,0],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_sand_F",[26.2034,7.7334,-3.71933e-005],0.392722,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-21.5359,-18.2881,0],356.809,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[15.1787,22.0674,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-4.24609,27.1694,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-8.13428,-27.3062,0],358.454,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[21.7195,19.6436,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[8.99487,-27.0542,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[9.72021,27.7114,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-12.7124,26.9272,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-13.0662,-27.3003,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[32.8721,0.00683594,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[17.5144,-26.814,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.8909,0.680176,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[-19.9285,-26.2188,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[18.22,27.979,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.7095,-7.81201,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.571,8.16113,0],90,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[-29.6599,16.4858,1.28746e-005],270.625,1,0,[-0.000474674,0.000464706],"","",true,false],
		["Land_HBarrier_Big_F",[-21.2417,26.6895,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[33.0325,-8.71582,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.1155,9.19141,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-32.3533,-16.7271,0],270,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-29.71,18.8491,1.19209e-005],270.624,1,0,[-0.000418496,0.00042159],"","",true,false],
		["Land_HBarrier_Big_F",[32.2944,16.7827,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[25.9763,-26.5444,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[33.2876,-17.2441,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.3667,17.791,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[-28.0955,25.3857,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-26.948,-27.7422,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[26.6497,28.2192,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[32.2786,-24.4971,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.2813,-24.5928,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.0149,25.2749,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-32.634,24.8184,0],270,1,0,[0,0],"","",true,false]
	],
	"b_motor_inf", // Marker type
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
	["rhsusf_M977A4_REPAIR_usarmy_d",[1.26099,13.5229,0.00946188],193,random [0.25, 0.5, 1],0,[0,0],"","",true,false]
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
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_CAR_ARMED_KEY, RAND_VEH_MRAP_UNARMED_KEY, RAND_VEH_MRAP_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsusf_m1240a1_m2_usarmy_d",[21.46,-9.46387,-0.0174274],270,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_CAR_ARMED_KEY, RAND_VEH_MRAP_ARMED_KEY, RAND_VEH_IFV_KEY, RAND_VEH_APC_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsusf_stryker_m1126_m2_d",[-21.1804,-12.0757,0.00394726],90,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
