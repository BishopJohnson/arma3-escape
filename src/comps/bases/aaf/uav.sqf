/*
	Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_terminal", "_veh", "_uav"];

if (!isServer) exitWith {};

_comp =
[
	[
		["OmniDirectionalAntenna_01_olive_F",[-11.1831,1.9126,0.00883722],359.996,1,0,[0.00351962,-0.00285881],"","",true,false],
		["Land_Cargo_House_V1_F",[-10.4028,7.62207,0],307.126,1,0,[0,0],"","",true,false],
		
		// Equipment box
		["Box_AAF_Equip_F",[-6.52881,8.24707,0],202.333,1,0,[-0.000120205,0.000220117],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;
		  
		  this addItemCargoGlobal ['I_UavTerminal', 4];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_AssaultPack_dgtl', 1];
		  this addBackpackCargoGlobal ['I_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['I_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"n_uav", // Marker type
	25,      // Radius of composition area
	50       // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["I_UGV_01_rcws_F",[7.78394,-2.42871,0.01127],209.165,1,0,[-0.0864288,-0.085723],"","",true,false]
];

// The vehicles that may spawn in the different car ports
_uav = ["I_UGV_01_F", "I_UGV_01_rcws_F"];

// Selects a vehicle for each car port
_veh select 0 set [0, selectRandom _uav];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
