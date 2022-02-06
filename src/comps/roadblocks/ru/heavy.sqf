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
		["Land_FieldToilet_F",[-1,-11,9.53674e-006],180,1,0,[-0.000359934,-0.000356872],"","",true,false],
		["Land_HBarrier_5_F",[-8.00385,10.2485,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Tower_F",[-8.01685,-7.98047,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[0.751282,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V3_F",[9.99994,-8.97852,0],180,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-9.93262,9.729,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[11.5,-6,1.4782e-005],90,1,0,[0.0007388,0.000981953],"","",true,false],
		["Land_HBarrier_5_F",[-8.24872,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-1.00256,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-12.9051,-6.271,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[2.37915,16.1343,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-6.50256,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[6.99744,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[11.7513,11.6963,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[12.4974,-15,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[18.9961,-3.65137,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[18.9961,9.24854,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[17.9948,10.9053,0],135,1,0,[0,-0],"","",true,false],
		["Land_DragonsTeeth_01_4x2_new_F",[13.3792,16.1343,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[18.9176,-12.9648,0],90,1,0,[0,-0],"","",true,false],

		// Item crates
		["Box_East_Ammo_F",[-9.20001,-10.5,0],0,1,0,[0,0],"","",true,false],
		["Box_East_WpsLaunch_F",[-7.51282,-5.4834,0],0,1,0,[0,0],"","",true,false],
		["Box_East_Support_F",[-9.04974,-5.53027,0],90,1,0,[0,0],"",
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
	["O_MRAP_02_hmg_F",[-4.99823,7.99707,0.00649929],270,random [0.2, 0.4, 0.6],0,[0,0],"",
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

_comp
