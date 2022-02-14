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
private _ammoBoxInit = format ["[this, '%1', '%2'] execVM '%3';", CARGO_AMMO_KEY, _faction, _cargoPath];

private _comp =
[
	[
		["Land_HBarrier_5_F",[7.59033,17.1763,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[1.80298,16.9658,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[13.4702,12.8359,0],180,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[-14.0002,8.00342,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[14.8396,17.1099,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-1.08252,-23.1978,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-5.35596,23.4033,0],0,1,0,[0,0],"","",true,false],
		["Land_Communication_F",[-15.4827,8.01465,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Large_F",[-9.92017,-22.9531,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[-24.3496,3.75732,1.43051e-005],90,1,0,[0.00267914,0.00232763],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-22.2344,11.3047,0],180,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Small_F",[-0.553467,25.7549,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[5.85938,24.814,0],0,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[8.87598,-24.6611,0],270,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[-26.2178,3.77148,5.72205e-006],90,1,0,[0.00168639,0.00217434],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-10.4231,25.6353,0],268.832,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[17.5498,-23.3325,0],180,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[29.2144,1.87109,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[-17.2297,24.6523,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[14.2817,25.0049,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-18.9866,-23.5669,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[26.8394,13.8496,-4.76837e-007],277.429,1,0,[2.58753e-005,-6.10778e-006],"","",true,false],
		["Land_Cargo20_sand_F",[-27.9663,-13.0117,0],99.522,1,0,[-5.79524e-005,8.54671e-006],"","",true,false],
		["Land_HBarrierWall4_F",[-31.0173,3.42773,0],270,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[28.7715,-12.8218,-6.19888e-006],89.9986,1,0,[0.000631412,0.000318597],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-31.9871,-1.53125,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[28.7922,-15.3086,-6.19888e-006],89.9986,1,0,[0.000631412,0.000318597],"","",true,false],
		["Land_HBarrier_Big_F",[-32.2537,-8.13818,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[32.0779,9.24951,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.5928,10.3086,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[22.842,25.2969,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[25.4109,-23.1875,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-25.5017,-23.4937,0],268.832,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-25.4597,24.4023,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[32.502,-14.1821,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-32.0771,-16.9028,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[31.8376,17.8535,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-32.887,19.4551,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[31.6687,-21.2949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-30.418,-23.1309,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[29.9397,23.8945,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-31.5645,22.7773,0],270,1,0,[0,0],"","",true,false],
		["Flag_US_F",[-16.073,17.1113,0],0,1,0,[0,0],"","",true,false],

		// Turrets
		["RHS_Stinger_AA_pod_D",[11.1765,15.9536,-0.0781221],179.999,1,0,[3.60757e-005,-4.06354e-005],"","",true,false],
		["RHS_TOW_TriPod_D",[6.07202,-24.8252,2.78],179.999,1,0,[-0.128074,0.00597098],"","",true,false],
		["RHS_M2StaticMG_D",[-0.112549,25.2993,-0.0654697],0.000188695,1,0,[0.000158564,0.00128657],"","",true,false],
		["RHS_M2StaticMG_D",[9.91235,-25.0581,2.78],180.001,1,0,[0.000181609,-0.00275196],"","",true,false],
		["RHS_M2StaticMG_D",[30.457,0.860352,2.78],90.0041,1,0,[0.00208276,-0.0058587],"","",true,false],

		// Supply boxes
		["Box_NATO_Ammo_F",[5.91626,-24.7046,0],0,1,0,[0,0],"",_ammoBoxInit,true,false],
		["Box_NATO_Ammo_F",[-0.474854,15.373,0],90,1,0,[0,0],"",_ammoBoxInit,true,false],

		// Data terminal
		["Land_DataTerminal_01_F",[-15.5222,6.35889,0],0,1,0,[0,0],"","this execVM 'src\fnc\rescue\rescueCommAction.sqf';",true,false]
	],
	"b_hq", // Marker type
	50,     // Radius of composition area
	80,     // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_CAR_ARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY, RAND_VEH_TRUCK_ARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["rhsusf_M977A4_BKIT_usarmy_d",[-15.3491,-7.72363,0],90,random [0.2, 0.5, 1],0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
