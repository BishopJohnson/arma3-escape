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
		["Land_BagFence_End_F",[-6.88135,5.52637,0],0,1,0,[0,0],"","",true,false],  
		["Land_BagFence_Corner_F",[-8.7804,5.56445,0],180,1,0,[0,0],"","",true,false], 
		["Land_Razorwire_F",[0.476196,-9.93262,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[-2.79504,-10.0073,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[-7.79895,-4.75146,0],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Short_F",[-8.79358,7.01074,0],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_End_F",[-7.2312,8.72656,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Corner_F",[-8.78052,8.78516,0],270,1,0,[0,0],"","",true,false],  
		["Land_HBarrier_1_F",[7.20496,-10.0073,0],0,1,0,[0,0],"","",true,false], 
		["CamoNet_INDP_open_F",[1.59229,13.9014,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_3_F",[-6.81799,15.1138,0],90,1,0,[0,-0],"","",true,false],  
		["Land_HBarrier_3_F",[11.182,15.1138,0],90,1,0,[0,-0],"","",true,false],  
		["Land_HBarrier_3_F",[-4.02368,22.8037,0],135,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_3_F",[8.401,22.7715,0],45,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[1.09106,24.9771,0],0,1,0,[0,0],"","",true,false],
		
		["I_Quadbike_01_F",[2.20496,12,0.200709],270,random [0.2, 0.4, 0.6],0,[0,0],"","",true,false],
		
		// Item crates
		["Box_IND_Wps_F",[2.20496,18,0],90,1,0,[0,-0],"","[this, ""BASIC"", 1, 4] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false],
		["Box_IND_Ammo_F",[2.20496,16,0],0,1,0,[0,0],"","",true,false]
	],
	30 // Radius of composition area
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["I_static_AT_F",[-7.29504,7,-0.0749998],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The turrents that may spawn in the different fortifications
_turrent = ["I_HMG_01_high_F", "I_GMG_01_high_F", "I_static_AT_F", "I_static_AA_F"];

// Selects a turrent for each fortification
_veh select 0 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1];

_comp
