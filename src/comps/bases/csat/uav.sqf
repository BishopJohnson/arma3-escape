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
		["Land_Cargo_House_V3_F",[-9.53418,11.2295,0],329.857,1,0,[0,0],"","",true,false],
		["Land_SatelliteAntenna_01_F",[-12.0935,7.26758,-0.00388479],207.318,1,0,[0.0196104,0.0133862],"","",true,false],

		// Equipment box
		["Box_CSAT_Equip_F",[-5.59668,10.418,4.76837e-007],230.89,1,0,[-1.7567e-005,0.000227304],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;

		  this addItemCargoGlobal ['O_UavTerminal', 4];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_FieldPack_ocamo', 1];
		  this addBackpackCargoGlobal ['O_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['O_UAV_06_backpack_F', 1];
          this addBackpackCargoGlobal ['O_UAV_06_medical_backpack_F', 1];
		  this addBackpackCargoGlobal ['O_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"o_uav", // Marker type
	25,      // Radius of composition area
	50,      // Radius of patrol
	CSAT_KEY
];

// Setup UAV
private _uavEntries =
[
	east,
	CSAT_KEY,
	[RAND_VEH_UGV_UNARMED_KEY, RAND_VEH_UGV_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _uav =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_UGV_01_rcws_F",[7.5105,-1.06641,0.0112128],212.704,1,0,[-0.0881294,-0.0890837],"","",true,false]
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
