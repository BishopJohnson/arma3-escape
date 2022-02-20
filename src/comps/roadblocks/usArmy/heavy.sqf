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

private _cargoPath = "src\fnc\cargo\cargo.sqf";
private _randCargoPath = "src\fnc\randomCargo\randomCargo.sqf";
private _ammoBoxInit = format ["[this, '%1', '%2'] execVM '%3';", CARGO_AMMO_KEY, _faction, _cargoPath];
private _launcherBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'LAUNCHER'] execVM '%4'",
	CARGO_LAUNCHERS_KEY, _faction, _cargoPath, _randCargoPath
];

private _comp =
[
	[
		["Land_WaterTank_F",[8.5,-6.2002,4.76837e-006],270,1,0,[-0.000375207,-6.40355e-005],"","",true,false],
		["Land_Cargo_House_V3_F",[7,-8.97852,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-10,-5.40723,0],0,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[-8.24084,7.62939,0],0,1,0,[0,0],"","",true,false],
		["Land_CncBarrierMedium4_F",[-9.9823,-9.97607,0],90,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[10,12,2.38419e-006],90.0014,1,0,[0.000422483,0.000303741],"","",true,false],
		["Land_CncBarrierMedium4_F",[-5.52405,-14.6826,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[0.726074,-15.6851,9.53674e-007],360,1,0,[6.21047e-005,-0.000107494],"","",true,false],
		["Land_HBarrier_Big_F",[7.96472,-14.0825,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[15.5961,-4.15137,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[15.5961,8.64844,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-3.47473,17.8667,0],0,1,0,[0,0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[-14.8658,9.62109,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-10,-14.6074,0],0,1,0,[0,0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[-14.8658,-9.37891,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-9.00049,15.9917,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[14,12.0024,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[14.2004,-11.9917,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[6.88611,17.4771,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[3.69177,20.7954,0],360,1,0,[1.69854e-005,2.92653e-006],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[8.19678,21.0884,0],360,1,0,[1.55496e-005,1.83242e-006],"","",true,false],
		["Land_HBarrier_3_F",[15.577,17.6138,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[12.8542,20.8872,0],0.000180769,1,0,[-8.41452e-006,-9.64152e-006],"","",true,false],

		// Turrets
		["RHS_TOW_TriPod_D",[-8.61768,10.0962,2.78],270,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_NATO_Ammo_F",[-7.09692,10.8267,0],0,1,0,[0,0],"",_ammoBoxInit,true,false],
		["Box_NATO_WpsLaunch_F",[-9.4397,9.03418,0],90,1,0,[0,0],"",_launcherBoxInit,true,false],
		["Box_NATO_Support_F",[-7.00293,6.95996,0],0,1,0,[0,0],"",
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
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsusf_m1151_m2_v2_usarmy_d",[-6.76477,-10.2002,0],270,random [0.2, 0.4, 0.6],0,[0,0],"",
	 "if (random 1 > 0.7) then { deleteVehicle this };
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

_comp
