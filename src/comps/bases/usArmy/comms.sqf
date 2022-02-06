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

private _comp =
[
	[
		["Land_WaterTank_F",[-9.87964,3.75732,5.24521e-006],90,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[0.469727,8.00342,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[-11.7478,3.77148,1.85966e-005],90,1,0,[-0,0],"","",true,false],
		["Land_Cargo_HQ_V1_F",[-7.7644,11.3047,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-16.5474,3.42773,0],270,1,0,[0,0],"","",true,false],
		["Land_Cargo20_military_green_F",[-13.2429,-11.3696,0],99.522,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-17.5171,-1.53125,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierTower_F",[17.1758,-6.48291,0],270,1,0,[0,0],"","",true,false],
		["Land_Communication_F",[-1.0127,8.01465,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo20_military_green_F",[-2.08057,-18.7529,0],14.0859,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-17.7837,-8.13818,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[19.5393,-0.242676,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-18.1228,10.3086,0],90,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[16.605,-12.8218,-4.29153e-006],89.9986,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[4.41626,-23.3325,0],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[16.6257,-15.3086,-4.29153e-006],89.9986,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[19.5027,12.8682,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-2.75977,24.6523,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-4.5166,-23.5669,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[19.3684,-14.1821,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-17.6072,-16.9028,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-18.417,19.4551,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-11.0317,-23.4937,0],268.832,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[4.04688,25.6353,0],268.832,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[12.2773,-23.1875,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[19.6711,17.8535,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-10.9897,24.4023,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[10.5686,24.9219,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-15.948,-23.1309,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[18.5352,-21.2949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-17.0945,22.7773,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[17.7732,23.8945,0],0,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-22.3423,-26.9717,-0.00130129],132.86,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[-23.2397,26.3223,-0.00130129],42.7297,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-19.7161,-29.4946,-0.00130129],312.86,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-20.7224,28.9541,-0.00130129],222.73,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[25.0505,-25.4897,-0.00130129],223.739,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[22.4873,-28.0767,-0.00130129],43.7392,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-22.3643,-29.478,-0.00130129],42.8598,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[24.0403,27.79,-0.00130129],311.27,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-23.2292,28.9702,-0.00130129],132.73,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[21.3452,30.2397,-0.00130129],131.27,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[24.9934,-28.1372,-0.00130129],313.739,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[23.9927,30.2964,-0.00130129],221.27,1,0,[0,0],"","",true,false],
		["Flag_US_F",[-1.60303,17.1113,0],0,1,0,[0,0],"","",true,false],

		// Data terminal
		["Land_DataTerminal_01_F",[-1.05225,6.35889,0],0,1,0,[0,0],"","this execVM 'src\fnc\rescue\rescueCommAction.sqf';",true,false]
	],
	"b_hq", // Marker type
	40,     // Radius of composition area
	80,     // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_CAR_ARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY, RAND_VEH_MRAP_UNARMED_KEY, RAND_VEH_MRAP_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["B_Truck_01_covered_F",[10.6775,17.8057,0.0236564],180,random [0.2, 0.5, 1],0,[-0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
