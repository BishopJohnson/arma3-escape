/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp"];

if (!isServer) exitWith {};

_comp =
[
	[ 
		["Land_BagFence_Long_F",[-1.92358,-0.0415039,0],225,1,0,[0,0],"","",true,false],  
		["Land_BagFence_Long_F",[2.08301,-0.0991211,0],315,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-1.81714,-2.29736,0],90,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Round_F",[1.86182,-2.38867,0],270,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-2.05176,1.96729,0],315,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[2.17041,1.84277,0],225,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Round_F",[-0.0314941,-4.18896,0],0,1,0,[0,0],"","",true,false],
		["B_Mortar_01_F",[0.000244141,-1.86865,-0.0749998],180,1,0,[0,0],"","",true,false]
	],
	"b_mortar", // Marker type
	10,         // Radius of composition area
	25          // Radius of patrol
];

_comp
