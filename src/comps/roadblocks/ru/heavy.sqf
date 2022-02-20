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
		["Land_FieldToilet_F",[-1,-11,4.76837e-007],180,1,0,[8.7948e-005,1.25324e-005],"","",true,false],
		["Land_HBarrier_5_F",[-8.00385,10.2485,0],90,1,0,[0,-0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[-8.01685,-8.73242,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[0.751282,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V3_F",[9.99994,-8.97852,0],180,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-9.93262,9.729,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[11.5,-6,2.19345e-005],270,1,0,[-0.00105061,-0.000630114],"","",true,false],
		["Land_HBarrier_5_F",[-8.24872,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-1.00256,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-12.9051,-6.271,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[2.37915,16.1343,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-6.50256,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[6.99744,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[11.7513,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[12.4974,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[18.9961,-3.65137,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[3.09973,-19.6758,0],360,1,0,[1.69654e-005,3.71979e-006],"","",true,false],
		["Land_HBarrier_5_F",[18.9961,9.24854,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[17.9948,10.9053,0],135,1,0,[0,-0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[13.3792,16.1343,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[18.9176,-12.9648,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[16.7201,-19.627,2.86102e-006],0.00331874,1,0,[0.000150484,-0.000235253],"","",true,false],

		// Turrets
		["rhs_Kornet_9M133_2_msv",[-8.50696,-10.0249,2.78],270,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_NATO_Ammo_F",[-6.90479,-5.68262,0],0,1,0,[0,0],"",_ammoBoxInit,true,false],
		["Box_NATO_WpsLaunch_F",[-9.17511,-7.38037,0],90,1,0,[0,0],"",_launcherBoxInit,true,false],
		["Box_NATO_Support_F",[-6.81274,-9.37988,0],0,1,0,[0,0],"",
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
	["rhs_tigr_sts_3camo_vdv",[-3.24097,8.16553,0],270,random [0.2, 0.4, 0.6],0,[0,0],"",
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
