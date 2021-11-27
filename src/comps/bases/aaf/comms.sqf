/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_veh", "_car", "_turrent"];

if (!isServer) exitWith {};

_comp =
[
	[ 
		["Land_WaterTank_F",[-4.8064,9.26367,2.00272e-005],360,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[-4.8064,11.5273,4.43459e-005],360,1,0,[0,-0],"","",true,false],
		["Land_Cargo_HQ_V1_F",[-14.1877,12.396,0],270,1,0,[0,0],"","",true,false],
		["Land_TTowerSmall_1_F",[-17.124,4.01172,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Tower_F",[15.8818,-11.2017,0],270,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[4.64917,-19.7905,4.76837e-007],180,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[20.1099,5.63232,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[19.824,-5.21729,0],90,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[6.77246,-19.7905,0],180,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-4.37012,21.8286,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-21.9124,4.21973,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[-5.06372,-21.4761,0],180,1,0,[0,0],"","",true,false],
		["Land_SandbagBarricade_01_hole_F",[-21.3579,6.34473,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[-21.792,-5.26172,0],90,1,0,[0,-0],"","",true,false],
		["Land_SandbagBarricade_01_F",[-6.67847,21.4277,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[2.93359,22.5171,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[22.1196,-6.19336,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-8.94482,21.626,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[0.0778809,-23.4668,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-21.6909,8.83643,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[6.47607,-22.6895,0],0,1,0,[0,0],"","",true,false],
		["Land_SandbagBarricade_01_F",[-21.4556,10.2642,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[9.5542,21.7227,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Large_F",[21.7991,10.8745,0],270,1,0,[0,0],"","",true,false],
		["Land_Communication_F",[-17.1558,6.01465,0],0,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[22.3372,-9.37793,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corridor_F",[-22.3823,-12.043,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[19.8467,-14.7617,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[18.8191,18.3271,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-12.4155,-23.2095,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall4_F",[-20.0752,-17.0244,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[11.5308,-22.4453,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[16.8296,20.6572,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[22.1299,-15.9248,0],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-21.6909,16.7104,-9.53674e-006],90,1,0,[0,-0],"","",true,false],
		["Land_Mil_WiredFence_F",[-16.8008,21.626,-9.53674e-006],180,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[18.4668,-20.2949,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[28.0505,5.95361,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-19.5344,-21.7251,0],180,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[28.2578,12.5005,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-21.7097,21.5938,0],45,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[28.0403,15.6851,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[22.4326,23.8438,-0.00130129],310.251,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[19.6948,26.2446,-0.00130129],130.251,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[-22.3455,25.1099,-0.00130129],225.991,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-25.0081,22.626,-0.00130129],45.9907,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[23.9832,-23.8247,-0.00130129],224.236,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[21.3979,-26.3882,-0.00130129],44.2362,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[22.3406,26.3486,-0.00130129],220.251,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-24.8474,25.2686,-0.00130129],135.991,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[23.9033,-26.4712,-0.00130129],314.236,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-22.6189,-27.2363,-0.00130129],311.198,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-25.3167,-24.791,-0.00130129],131.198,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[-25.2659,-27.2974,-0.00130129],41.1975,1,0,[0,0],"","",true,false],
		["Flag_AAF_F",[-9.53174,6.10303,0],90,1,0,[0,-0],"","",true,false],
		
		// Data terminal
		["Land_DataTerminal_01_F",[-17.1069,3.30713,0],0,1,0,[0,0],"","this execVM ""src\fnc\rescue\rescueCommAction.sqf"";",true,false]
	],
	"n_hq", // Marker type
	40,     // Radius of composition area
	80      // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["I_Truck_02_covered_F",[-14.8665,-5.42773,0.0607977],90,random [0.2, 0.5, 1],0,[-0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[17.8738,-12.0562,2.78],90,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false], // Tower static weapon
	["I_HMG_01_high_F",[-24.1846,-25.9863,-0.0871181],221,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[22.6519,-25.3213,-0.0871191],134,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[-23.6316,24.0815,-0.0871172],316,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[21.2808,25.0205,-0.0871172],40.3608,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The vehicles that may spawn as the parked vehicle
_car = ["I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F", "I_Truck_02_transport_F", "I_Truck_02_covered_F"];

// The turrents that may spawn in the different fortifications
_turrent = ["I_HMG_01_high_F", "I_GMG_01_high_F", "I_static_AT_F", "I_static_AA_F"];

// Selects a vehicle to be parked
_veh select 0 set [0, selectRandom _car];

// Selects a turrent for each fortification
_veh select 1 set [0, selectRandom ["I_HMG_01_high_F", "I_GMG_01_high_F"]];
_veh select 2 set [0, selectRandom _turrent];
_veh select 3 set [0, selectRandom _turrent];
_veh select 4 set [0, selectRandom _turrent];
_veh select 5 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
