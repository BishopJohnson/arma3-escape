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
		["Land_TTowerSmall_1_F",[-4.4502,-4.01172,0],180,1,0,[0,0],"","",true,false],
		["Land_Cargo20_sand_F",[4.22705,14.3662,0],231.1,1,0,[0,0],"","",true,false],
		["Land_Cargo_HQ_V3_F",[-7.13281,-13.0391,0],90,1,0,[0,-0],"","",true,false],
		["Land_Cargo20_sand_F",[8.42285,-15.8081,4.76837e-007],29.0115,1,0,[0,0],"","",true,false],
		["Land_Communication_F",[-4.44385,-5.98535,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierTower_F",[16.0115,-9.10059,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[18.2808,-2.8584,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Small_F",[-19.3062,1.78857,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[-18.5225,-4.65869,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-21.2922,-2.19824,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagBunker_Large_F",[18.77,11.6289,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall6_F",[2.46655,22.5815,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-18.3997,-9.66895,0],90,1,0,[0,-0],"","",true,false],
		["Land_FieldToilet_F",[16.9431,-14.1294,6.67572e-006],89.9995,1,0,[-0,-0],"","",true,false],
		["Land_WaterTank_F",[10.4954,19.6431,2.86102e-006],90,1,0,[0,0],"","",true,false],
		["Land_Razorwire_F",[-21.0747,-5.38281,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall4_F",[4.70044,-21.877,0],180,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-22.1851,5.06104,0],0.000317645,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-4.06201,22.7383,0],0,1,0,[0,0],"","",true,false],
		["Land_WaterTank_F",[12.3635,19.6289,9.53674e-005],89.9995,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-5.40283,-23.4409,0],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[16.9639,-16.6162,1.90735e-006],90.0052,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-18.9871,17.1997,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall6_F",[-12.2166,22.2954,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[-21.1091,-11.9536,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[15.3411,21.2817,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[19.3479,-13.1807,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_5_F",[-11.1763,-23.4595,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-18.375,-15.4629,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[11.4233,22.8364,0],0,1,0,[0,0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-22.1851,13.061,0],0.000317645,1,0,[-0,-0],"","",true,false],
		["Land_HBarrier_Big_F",[11.7861,-22.9595,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_1_F",[24.9436,6.97266,0],90,1,0,[0,-0],"","",true,false],
		["Land_Razorwire_F",[-20.8916,-15.1382,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[-17.7378,20.5093,0],270,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-16.9487,-23.4429,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrierWall_corner_F",[18.01,-21.0034,0],90,1,0,[0,-0],"","",true,false],
		["Land_CzechHedgehog_01_new_F",[-26.1851,9.06104,0],0.000317645,1,0,[-0,-0],"","",true,false],
		["Land_Razorwire_F",[25.1509,13.5195,-2.38419e-006],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_3_F",[-18.438,-21.2007,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[24.9333,16.7041,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-21.0989,-21.6851,0],90,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[19.021,25.1895,-0.00130129],310.251,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[16.2832,27.5903,-0.00130129],130.251,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[18.929,27.6943,-0.00130129],220.251,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-22.5505,-24.4297,-0.00130129],137.713,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[-23.5779,24.0386,-0.00130129],45.0033,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-20.1477,-27.1655,-0.00130129],317.713,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-20.9583,26.5688,-0.00130129],225.003,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[24.0164,-24.4839,-0.00130129],223.964,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[21.4431,-27.0605,-0.00130129],43.9643,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-22.7847,-26.9253,-0.00130129],47.7126,1,0,[0,0],"","",true,false],
		["Land_BagFence_Round_F",[-23.4624,26.6841,-0.00130129],135.003,1,0,[0,-0],"","",true,false],
		["Land_BagFence_Round_F",[23.949,-27.1313,-0.00130129],313.964,1,0,[0,0],"","",true,false],
		["Flag_CSAT_F",[-12.0425,-6.10303,0],270,1,0,[0,0],"","",true,false],
		
		// Data terminal
		["Land_DataTerminal_01_F",[-2.87866,-5.92285,0],270,1,0,[0,0],"","this execVM ""src\fnc\rescue\rescueCommAction.sqf"";",true,false]
	],
	"o_hq", // Marker type
	40,     // Radius of composition area
	80      // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["O_Truck_03_covered_F",[-11.314,14.666,-0.00593853],90,random [0.2, 0.5, 1],0,[-0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[17.7551,-9.41895,2.280],90.0022,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false], // Tower static weapon
	["O_HMG_01_high_F",[22.6924,-26.2065,-0.0871181],132.913,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[-22.2229,25.7373,-0.0871181],313.952,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[-21.78,-25.7319,-0.0871172],226.664,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["O_HMG_01_high_F",[18.0879,26.3809,-0.0871177],39.203,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The vehicles that may spawn as the parked vehicle
_car = ["O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F", "O_LSV_02_unarmed_F", "O_LSV_02_armed_F", "O_LSV_02_AT_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F"];

// The turrents that may spawn in the different fortifications
_turrent = ["O_HMG_01_high_F", "O_GMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];

// Selects a vehicle to be parked
_veh select 0 set [0, selectRandom _car];

// Selects a turrent for each fortification
_veh select 1 set [0, selectRandom ["O_HMG_01_high_F", "O_GMG_01_high_F"]];
_veh select 2 set [0, selectRandom _turrent];
_veh select 3 set [0, selectRandom _turrent];
_veh select 4 set [0, selectRandom _turrent];
_veh select 5 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
