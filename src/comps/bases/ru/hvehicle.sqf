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
		["Land_HBarrier_5_F",[0.641113,-10.9683,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-14.4031,-0.903809,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-11.7766,-9.70557,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[17.2646,-4.64258,0],270.301,1,0,[0,0],"","",true,false],
		["rhs_Flag_Russia_F",[-17.1965,-5.48389,0],0.971,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[17.23,-10.3184,0],270.301,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-22.688,0.446777,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-21.1089,3.56494,0.0305429],347.17,1,0,[-0.000130169,-7.76804e-007],"","",true,false],
		["Land_HBarrier_5_F",[4.65552,-23.7148,0],270.301,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[-17.3413,-13.0439,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[20.6243,-11.9395,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-0.00170898,-25.1494,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-23.4092,-10.5273,0],180.971,1,0,[0,0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-25.166,3.81934,0.0305414],17.007,1,0,[7.27917e-007,3.06924e-007],"","",true,false],
		["Land_HBarrier_Big_F",[2.61157,-25.543,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-28.3491,0.447266,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-5.86987,-25.8545,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_sand_F",[26.1599,-4.41602,-0.0735335],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_sand_F",[26.189,-4.42822,8.10623e-005],180,1,0,[0,0],"","",true,false],
		["Land_Sink_F",[-18.8186,-19.1191,-1.90735e-006],89.9995,1,0,[0.00024938,7.97027e-005],"","",true,false],
		["Land_HBarrier_Big_F",[11.1331,-25.3018,0],0,1,0,[0,0],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-8.48804,26.4121,4.76837e-007],87.9223,1,0,[5.95258e-005,-7.21046e-005],"","",true,false],
		["Land_FieldToilet_F",[-15.6689,-23.3643,8.58307e-006],178.467,1,0,[-0.000521037,8.50428e-005],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-8.15771,27.1353,4.76837e-007],87.9223,1,0,[6.95891e-005,-6.85657e-005],"","",true,false],
		["Land_TankRoadWheels_01_single_F",[-9.02661,26.9004,4.76837e-007],87.9223,1,0,[4.19891e-005,-4.80595e-005],"","",true,false],
		["Land_HBarrier_Big_F",[-14.3352,-26.1567,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[18.1282,-23.6353,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-18.5435,-23.4585,0],178.468,1,0,[0.000428938,-0.00017539],"","",true,false],
		["Land_TankTracks_01_long_F",[7.95361,29.0581,-0.0132656],16.4457,1,0,[0.114743,-0.00239175],"","",true,false],
		["Land_HBarrier_Big_F",[29.1597,-11.707,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-20.9031,-23.5972,4.76837e-007],178.469,1,0,[-4.87658e-006,4.96463e-005],"","",true,false],
		["WaterPump_01_sand_F",[-23.094,-22.377,0.000850201],1.8563,1,0,[-8.72416e-005,-0.000313143],"","",true,false],
		["Land_TentHangar_V1_F",[0,32,0],0,1,0,[0,0],"","",true,false],
		["Land_TankTracks_01_long_F",[-8.15625,31.8472,-0.0132689],154.978,1,0,[0.113994,0.0024432],"","",true,false],
		["Land_HBarrierWall4_F",[-33.7456,0.460938,0],270.294,1,0,[0,0],"","",true,false],
		["Land_TankEngine_01_used_F",[7.47949,33.1812,0.000137329],11.837,1,0,[-0.00872248,0.00193268],"","",true,false],
		["Land_HBarrier_5_F",[21.4812,-25.0488,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-22.918,-26.3486,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_sand_F",[-27.937,-20.9673,-0.066534],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_sand_F",[-28.0354,-21.0776,-3.62396e-005],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-35.1401,-2.89063,0],90,1,0,[0,-0],"","",true,false],
		["Land_RepairDepot_01_tan_F",[33.967,10.1538,0.000502586],360,1,0,[0.00938495,0.000438352],"","",true,false],
		["Land_HBarrier_Big_F",[-35.0171,7.55811,0],90,1,0,[0,-0],"","",true,false],
		["Land_CamoNetB_EAST_EP1",[-21.4802,28.7202,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-35.1619,-8.54004,0],90,1,0,[0,-0],"","",true,false],
		["Land_CamoNetB_EAST_EP1",[21.2478,29.7056,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-0.0917969,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[23.7476,-28.8721,4.76837e-007],103.881,1,0,[2.57379e-005,-3.80976e-005],"","",true,false],
		["Land_Razorwire_F",[-37.0933,-3.19385,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[36.2842,-10.3394,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-35.1089,-14.2134,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-9.79541,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[27.1199,-24.9897,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.3708,15.9839,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.0933,-12.8975,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[40.5098,-4.22461,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-34.8916,-21.3237,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-31.4648,-26.6523,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.5574,2.93604,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-19.2993,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[40.7405,-9.71338,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[27.8325,-31.8857,0],165.218,1,0,[-2.15729e-005,-1.63961e-005],"","",true,false],
		["Land_Cargo20_sand_F",[37.5591,20.438,4.76837e-007],274.929,1,0,[1.26063e-005,-8.55268e-007],"","",true,false],
		["Land_HBarrier_5_F",[32.8564,-24.854,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.3613,11.5029,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.6362,24.4541,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[32.0852,-29.0059,-4.76837e-007],241.795,1,0,[3.0326e-006,1.8049e-005],"","",true,false],
		["Land_HBarrier_Big_F",[41.2754,20.2041,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[0.880615,48.1455,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[20.7551,42.3374,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-7.34814,47.8037,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[38.6277,-24.7373,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[15.1057,45.3765,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[37.0073,-31.5508,4.76837e-007],45.9257,1,0,[-5.04914e-005,-2.74511e-005],"","",true,false],
		["Land_HBarrier_Big_F",[-35.8323,33.021,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[9.71167,48.5537,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-15.4541,47.3774,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[40.7913,-28.8721,4.76837e-007],22.0587,1,0,[1.6974e-005,2.83777e-006],"","",true,false],
		["Land_HBarrier_Big_F",[41.0208,28.7964,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[29.3567,42.5127,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-24.103,47.1772,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[40.6428,37.835,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.9182,41.7222,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-31.2463,46.7354,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[40.9348,37.4976,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[37.5425,42.6123,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.769,46.9663,0],0,1,0,[0,0],"","",true,false]
	],
    "o_armor", // Marker type
	60,        // Radius of composition area
	100,       // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhs_tigr_3camo_vdv",[-6.1958,-11.9077,0],0,random [0.15, 0.4, 0.7],0,[0,0],"","",true,false]
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

// Setup vehicle port 1
private _vehEntries =
[
	_side,
	_faction,
	[RAND_VEH_APC_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhs_btr80a_vdv",[21.3601,27.7612,0],180,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_IFV_KEY, RAND_VEH_TANK_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhs_bmp2d_tv",[-21.3015,27.0293,0],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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

// Setup vehicle port 3
private _vehEntries =
[
	_side,
	_faction,
	[RAND_VEH_TANK_KEY, RAND_VEH_TANK_SPECIAL_KEY, RAND_VEH_ARTY_KEY, RAND_VEH_AA_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort3 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhs_t90_tv",[0.0449219,30.438,0],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

for  [{ private _i = 0 }, { _i < count _vehPort3 }, { _i = _i + 1 }] do
{
	(selectRandom _vehEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_vehPort3 select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_vehPort3 set [_i, _arr];
};
(_comp select 0) append _vehPort3;

_comp
