/*
	Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

_comp =
[
	[
		["OmniDirectionalAntenna_01_olive_F",[-11.1831,1.9126,0.00883722],359.996,1,0,[0.00351962,-0.00285881],"","",true,false],
		["Land_Cargo_House_V1_F",[-10.4028,7.62207,0],307.126,1,0,[0,0],"","",true,false],

		// Equipment box
		["Box_AAF_Equip_F",[-6.52881,8.24707,0],202.333,1,0,[-0.000120205,0.000220117],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;

		  this addItemCargoGlobal ['I_UavTerminal', 4];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_AssaultPack_dgtl', 1];
		  this addBackpackCargoGlobal ['I_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['I_UAV_06_backpack_F', 1];
		  this addBackpackCargoGlobal ['I_UAV_06_medical_backpack_F', 1];
		  this addBackpackCargoGlobal ['I_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"n_uav", // Marker type
	25,      // Radius of composition area
	50,      // Radius of patrol
	AAF_KEY
];

// Setup UAV
private _uavEntries =
[
	independent,
	AAF_KEY,
	[RAND_VEH_UGV_UNARMED_KEY, RAND_VEH_UGV_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _uav =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["I_UGV_01_rcws_F",[7.78394,-2.42871,0.01127],209.165,1,0,[-0.0864288,-0.085723],"","",true,false]
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
