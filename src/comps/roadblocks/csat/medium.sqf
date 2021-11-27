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
		["Land_HBarrier_3_F",[-5.02332,6.11328,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_3_F",[-5.02332,-3.88672,0],90,1,0,[0,-0],"","",true,false], 
		["Land_Razorwire_F",[-3.72913,9.06689,-2.38419e-006],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[2.79968,8.99219,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-9.53198,3.07861,-0.00130129],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-9.46875,-3.27979,-0.00130129],180,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[6.19958,8.99219,0],0,1,0,[0,0],"","",true,false],   
		["Land_HBarrier_1_F",[-6.80042,8.99219,0],0,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-9.46875,6.72021,-0.00130129],180,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-9.53198,-6.92139,-0.00130129],0,1,0,[0,0],"","",true,false],  
		["Land_BagFence_Round_F",[-11.321,5.03125,-0.00130129],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Round_F",[-11.321,-4.96875,-0.00130129],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_3_F",[-5.02332,-9.88672,0],90,1,0,[0,-0],"","",true,false], 
		["CamoNet_OPFOR_open_F",[5.09839,-11.6133,0],0,1,0,[0,0],"","",true,false],  
		["Land_Razorwire_F",[9.27087,9.06689,-2.38419e-006],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[-4.30432,-16.229,0],45,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_1_F",[15.7997,8.99219,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[1.88574,-19.0234,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[7.88574,-19.0234,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_3_F",[13.8857,-19.0234,0],0,1,0,[0,0],"","",true,false],
		
		["O_Quadbike_01_F",[7.99963,-11.0005,0.200709],0,random [0.2, 0.4, 0.6],0,[0,0],"","",true,false],
		
		// Item crates
		["Box_East_Wps_F",[1.99963,-11.0005,0],0,1,0,[0,0],"","[this, ""BASIC"", 1, 4] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false],
		["Box_East_Ammo_F",[3.99963,-11.0005,0],90,1,0,[0,-0],"","",true,false]
	],
	30 // Radius of composition area
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["O_static_AT_F",[-9.50037,4.99951,-0.0749998],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false], 
	["O_HMG_01_high_F",[-9.80042,-4.80029,-0.0749998],270,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The turrents that may spawn in the different fortifications
_turrent = ["O_HMG_01_high_F", "O_GMG_01_high_F", "O_static_AT_F", "O_static_AA_F"];

// Selects a turrent for each fortification
_veh select 0 set [0, selectRandom _turrent];
_veh select 1 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1];

_comp
