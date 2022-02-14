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
private _ammoBoxInit = format ["[this, '%1', '%2'] execVM '%3';", CARGO_AMMO_KEY, _faction, _cargoPath];

private _comp =
[
	[
		["Land_HBarrier_5_F",[5.34863,9.7041,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[-13.3921,9.26367,2.00272e-005],360,1,0,[0.00140911,-0.000314683],"","",true,false],
		["Land_HBarrier_5_F",[9.58813,15.5815,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[-13.3921,11.5273,-4.29153e-006],360,1,0,[-0.000118484,0.000303143],"","",true,false],
		["Land_HBarrier_5_F",[-3.2522,16.8569,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[5.07715,16.9604,0],0,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[4.48535,-20.5068,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[12.562,-16.9961,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[-3.74243,-21.2725,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[0.759033,21.9946,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-8.78149,-21.0171,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Small_F",[-5.72021,22.7046,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[7.28345,22.5171,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-12.9558,21.8286,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-22.7734,12.396,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-13.8225,-21.5874,0],180,1,0,[0,0],"","",true,false],
		["Land_Fort_Watchtower_EP1",[23.7886,-8.71191,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[12.7239,-22.4893,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[13.9041,21.7227,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[26.1055,-1.86719,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Large_F",[24.6738,10.8745,0],270,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_2_F",[-25.6919,4.60742,0],180,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-17.5305,21.626,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-20.188,-20.376,1.90735e-006],180,1,0,[-0.000104584,-3.22259e-005],"","",true,false],
		["Land_HBarrier_1_F",[-16.6563,23.3882,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[23.1689,18.3271,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[28.2195,-6.19336,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[21.1794,20.6572,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[17.7092,-22.4248,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-22.3113,-20.376,1.43051e-006],180.001,1,0,[0.000212172,-0.000329921],"","",true,false],
		["Land_HBarrier_3_F",[25.9465,-14.7617,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[28.437,-9.37793,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-30.498,4.21973,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-30.3777,-5.26172,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-21.0396,-22.9893,0],0,1,0,[0,0],"","",true,false],
		["Land_Communication_F",[-25.7415,6.01465,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[30.9253,5.95361,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-30.2766,8.83643,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-23.2109,23.4629,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[24.5667,-20.2949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[28.2297,-15.9248,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[31.1326,12.5005,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-30.968,-12.043,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-32.2908,7.92432,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[-28.6609,-17.0244,0],270,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[-25.3865,21.626,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-32.0835,14.4712,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-30.2766,16.7104,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[30.915,15.6851,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-26.2952,23.3882,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-28.1201,-21.7251,0],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-32.301,17.6558,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-30.2954,21.5938,0],45,1,0,[0,0],"","",true,false],
		["FlagCarrierCDF",[-18.1174,6.10303,0],90,1,0,[0,-0],"","",true,false],

		// Turrets
		["rhsgref_cdf_Igla_AA_pod",[6.42505,12.981,0],90,1,0,[-0.000231792,0.00128232],"","",true,false],
		["rhsgref_cdf_SPG9M",[1.58032,-20.9746,2.78],180,1,0,[4.79057e-006,5.69885e-005],"","",true,false],
		["rhsgref_cdf_AGS30_TriPod",[24.0793,-11.9067,2.78],90,1,0,[-1.82562e-005,0.000170146],"","",true,false],
		["rhsgref_cdf_DSHKM",[-5.42896,21.9302,0],0,1,0,[0.986278,0.0507068],"","",true,false],
		["rhsgref_cdf_DSHKM",[5.47461,-20.52,2.78],180,1,0,[0.986527,0.0551599],"","",true,false],

		// Supply boxes
		["Box_NATO_Ammo_F",[23.6963,-11.7412,0],90,1,0,[0,0],"",_ammoBoxInit,true,false],
		["Box_NATO_Ammo_F",[-5.53516,15.2939,0],90,1,0,[0,0],"",_ammoBoxInit,true,false],

		// Data terminal
		["Land_DataTerminal_01_F",[-25.6926,3.30713,0],0,1,0,[0,0],"","this execVM 'src\fnc\rescue\rescueCommAction.sqf';",true,false]
	],
	"n_hq", // Marker type
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
	["rhsgref_cdf_b_ural",[-20.5088,-5.51709,0],90,random [0.2, 0.5, 1],0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
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
