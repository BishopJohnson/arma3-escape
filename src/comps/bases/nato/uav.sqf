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
		["Land_Cargo_House_V1_F",[-10.2351,12.1616,0],327.177,1,0,[0,0],"","",true,false],
		["SatelliteAntenna_01_Olive_F",[-13.509,8.46094,-0.00388145],226.229,1,0,[0.0109715,0.0014195],"","",true,false],

		// Equipment box
		["Box_NATO_Equip_F",[-6.36719,11.5259,-4.76837e-007],221.012,1,0,[-0.000181165,0.000400534],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;

		  this addItemCargoGlobal ['B_UavTerminal', 4];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_AssaultPack_rgr', 1];
		  this addBackpackCargoGlobal ['B_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['B_UAV_06_backpack_F', 1];
          this addBackpackCargoGlobal ['B_UAV_06_medical_backpack_F', 1];
		  this addBackpackCargoGlobal ['B_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"b_uav", // Marker type
	25,      // Radius of composition area
	50,      // Radius of patrol
	NATO_KEY
];

// Setup UAV
private _uavEntries =
[
	west,
	NATO_KEY,
	[RAND_VEH_UGV_UNARMED_KEY, RAND_VEH_UGV_ARMED_KEY, RAND_VEH_HELI_UAV_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _uav =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_UGV_01_rcws_F",[4.81787,-3.41357,0.011271],209,random [0.15, 0.4, 0.7],0,[-0.0867619,-0.0858628],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];
for  [{ private _i = 0 }, { _i < count _uav }, { _i = _i + 1 }] do
{
	(selectRandom _uavEntries) params ["_veh", "_variant", "_loadout"];

	private _arr =
	[
		_uav select _i,
		_veh,
		_variant,
		_loadout
	] call compile preprocessFile "src\comps\updateVehicleEntry.sqf";

	_uav set [_i, _arr];
};
(_comp select 0) append _uav;

_comp
