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
		["Flag_US_F",[4.19287,3.35889,0],90,1,0,[0,-0],"","",true,false],
		["Land_TTowerSmall_2_F",[-3.8291,3.67383,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V1_F",[-0.940186,9.70996,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[1.19019,-11.4927,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[5.7793,-10.8472,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-4.25684,-11.5981,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[7.8877,11.3652,8.58307e-006],270.957,1,0,[-0,0],"","",true,false],
		["Land_FieldToilet_F",[7.91235,13.7612,0],270.957,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[7.87598,16.1245,3.33786e-006],270.957,1,0,[0,0],"","",true,false],
		["WaterPump_01_forest_F",[3.99854,19.5293,0.000850201],260.072,1,0,[-0,0],"","",true,false],
		["Land_Sink_F",[7.69702,19.6602,-1.90735e-006],0.000204349,1,0,[-0,-0],"","",true,false],
		["StorageBladder_02_water_forest_F",[1.18896,24.1675,0],90,1,0,[0,-0],"","",true,false],
		["ContainmentArea_02_forest_F",[1.30103,24.2827,-0.0665703],90,1,0,[0,-0],"","",true,false],
		["Land_RepairDepot_01_green_F",[-29.6458,0.376465,0.000502586],179.596,1,0,[0,-0],"","",true,false],
		["Land_Scrap_MRAP_01_F",[-30.2815,-7.94727,0],340.308,1,0,[0,0],"","",true,false],
		["CamoNet_BLUFOR_big_F",[31.7356,0.0454102,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.1851,18.4048,0],270,1,0,[0,0],"","",true,false],
		["B_Slingload_01_Ammo_F",[-29.6458,-16.624,9.53674e-007],1.03149e-005,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[-11.124,-33.9985,0],0,1,0,[0,0],"","",true,false],
		["CamoNet_BLUFOR_big_F",[13.9548,31.7354,0],0,1,0,[0,0],"","",true,false],
		["Land_TankRoadWheels_01_single_F",[-22.2612,27.1616,4.76837e-007],0,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[28.6819,20.1582,0],90,1,0,[0,-0],"","",true,false],
		["Land_TentHangar_V1_F",[-14,32,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[13.1606,-33.521,0],0,1,0,[0,0],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-21.7537,27.6821,4.76837e-007],360,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[-32.1365,14.8423,0],178.77,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.0601,14.6221,0],1.33019,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.4749,15.0532,0],0,1,0,[0,0],"","",true,false],
		["Land_TankSprocketWheels_01_single_F",[-22.4644,28.0386,0],360,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-10.8586,-34.3853,0],0,1,0,[0,0],"","",true,false],
		["Land_ConcreteHedgehog_01_palette_F",[-23.3704,-27.4316,0.00299549],75.3267,1,0,[0,0],"","",true,false],
		["Land_Cargo20_military_green_F",[-19.9382,-30.2021,4.76837e-007],358.057,1,0,[-0,-0],"","",true,false],
		["ContainmentArea_01_forest_F",[32.001,-16.9912,-0.0734525],0,1,0,[0,0],"","",true,false],
		["StorageBladder_01_fuel_forest_F",[31.97,-16.9966,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[13.5862,-33.6577,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[0.29541,36.4131,0],90,1,0,[0,-0],"","",true,false],
		["Land_TankTracks_01_long_F",[-21.4363,29.417,-0.0132623],113.943,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-37.5283,2.68164,0],274.469,1,0,[0,0],"","",true,false],
		["Land_TankEngine_01_used_F",[-20.0811,31.4556,0.000136852],273.327,1,0,[-0,0],"","",true,false],
		["Land_ConcreteHedgehog_01_palette_F",[-26.4839,-27.0537,0.003016],112.742,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-37.5942,-5.21631,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.4561,26.9492,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[28.3875,28.9937,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-37.5859,11.6123,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-19.4209,-34.4683,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-37.3699,-13.5957,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[22.1182,-33.4844,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo20_military_green_F",[-27.5298,-29.5537,4.76837e-007],198.223,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[40.582,14.7456,0],181.33,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-37.1733,-22.1626,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[43.5129,9.91357,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[43.6667,0.918457,0],270.694,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[43.7351,-7.48096,0],270.694,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.8696,-34.5562,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[0.0424805,44.999,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.5544,35.5752,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[30.709,-33.2041,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-35.5967,-29.104,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[43.6533,-15.9868,0],90.6945,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[28.259,37.1411,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-5.52271,47.916,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[5.25513,48.1309,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-14.3142,47.6709,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-35.0012,-33.6938,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[37.9341,-31.9336,0],180.649,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[43.6943,-24.438,0],90.6945,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[13.7695,48.4839,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_Patrol_V1_F",[27.731,44.0303,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-27.7012,44.1694,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-22.3958,47.4663,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[42.4475,-31.437,0],90.4805,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[27.9468,45.6631,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[22.5142,48.8154,0],180,1,0,[0,0],"","",true,false]
	],
    "b_armor", // Marker type
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
	["B_MRAP_01_F",[3.98462,-5.30566,-0.000789642],90,random [0.15, 0.4, 0.7],0,[-0,0],"","",true,false]
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
	[RAND_VEH_IFV_KEY, RAND_VEH_APC_KEY, RAND_VEH_TANK_SPECIAL_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort1 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_APC_Wheeled_01_cannon_F",[31.1592,-0.0483398,0.0169129],270,random [0.15, 0.4, 0.7],random [0, 0.1, 0.3],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	["B_MBT_01_cannon_F",[13.9622,31.3394,-0.0465121],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
	[RAND_VEH_TANK_KEY, RAND_VEH_ARTY_KEY, RAND_VEH_AA_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _vehPort3 =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_MBT_01_cannon_F",[-14.0251,31.1855,-0.0465417],180,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
