/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_veh", "_turrent"];

if (!isServer) exitWith {};

_comp =
[
	[ 
		["Land_HBarrier_3_F",[-1.11426,-9.02246,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-12.032,3.07959,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-11.9688,-3.27881,0],180,1,0,[0,0],"","",true,false],   
		["Land_BagFence_Round_F",[-11.9688,6.72119,0],180,1,0,[0,0],"","",true,false], 
		["CamoNet_BLUFOR_open_F",[4.09839,12.3877,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-12.032,-6.92041,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-13.7211,-4.96777,0],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Round_F",[-13.7211,5.03223,0],90,1,0,[0,-0],"","",true,false],  
		["Land_CzechHedgehog_01_new_F",[5.99963,-12.9995,0],0,1,0,[0,0],"","",true,false], 
		["Land_CzechHedgehog_01_new_F",[-7.00037,-12.9995,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_End_F",[-10.0365,10.9272,0],0,1,0,[0,0],"","",true,false],  
		["Land_HBarrier_3_F",[11.8857,-9.02246,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Corner_F",[-11.9856,10.9653,0],180,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-11.9849,13.0044,0],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_End_F",[-10.3365,15.377,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Corner_F",[-11.9858,15.3857,0],270,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[-2.24915,19.9966,0],0,1,0,[0,0],"","",true,false], 
		["Land_CzechHedgehog_01_new_F",[-0.000366211,-19.9995,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[5.75085,19.9966,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[-10.2491,19.9966,0],0,1,0,[0,0],"","",true,false], 
		["Land_CzechHedgehog_01_new_F",[12.9996,-19.9995,0],0,1,0,[0,0],"","",true,false], 
		["Land_CzechHedgehog_01_new_F",[19.9996,-12.9995,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[13.5509,19.9966,0],0,1,0,[0,0],"","",true,false],
		
		["B_Quadbike_01_F",[1.99963,13.0005,0.200709],180,random [0.2, 0.4, 0.6],0,[0,0],"","",true,false],
		
		// Item crate
		["Box_NATO_Wps_F",[7.99963,13.0005,0],0,1,0,[0,0],"","[this, ""BASIC"", 1, 4] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false],
		["Box_NATO_Ammo_F",[5.99963,13.0005,0],90,1,0,[0,-0],"","",true,false]
	],
	30 // Radius of composition area
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_static_AT_F",[-12.0004,5.00049,-0.0749998],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false], 
	["B_HMG_01_high_F",[-12.2003,-4.79932,-0.0749998],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The turrents that may spawn in the different fortifications
_turrent = ["B_HMG_01_high_F", "B_GMG_01_high_F", "B_static_AT_F", "B_static_AA_F"];

// Selects a turrent for each fortification
_veh select 0 set [0, selectRandom _turrent];
_veh select 1 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1];

_comp
