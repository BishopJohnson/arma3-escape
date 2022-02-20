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
		["Land_WaterTank_F",[7.99994,-8.5,2.90871e-005],180,1,0,[-0.00303638,0.00313599],"","",true,false],
		["Land_Razorwire_F",[-5.72882,11.0674,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-3,-11.5,1.00136e-005],180,1,0,[-0.000363559,-0.000358934],"","",true,false],
		["Land_HBarrierWall4_F",[6.99976,9.99951,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-11.9665,5.16797,4.76837e-007],0.00130092,1,0,[1.22893e-005,-7.21133e-005],"","",true,false],
		["Land_Fort_Watchtower_EP1",[-9.01685,-10.7324,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V3_F",[10.9785,-10,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-9,10.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-5.24872,-14.0039,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[3.99591,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[14.177,7.51367,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[12.4917,10.0005,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[1.98169,-17.2783,9.53674e-007],0.00138587,1,0,[-0.000333824,0.000134219],"","",true,false],
		["Land_Mil_WiredFence_F",[11.9959,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[8.1413,-17.2207,9.53674e-007],359.999,1,0,[-1.2518e-005,8.46993e-005],"","",true,false],
		["Land_HBarrier_Big_F",[16.9176,-9.96484,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[14.1712,-17.2476,9.53674e-007],359.999,1,0,[-0.000244721,6.05218e-005],"","",true,false],

		// Turrets
		["rhsgref_cdf_AGS30_TriPod",[-9.26624,-7.71436,2.78],270,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_NATO_Ammo_F",[-7.75598,-7.65576,0],0,1,0,[0,0],"",_ammoBoxInit,true,false],
		["Box_NATO_WpsLaunch_F",[-10.2855,-9.41211,0],90,1,0,[0,0],"",_launcherBoxInit,true,false],
		["Box_NATO_Support_F",[-7.76782,-11.2764,0],0,1,0,[0,0],"",
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
	[RAND_VEH_CAR_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsgref_cdf_reg_uaz_dshkm",[-4.5976,6.99951,0],270,random [0.2, 0.4, 0.6],0,[0,0],"",
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
