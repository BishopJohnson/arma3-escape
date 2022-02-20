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
private _basicBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'BASIC'] execVM '%4';",
	CARGO_BASIC_WEAPONS_KEY, _faction, _cargoPath, _randCargoPath
];

private _comp =
[
	[
		["Land_BagFence_End_F",[-2.24005,-4.52295,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Corner_F",[-3.78931,-4.46436,-0.000999928],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-2.08624,5.52637,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Corner_F",[-3.98523,5.56445,-0.000999928],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[-3.80237,-6.23877,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-1.89008,-7.25049,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Short_F",[-3.99854,7.01074,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Corner_F",[-3.78906,-7.68506,-0.000999928],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Corner_F",[-3.98547,8.78516,-0.000999928],270,1,0,[0,0],"","",true,false],
		["Land_BagFence_End_F",[-2.43622,8.72656,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-0.118469,-9.93262,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-3.38965,-10.0073,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[6.44434,-10.0073,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-2.02301,15.1138,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[9.59564,-9.93262,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_CamoNetVar_EAST_EP1",[7.17279,16.1821,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[4.6073,18.271,-1.28746e-005],180,1,0,[-0.000945832,0.000219793],"","",true,false],
		["Land_HBarrier_1_F",[16.3245,-10.0073,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[15.977,15.1138,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[0.771423,22.8037,0],135,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[5.88605,24.9771,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[13.1961,22.7715,0],45,1,0,[0,0],"","",true,false],

		// Vehicles
		["rhsgref_cdf_reg_uaz_open",[9.99261,16.7646,0],180,1,0,[0,0],"","",true,false],

		// Turrets
		["rhsgref_cdf_DSHKM",[-2.05237,-5.70801,0],270,1,0,[0,0],"","",true,false],
		["rhsgref_cdf_DSHKM",[-2.24835,7.54053,0],270,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_NATO_Wps_F",[5.56152,16.2954,0],0,1,0,[0,0],"",_basicBoxInit,true,false],
		["Box_NATO_Ammo_F",[3.81812,16.2603,0],90,1,0,[0,0],"",_ammoBoxInit,true,false]
	],
	30, // Radius of composition area
	_faction
];

_comp
