/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_veh", "_util", "_port1", "_port2"];

if (!isServer) exitWith {};

_comp =
[
	[ 
		["Land_CncBarrierMedium4_F",[-4.90625,3.20752,0],90,1,0,[0,-0],"","",true,false], 
		["Land_ConcreteHedgehog_01_palette_F",[-7.87158,1.06396,0],23.8734,1,0,[0,0],"","",true,false], 
		["Land_CncBarrierMedium_F",[-4.90576,7.84619,0],90,1,0,[0,-0],"","",true,false], 
		["Land_FieldToilet_F",[-8.93335,-3.77148,0.0307484],0,1,0,[0,0],"","",true,false], 
		["Land_CncBarrierMedium4_F",[-9.73535,-1.1084,0],0,1,0,[0,0],"","",true,false], 
		["Land_ConcreteHedgehog_01_palette_F",[-7.71484,6.11084,0],0,1,0,[0,0],"","",true,false], 
		["Land_FieldToilet_F",[-11.2959,-3.84717,0.0307484],0,1,0,[0,0],"","",true,false], 
		["Land_TTowerSmall_2_F",[-16.5305,1.61475,0],90,1,0,[0,-0],"","",true,false], 
		["Flag_NATO_F",[-16.1033,9.61084,0],0,1,0,[0,0],"","",true,false], 
		["WaterPump_01_forest_F",[-19.9292,-4.73096,0],0,1,0,[0,0],"","",true,false], 
		["StorageBladder_01_fuel_forest_F",[-6.70923,20.0161,0.038],180,1,0,[0,0],"","",true,false], 
		["ContainmentArea_01_forest_F",[-6.76563,20.0786,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo_HQ_V1_F",[-22.3892,4.63135,0],180,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[17.6868,-16.1455,0],247.375,1,0,[0,0],"","",true,false],  
		["CamoNet_BLUFOR_big_F",[22.5757,-9.38525,0],90,1,0,[0,-0],"","",true,false], 
		["CamoNet_BLUFOR_big_F",[22.4358,12.0483,0],90,1,0,[0,-0],"","",true,false], 
		["Land_Cargo20_military_green_F",[-12.8154,-22.3623,0.145],180.051,1,0,[0,0],"","",true,false], 
		["ContainmentArea_02_forest_F",[-25.5645,-4.82861,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo20_military_green_F",[12.9392,22.6528,0.145],348.681,1,0,[0,0],"","",true,false], 
		["StorageBladder_02_water_forest_F",[-25.6692,-4.93506,0.031],180,1,0,[0,0],"","",true,false],  
		["Land_HBarrierWall4_F",[2.87183,26.1816,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo_Patrol_V1_F",[8.95117,-26.5737,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-4.24634,27.1689,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[-8.13452,-27.3066,0],358.454,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[8.99463,-27.0547,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo_House_V1_F",[-20.6755,21.6304,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[9.71997,27.7109,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-12.7126,26.9268,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-13.0664,-27.3008,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrierWall6_F",[32.8718,0.00634766,0],90,1,0,[0,-0],"","",true,false], 
		["Land_Cargo20_military_green_F",[-23.8364,-20.9565,0.145],163.029,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[17.5142,-26.8145,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-32.8911,0.679688,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrierWall4_F",[-19.9287,-26.2192,0],180,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[18.2197,27.9785,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-32.7097,-7.8125,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[32.5708,8.16064,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[-21.2419,26.689,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[33.0322,-8.71631,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[-33.1157,9.19092,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrierWall6_F",[-32.3535,-16.7275,0],270,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[32.2942,16.7822,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[25.9761,-26.5449,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[33.2874,-17.2446,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[-33.3669,17.7905,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrierWall4_F",[-28.0957,25.3853,0],0,1,0,[0,0],"","",true,false], 
		["Land_Cargo_Patrol_V1_F",[26.9346,27.8828,0],180,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[-26.9482,-27.7427,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_Big_F",[26.6494,28.2188,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrierWall_corner_F",[32.2783,-24.4976,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[-32.2815,-24.5933,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_Big_F",[32.0146,25.2744,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrierWall_corner_F",[-32.6343,24.8179,0],270,1,0,[0,0],"","",true,false]
	],
	"b_motor_inf", // Marker type
	45,            // Radius of composition area
	80             // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_Truck_01_Repair_F",[-22.5251,-13.3286,0.114967],90,random [0.25, 0.5, 1],0,[0,-0],"","",true,false], // Util
	["B_MRAP_01_hmg_F",[21.4658,-9.46631,0.148828],270,random [0.25, 0.45, 0.9],random [0, 0.1, 0.3],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],           // Port 1
	["B_APC_Wheeled_01_cannon_F",[21.4778,12.0347,0.112128],270,random [0.15, 0.4, 0.7],random [0.6, 0.65, 0.7],[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false] // Port 2
];

// The vehicles that may spawn in the different car ports
_util = ["B_Truck_01_Repair_F", "B_Truck_01_medical_F", "B_Truck_01_fuel_F", "B_Truck_01_ammo_F"];
_port1 = ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F", "B_MRAP_01_F", "B_LSV_01_AT_F", "B_LSV_01_armed_F", "B_LSV_01_unarmed_F"];
_port2 = ["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F", "B_LSV_01_AT_F", "B_LSV_01_armed_F", "B_APC_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F"];

// Selects a vehicle for each car port
_veh select 0 set [0, selectRandom _util];
_veh select 1 set [0, selectRandom _port1];
_veh select 2 set [0, selectRandom _port2];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
