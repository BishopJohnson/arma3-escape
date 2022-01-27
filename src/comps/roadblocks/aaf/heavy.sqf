/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _side = independent;
private _faction = AAF_KEY;

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
		["Land_HBarrier_1_F",[1,10.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-9.00385,9.24854,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[8.00006,-8.5,-5.72205e-006],0.000584186,1,0,[0.00532521,0.00402497],"","",true,false],
		["Land_Razorwire_F",[-5.72882,11.0674,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-3,-11.5,4.76837e-007],180,1,0,[9.74706e-005,2.69194e-005],"","",true,false],
		["Land_HBarrierWall4_F",[6.99976,9.99951,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Tower_F",[-9.01685,-9.98047,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V1_F",[10.9785,-10,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-9,10.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-5.24872,-14.0039,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[3.99591,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[14.177,7.51367,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[12.4917,10.0005,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[11.9959,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[16.9176,-9.96484,0],90,1,0,[0,-0],"","",true,false],

		// Item crates
		["Box_IND_Ammo_F",[-10.2,-12.6001,0],359.999,1,0,[-0.00080437,0.00148494],"",_ammoBoxInit,true,false],
		["Box_IND_WpsLaunch_F",[-8.55634,-7.56689,0],360,1,0,[0.000407251,0],"",_launcherBoxInit,true,false],
		["Box_IND_Support_F",[-10.0685,-7.62305,-1.90735e-006],89.9995,1,0,[-0.000900781,0.00136405],"",
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
	25, // Radius of composition area
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_MRAP_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_MRAP_03_hmg_F",[-4.59137,6.99902,0],270,random [0.2, 0.4, 0.6],0,[0,0],"",
	 "if (random 1 > 0.3) then { deleteVehicle this };
	  this setVehicleAmmo random [0.2, 0.5, 1];",
	  true,false]
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
	_side,
	_faction,
	[RAND_VEH_TURRET_M_KEY, RAND_VEH_TURRET_H_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _turrets =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["I_HMG_01_high_F",[-9.40002,-11.7998,2.78],270.001,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
