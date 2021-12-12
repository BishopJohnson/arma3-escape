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
		["Land_HBarrier_5_F",[0.641113,-10.9683,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-14.4031,-0.903809,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-11.7766,-9.70557,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[17.2644,-4.64258,0],270.301,1,0,[0,0],"","",true,false],
		["Flag_CSAT_F",[-17.1965,-5.4834,0],0.971485,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[17.2297,-10.3184,0],270.301,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-22.688,0.446777,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[4.65527,-23.7148,0],270.301,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_1_F",[-17.251,-14.0757,0],270.972,1,0,[0,0],"","",true,false],
		["Land_Pod_Heli_Transport_04_ammo_F",[-23.0889,4.28174,-0.000459194],90,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[20.6243,-11.9395,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-0.0012207,-25.1499,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-23.4089,-10.5273,0],180.972,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[2.61157,-25.543,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-28.3491,0.447266,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-5.86987,-25.8545,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_sand_F",[26.1602,-4.41602,-0.0734525],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_sand_F",[26.1892,-4.42822,0],180,1,0,[0,0],"","",true,false],
		["Land_Sink_F",[-18.8186,-19.1191,-1.90735e-006],89.9995,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[11.1331,-25.3018,0],0,1,0,[0,0],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-8.48804,26.4121,4.76837e-007],87.9223,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[-15.6689,-23.3643,4.76837e-006],178.47,1,0,[0,0],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-8.15771,27.1353,4.76837e-007],87.9223,1,0,[0,-0],"","",true,false],
		["Land_TankRoadWheels_01_single_F",[-9.02661,26.9004,4.76837e-007],87.9223,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-14.3352,-26.1567,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[18.1282,-23.6353,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-18.5435,-23.4585,0],178.468,1,0,[0,-0],"","",true,false],
		["Land_TankTracks_01_long_F",[7.95361,29.0581,-0.0132656],16.4457,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[29.1597,-11.707,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-20.9031,-23.5972,6.19888e-006],178.469,1,0,[-0,-0],"","",true,false],
		["WaterPump_01_sand_F",[-23.0942,-22.3774,0.000850677],1.85592,1,0,[-0,-0],"","",true,false],
		["Land_TentHangar_V1_F",[0,32,0],0,1,0,[0,0],"","",true,false],
		["Land_TankTracks_01_long_F",[-8.15625,31.8472,-0.0132689],154.978,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-33.7456,0.460938,0],270.294,1,0,[0,0],"","",true,false],
		["Land_TankEngine_01_used_F",[7.47949,33.1812,0.000137329],11.837,1,0,[-0,0],"","",true,false],
		["Land_Cargo20_sand_F",[-31.7786,13.2671,-4.76837e-007],269.867,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[21.4812,-25.0488,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-22.918,-26.3486,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_sand_F",[-27.9368,-20.9668,-0.0665703],0,1,0,[0,0],"","",true,false],
		["StorageBladder_02_water_sand_F",[-28.0352,-21.0771,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[22.5608,-27.0498,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-35.1401,-2.89063,0],90,1,0,[0,-0],"","",true,false],
		["Land_RepairDepot_01_tan_F",[33.9666,10.1543,0.000506401],1.61902e-005,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.0171,7.55811,0],90,1,0,[0,-0],"","",true,false],
		["CamoNet_OPFOR_big_F",[-21.4802,28.7202,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-35.1619,-8.54004,0],90,1,0,[0,-0],"","",true,false],
		["CamoNet_OPFOR_big_F",[21.2476,29.7051,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-0.0917969,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.0933,-3.19385,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[36.2842,-10.3394,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-35.1089,-14.2134,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-9.79541,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[25.645,-26.9751,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[27.1199,-24.9897,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.3708,15.9839,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-37.0933,-12.8975,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[40.5098,-4.22461,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-34.8916,-21.3237,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-31.4648,-26.6523,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.5574,2.93604,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-37.1682,-19.2993,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[40.7405,-9.71338,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[32.1909,-27.0498,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[37.5593,20.438,-4.76837e-007],274.929,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[32.8564,-24.854,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.3613,11.5029,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.6362,24.4541,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[35.2751,-26.9751,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.2754,20.2041,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[0.880615,48.1455,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[20.7551,42.3374,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-7.34814,47.8037,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[38.6277,-24.7373,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[15.1057,45.3765,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.8323,33.021,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[9.71167,48.5537,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[41.8298,-27.0498,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-15.4541,47.3774,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.0208,28.7964,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[29.3567,42.5127,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-24.103,47.1772,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[40.6431,37.8354,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.9182,41.7222,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo_Patrol_V3_F",[-31.2458,46.7358,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[40.9348,37.4976,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[37.5425,42.6123,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.769,46.9663,0],0,1,0,[0,0],"","",true,false]
	],
    "o_armor", // Marker type
	60,        // Radius of composition area
	100,       // Radius of patrol
	CSAT_KEY
];

// Setup cars
private _carEntries =
[
	east,
	CSAT_KEY,
	[RAND_VEH_MRAP_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_MRAP_02_F",[-8.85913,-8.58496,0],360,random [0.15, 0.4, 0.7],0,[0,-0],"","",true,false]
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
	east,
	CSAT_KEY,
	[RAND_VEH_IFV_KEY, RAND_VEH_APC_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_APC_Wheeled_02_rcws_v2_F",[21.3601,27.7646,-0],180,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	east,
	CSAT_KEY,
	[RAND_VEH_APC_KEY, RAND_VEH_TANK_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_APC_Tracked_02_cannon_F",[-21.3003,27.0278,-0],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	east,
	CSAT_KEY,
	[RAND_VEH_TANK_KEY, RAND_VEH_ARTY_KEY, RAND_VEH_AA_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort3 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_MBT_02_cannon_F",[0.045166,30.4321,-0],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[-0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
