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
private _basicBoxInit = format
[
	"[this, '%1', '%2'] execVM '%3'; [this, 'BASIC'] execVM '%4';",
	CARGO_BASIC_WEAPONS_KEY, _faction, _cargoPath, _randCargoPath
];

private _comp =
[
	[
		["Land_HBarrier_3_F",[-1.11389,-10.2949,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-12.0316,4.12744,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-11.9684,-4.55127,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-11.9684,7.76904,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-12.0316,-8.19287,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-13.7207,6.08008,-0.00130129],90,1,0,[0,-0],"","",true,false],
		["Land_CamoNetVar_NATO_EP1",[8.07874,12.5083,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[6,-14.272,4.76837e-007],359.999,1,0,[-5.1232e-005,4.66848e-005],"","",true,false],
		["Land_WaterTank_F",[5.52332,14.4756,-4.29153e-006],180,1,0,[-8.70069e-006,0.000282909],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-7,-14.272,0],0.000316922,1,0,[-2.65645e-005,-1.67272e-005],"","",true,false],
		["Land_BagFence_End_F",[-10.0361,11.9751,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[11.8861,-10.2949,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Corner_F",[-11.9852,12.0132,-0.000999928],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Long_F",[-11.9845,14.0522,-0.000999928],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_End_F",[-10.3362,16.4248,-0.000999928],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Corner_F",[-11.9855,16.4336,-0.000999928],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-2.24878,21.0444,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[0,-21.272,9.53674e-007],359.999,1,0,[-3.22022e-005,0.000109634],"","",true,false],
		["Land_HBarrier_5_F",[-10.2488,21.0444,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[5.75122,21.0444,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[20,-14.272,9.53674e-007],359.999,1,0,[-3.22022e-005,0.000109634],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[13,-21.272,4.76837e-007],359.999,1,0,[-5.1232e-005,4.66848e-005],"","",true,false],
		["Land_HBarrier_5_F",[13.5513,21.0444,0],0,1,0,[0,0],"","",true,false],

		// Vehicles
		["rhsusf_mrzr4_d",[11.3217,13.2114,0],180,1,0,[0,0],"","",true,false],

		// Turrets
		["RHS_TOW_TriPod_D",[-11.9015,-6.30273,-0.0800705],269.999,1,0,[-0.127972,5.63962e-005],"","",true,false],
		["RHS_M2StaticMG_D",[-11.9479,6.39014,-0.0654278],269.997,1,0,[4.79135e-005,-0.00345287],"","",true,false],

		// Item crates
		["Box_NATO_Wps_F",[6.34363,12.5479,0],360,1,0,[0,0],"",_basicBoxInit,true,false],
		["Box_NATO_Ammo_F",[4.7074,12.4419,0],89.9995,1,0,[0,0],"",_ammoBoxInit,true,false]
	],
	30, // Radius of composition area
	_faction
];

_comp
