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
		["Land_CzechHedgehog_01_new_F",[-25.2805,3.97021,1.43051e-006],277.696,1,0,[-0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-25.4424,10.1899,4.76837e-007],190.86,1,0,[-0,-0],"","",true,false],
		["Land_TTowerSmall_1_F",[-27.3716,1.09717,0],268.493,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[10.8638,-27.1348,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[7.90942,-27.6333,0],0,1,0,[0,0],"","",true,false],
		["FlagCarrierCDF",[-27.6887,9.68457,0],358.493,1,0,[0,0],"","",true,false],
		["CamoNet_INDP_big_F",[5.40796,29.9019,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[24.2742,18.937,0],0,1,0,[0,0],"","",true,false],
		["Land_MRL_Magazine_01_F",[30.9709,-1.66113,0],68.7672,1,0,[0,0],"","",true,false],
		["Box_IND_AmmoVeh_F",[-28.6191,-12.4048,0.0305419],97.0187,1,0,[-0,0],"","",true,false],
		["Land_HBarrier_Big_F",[16.4177,-27.3989,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[21.0325,24.2896,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[6.48682,-31.6172,1.90735e-006],103.881,1,0,[0,-0],"","",true,false],
		["Land_Sink_F",[-28.3245,15.606,-1.90735e-006],89.2008,1,0,[0,-0],"","",true,false],
		["Box_IND_AmmoVeh_F",[-28.6228,-15.1729,0.0305414],77.0628,1,0,[0,0],"","",true,false],
		["Land_TentHangar_V1_F",[32.4277,5.92871,0],90,1,0,[0,-0],"","",true,false],
		["CamoNet_INDP_big_F",[-15.6072,29.2256,0],0,1,0,[0,0],"","",true,false],
		["Land_MRL_Magazine_01_F",[33.7925,-1.90674,-9.53674e-007],50.4072,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V1_F",[-34.0498,4.06396,0],178.493,1,0,[0,-0],"","",true,false],
		["Land_WeldingTrolley_01_F",[31.2014,14.2817,-4.76837e-007],234.301,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-19.759,-28.4082,0],0,1,0,[0,0],"","",true,false],
		["ContainmentArea_02_forest_F",[-28.1125,20.3638,-0.0665703],90,1,0,[0,-0],"","",true,false],
		["StorageBladder_02_water_forest_F",[-28.2246,20.2485,0],90,1,0,[0,-0],"","",true,false],
		["Land_RepairDepot_01_green_F",[-28.1228,-20.8774,0.000506878],180,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[14.7629,-31.9028,1.90735e-006],22.0593,1,0,[-0,-0],"","",true,false],
		["Land_ToolTrolley_02_F",[32.5811,14.145,-2.86102e-006],279.874,1,0,[-0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-17.3813,-31.729,1.43051e-006],359.999,1,0,[-0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[10.5129,-34.6445,1.43051e-006],241.796,1,0,[0,0],"","",true,false],
		["ContainmentArea_01_forest_F",[30.636,-19.3374,-0.0734525],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_forest_F",[30.605,-19.3428,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-32.8936,15.3833,1.43051e-005],358.137,1,0,[-0,0],"","",true,false],
		["Land_HBarrier_Big_F",[25.1746,-27.2178,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.8755,19.04,0],0,1,0,[0,0],"","",true,false],
		["WaterPump_01_forest_F",[-28.6572,25.1641,0.000849724],89.0627,1,0,[-0,-0],"","",true,false],
		["Land_FieldToilet_F",[-35.2524,15.231,1.57356e-005],358.138,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[20.8169,32.9028,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-35.7681,17.7632,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.6812,23.333,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-28.3682,-28.4673,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-21.074,-34.2764,0],191.853,1,0,[-0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-25.2542,-31.6768,0],267.37,1,0,[0,0],"","",true,false],
		["Land_Cargo10_military_green_F",[-37.9749,-14.4941,1.43051e-006],174.461,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[-37.7744,15.1182,0],358.137,1,0,[0,-0],"","",true,false],
		["Land_Cargo20_military_green_F",[-35.7388,-21.6201,4.76837e-007],99.7499,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[20.4419,38.3589,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[33.7837,-27.1587,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-1.93066,44.1812,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[6.67847,44.2402,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-10.6875,44,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[41.4424,19.1587,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.9229,31.8877,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[47.386,-0.629395,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[20.5635,41.438,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[47.2173,7.66943,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-37.125,-28.6484,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-46.7539,-4.85156,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[15.2048,44.4102,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-46.3315,-13.6938,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-46.9956,3.70313,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-44.2402,17.4351,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-19.2139,43.8301,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[47.4336,-9.61621,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-47.2744,12.2935,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[46.1775,-16.6514,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[46.9116,15.8335,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-46.0996,-21.9546,0],270,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[-26.3123,43.5518,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[42.3101,-26.9888,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.823,43.771,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-44.2085,-27.4897,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-33.2017,40.478,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[47.6091,-23.6157,0],90,1,0,[0,-0],"","",true,false]
	],
    "n_armor", // Marker type
	60,        // Radius of composition area
	100,       // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_MRAP_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_MRAP_03_F",[-36.8657,-6.854,0],90,random [0.15, 0.4, 0.7],0,[0,-0],"","",true,false]
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
	[RAND_VEH_IFV_KEY, RAND_VEH_APC_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_APC_Wheeled_03_cannon_F",[-14.9595,28.0591,0],180,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[-0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_TANK_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort2 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_MBT_03_cannon_F",[5.49146,28.2266,-0],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_TANK_SPECIAL_KEY, RAND_VEH_ARTY_KEY, RAND_VEH_AA_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort3 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_LT_01_cannon_F",[32.0344,3.13574,-0],270,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_LT_01_cannon_F",[32.0518,9.10791,-0],270,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
