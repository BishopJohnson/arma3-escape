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
private _basicBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'BASIC'] execVM '%4';",
	CARGO_BASIC_WEAPONS_KEY, _faction, _cargoPath, _randCargoPath
];

private _comp =
[
	[
		["Land_HBarrier_3_F",[-5.02301,6.94678,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-5.02301,-4.87598,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-3.72882,9.90039,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[2.79999,9.82568,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.53162,3.91211,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.46838,-4.26904,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[6.20001,9.82568,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.46838,7.55371,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-6.79999,9.82568,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.53162,-7.91064,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-11.3207,-5.95801,-0.00130129],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-5.02301,-10.876,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[9.27118,9.90039,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_CamoNetVar_EAST_EP1",[9.10242,-12.4746,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[11.9732,-12.8726,-1.43051e-006],360,1,0,[0.000288885,0.00054695],"","",true,false],
		["Land_HBarrier_3_F",[-4.30389,-17.2183,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[15.8,9.82568,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[1.88605,-20.0127,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[7.88605,-20.0127,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[13.886,-20.0127,0],0,1,0,[0,0],"","",true,false],

		// Vehicles
		["rhs_uaz_open_MSV_01",[6.36487,-11.8711,0],360,1,0,[0,0],"","",true,false],

		// Turrets
		["rhs_KORD_high_MSV",[-9.19299,-5.81787,0],270,1,0,[0,0],"","",true,false],
		["rhs_SPG9M_MSV",[-9.73499,5.74902,0],270,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_NATO_Wps_F",[11.0221,-10.1436,0],360,1,0,[0,0],"",_basicBoxInit,true,false],
		["Box_NATO_Ammo_F",[12.6703,-10.1934,0],89.9995,1,0,[0,0],"",_ammoBoxInit,true,false]
	],
	30, // Radius of composition area
	_faction
];

_comp
