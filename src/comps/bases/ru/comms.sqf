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
private _ammoBoxInit = format ["[this, '%1', '%2'] execVM '%3';", CARGO_AMMO_KEY, _faction, _cargoPath];

private _comp =
[
	[
		["Land_HBarrier_5_F",[-8.16162,-0.220215,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[9.17041,11.9614,0],90,1,0,[0,-0],"","",true,false],
		["Land_TTowerSmall_2_F",[-10.5959,-4.51953,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[15.0503,7.62109,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[-10.1816,12.771,-4.76837e-007],185.359,1,0,[4.7233e-005,5.29669e-006],"","",true,false],
		["Land_FieldToilet_F",[0.597412,-18.2905,3.8147e-006],179.998,1,0,[0.000248885,-0.000466074],"","",true,false],
		["Land_FieldToilet_F",[2.41553,-18.3008,-6.19888e-006],179.999,1,0,[0.000647716,0.000377164],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-13.1677,-13.0391,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[16.4197,11.895,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-11.2922,16.1626,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[-20.2512,2.95654,0],90,1,0,[0,-0],"","",true,false],
		["Land_Communication_F",[-10.4788,-5.98535,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[12.8667,-16.9668,0],1.93052,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[0.727051,21.5088,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[2.08838,-22.1904,0],6.09044,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[20.9509,-9.46094,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-3.57153,-23.2363,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[7.52612,-22.3301,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[9.9209,22.5229,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-8.52173,23.1685,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Small_F",[-25.3411,1.78857,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-24.5574,-4.65869,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-11.4529,-23.4575,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-11.3281,22.521,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[17.9185,19.6431,2.86102e-006],90,1,0,[0.00186963,0.00221576],"","",true,false],
		["Land_HBarrier_5_F",[-24.4346,-9.66895,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Small_F",[25.8765,-10.4668,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-27.3271,-2.19824,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-18.2515,22.2954,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[26.9558,-5.55029,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-17.2112,-23.4595,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[19.7866,19.6289,8.58307e-006],90,1,0,[0.00259054,0.00235264],"","",true,false],
		["Land_Razorwire_F",[-27.1096,-5.38281,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Large_F",[26.1931,11.6289,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[12.6641,-25.7246,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-25.022,17.1997,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-27.144,-11.9536,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[18.8162,22.7925,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[22.7642,21.2817,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[19.1616,-22.9404,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-24.4099,-15.4629,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[26.771,-13.1807,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-22.9836,-23.4429,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-23.7727,20.5093,0],270,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-26.9265,-15.1382,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[25.4331,-21.0034,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-24.4729,-21.2007,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[32.3667,6.97266,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[32.574,13.5195,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-27.1338,-21.6851,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[32.3564,16.7041,0],90,1,0,[0,-0],"","",true,false],
		["rhs_Flag_Russia_F",[-18.0771,-6.10303,0],270,1,0,[0,0],"","",true,false],

		// Turrets
		["rhs_Igla_AA_pod_msv",[12.4812,10.5928,-0.0749998],180,1,0,[-7.33041e-006,-1.10495e-005],"","",true,false],
		["rhs_Kornet_9M133_2_msv",[-0.719971,22.041,2.78],359.99,1,0,[-0.000170214,0.000354742],"","",true,false],
		["rhs_Metis_9k115_2_msv",[4.09375,21.9331,2.78],0.000543719,1,0,[-9.63567e-006,-0.000138597],"","",true,false],
		["rhs_KORD_high_MSV",[-24.8081,1.98145,-0.0682845],270.001,1,0,[2.99077e-005,8.27437e-006],"","",true,false],
		["rhs_KORD_high_MSV",[25.426,-10.707,-0.0682855],89.9955,1,0,[1.15435e-005,5.04634e-005],"","",true,false],

		// Supply boxes
		["Box_NATO_Ammo_F",[3.71777,21.3013,-1.43051e-006],359.994,1,0,[-0.000914786,0.00121226],"",_ammoBoxInit,true,false],
		["Box_NATO_Ammo_F",[-6.92554,-0.223145,-2.86102e-006],359.996,1,0,[0.00068532,-0.00117371],"",_ammoBoxInit,true,false],

		// Data terminal
		["Land_DataTerminal_01_F",[-8.91357,-5.92285,0],270,1,0,[0,0],"","this execVM 'src\fnc\rescue\rescueCommAction.sqf';",true,false]
	],
	"o_hq", // Marker type
	50,     // Radius of composition area
	80,     // Radius of patrol
	_faction
];

// Setup cars
private _carEntries =
[
	_side,
	_faction,
	[RAND_VEH_CAR_UNARMED_KEY, RAND_VEH_CAR_ARMED_KEY, RAND_VEH_TRUCK_UNARMED_KEY]
] call compile preprocessFile "src\comps\getVehicles.sqf";

private _cars =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	["RHS_Ural_VDV_01",[12.9851,-10.5537,0],90,random [0.2, 0.5, 1],0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
