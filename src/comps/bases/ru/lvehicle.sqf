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
	    ["Land_Cargo20_sand_F",[12.3796,-5.25098,0.145],29.0115,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[-5.40063,16.5557,0.145],183.931,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-16.3,-10.6353,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_sand_F",[-18.6338,-3.87842,0],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_sand_F",[-18.5776,-3.93994,0.038],180,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_1_F",[16.012,-10.0186,0],90,1,0,[0,-0],"","",true,false],
		["WaterPump_01_sand_F",[19.5923,-1.51465,0],206.363,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-6.30176,19.8042,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-19.6626,-10.6333,0],0,1,0,[0,0],"","",true,false],
		["CamoNet_OPFOR_big_F",[19.626,13.9727,0],90,1,0,[0,-0],"","",true,false],
		["rhs_Flag_Russia_F",[16.1033,-18.6108,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[6.73364,25.041,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-2.4126,25.2681,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-25.2546,-10.6099,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[5.63721,-24.8291,0],0,1,0,[0,0],"","",true,false],
		["CamoNet_OPFOR_big_F",[-22.0713,12.104,0],270,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-22.1787,-13.0117,0.0307484],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-8.09521,25.2905,0],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_sand_F",[25.9307,-1.53613,0.031],180,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[22.229,-13.4624,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_sand_F",[26.0352,-1.42969,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[6.84619,25.2705,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[12.9749,-23.1919,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-26.6028,2.59131,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-26.5952,-2.97314,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-13.7329,25.3101,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-24.5413,-13.0874,0.0307484],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-26.5872,-6.31152,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-15.4644,-24.2739,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-2.77197,28.2417,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[3.78271,28.167,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-5.8562,28.167,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-15.6829,-24.6841,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[15.407,25.4321,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-12.4021,28.2417,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[14.2825,-26.5601,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[16.3616,-24.5522,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-18.731,25.1753,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-15.4863,28.167,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-33.1104,-1.21436,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[33.2515,4.87744,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[17.3667,-26.4854,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.4829,-1.11182,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[33.416,-3.95654,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.7214,7.4082,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-33.4197,-6.18604,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[22.0391,-24.5479,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-24.2339,-24.9082,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-31.8684,-13.8296,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[23.9817,25.4604,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[33.5598,-8.82666,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[33.0579,12.9277,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-35.4385,-4.37549,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[35.2712,-5.59131,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[23.9126,-26.5601,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-27.5078,24.8735,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-35.3635,-7.47754,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[35.3462,-8.69336,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[31.6628,19.7954,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.8999,16.0732,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[33.5798,-14.5361,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-35.4385,-14.0791,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[35.2712,-15.2949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-33.2258,-17.1934,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[27.6995,-24.5083,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[26.9968,-26.4854,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-31.1731,-23.8569,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[31.1123,24.2852,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-32.822,23.0151,0],270,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-35.3635,-17.1812,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[33.5554,-20.2056,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[35.3462,-18.397,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-35.4385,-23.583,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[33.5515,-26.5601,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[35.2712,-24.7988,0],90,1,0,[0,-0],"","",true,false]
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
	["O_Truck_03_repair_F",[7.44751,-19.2725,0.114967],270,random [0.25, 0.5, 1],0,[0,0],"","",true,false]
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
	["O_MRAP_02_hmg_F",[-20.3137,12.146,0.148828],90,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_CAR_ARMED_KEY, RAND_VEH_MRAP_ARMED_KEY, RAND_VEH_IFV_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_APC_Wheeled_02_rcws_v2_F",[17.8669,13.8052,0.112128],270,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
