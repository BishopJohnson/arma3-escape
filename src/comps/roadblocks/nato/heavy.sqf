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
		["Land_BagBunker_Tower_F",[-5.98059,8.01709,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[8.5,-6.2002,1.85966e-005],90,1,0,[0.000909986,0.00110097],"","",true,false],
		["Land_Cargo_House_V1_F",[7,-8.97852,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-10,-5.40723,0],0,1,0,[0,0],"","",true,false],
		["Land_CncBarrierMedium4_F",[-9.9823,-9.97607,0],90,1,0,[0,-0],"","",true,false],
		["Land_ConcreteHedgehog_01_palette_F",[10.8003,10,0.00299931],0.00140062,1,0,[-0.000496039,0.0253607],"","",true,false],
		["Land_FieldToilet_F",[10,12,-6.19888e-006],89.9986,1,0,[0.000629664,0.000318137],"","",true,false],
		["Land_CncBarrierMedium4_F",[-5.52405,-14.6826,0],0,1,0,[0,0],"","",true,false],
		["Land_ConcreteHedgehog_01_F",[0.800049,-16,0.0119934],0.000134882,1,0,[2.07603e-006,6.37705e-005],"","",true,false],
		["Land_HBarrier_Big_F",[7.96472,-14.0825,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[15.5961,8.64844,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[15.5961,-4.15137,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-3.47473,17.8667,0],0,1,0,[0,0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[-14.8658,9.62109,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10,-14.6074,0],0,1,0,[0,0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[-14.8658,-9.37891,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-9.00049,15.9917,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[14,12.0024,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[14.2004,-11.9917,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[6.88611,17.4771,0],0,1,0,[0,0],"","",true,false],
		["Land_ConcreteHedgehog_01_F",[3.40002,21,0.0119934],0.000134676,1,0,[1.13632e-006,6.26883e-005],"","",true,false],
		["Land_HBarrier_3_F",[15.577,17.6138,0],90,1,0,[0,-0],"","",true,false],
		["Land_ConcreteHedgehog_01_F",[8,23,0.011991],0.00033154,1,0,[-0.000604933,0.000148268],"","",true,false],
		["Land_ConcreteHedgehog_01_F",[12.6,21,0.0119934],359.999,1,0,[-1.87472e-006,1.86989e-005],"","",true,false],

		// Item crates
		["Box_NATO_Ammo_F",[-8.69995,9,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_WpsLaunch_F",[-3.4054,7.38184,0],90,1,0,[0,0],"","[this, 'LAUNCHER', 1, 2] execVM 'src\fnc\randomCargo\randomCargo.sqf';",true,false],
		["Box_NATO_Support_F",[-3.5188,8.92139,0],360,1,0,[0,0],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;

		  this addItemCargoGlobal ['FirstAidKit', 10];
		  this addItemCargoGlobal ['Medikit', 1];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addItemCargoGlobal ['MineDetector', 1];
		  this addItemCargoGlobal ['ItemMap', 2];
		 ",true,false]
	],
	30, // Radius of composition area
	NATO_KEY
];

// Setup cars
private _carEntries =
[
	west,
	NATO_KEY,
	[RAND_VEH_MRAP_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_MRAP_01_hmg_F",[-7.00012,-10.0093,0],270,random [0.2, 0.4, 0.6],0,[0,0],"",
	 "if (random 1 > 0.3) then { deleteVehicle this };
	  this setVehicleAmmo random [0.2, 0.5, 1];
	 ",true,false]
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

// Setup turrets
private _turretEntries =
[
	west,
	NATO_KEY,
	[RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _turrets =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_HMG_01_high_F",[-7.59998,8.7998,2.78],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];
for  [{ private _i = 0 }, { _i < count _turrets }, { _i = _i + 1 }] do
{
	(selectRandom _turretEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_turrets select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_turrets set [_i, _arr];
};
(_comp select 0) append _turrets;

_comp
