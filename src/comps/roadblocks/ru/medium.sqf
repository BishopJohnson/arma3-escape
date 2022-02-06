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

private _comp =
[
	[
		["Land_HBarrier_3_F",[-5.02332,6.11328,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-5.02332,-3.88672,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-3.72913,9.06689,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[2.79968,8.99219,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.53198,3.07861,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.46875,-3.27979,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[6.19958,8.99219,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-6.80042,8.99219,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.46875,6.72021,-0.00130129],180,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-9.53198,-6.92139,-0.00130129],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-11.321,5.03125,-0.00130129],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[-11.321,-4.96875,-0.00130129],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-5.02332,-9.88672,0],90,1,0,[0,-0],"","",true,false],
		["CamoNet_OPFOR_open_F",[5.09839,-11.6133,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[9.27087,9.06689,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-4.30432,-16.229,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[15.7997,8.99219,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[1.88574,-19.0234,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[7.88574,-19.0234,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[13.8857,-19.0234,0],0,1,0,[0,0],"","",true,false],

		// Item crates
		["Box_East_Wps_F",[1.99963,-11.0005,0],0,1,0,[0,0],"","",true,false],
		["Box_East_Ammo_F",[3.99963,-11.0005,0],90,1,0,[0,-0],"","",true,false]
	],
	30, // Radius of composition area
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["O_Quadbike_01_F",[7.99963,-11.0005,0.200709],0,random [0.2, 0.4, 0.6],0,[0,0],"","",true,false]
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
