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
		["Land_Cargo_House_V1_F",[-10.2351,12.1616,0],327.177,1,0,[0,0],"","",true,false],
		["SatelliteAntenna_01_Olive_F",[-13.509,8.46094,-0.00388145],226.229,1,0,[0.0109715,0.0014195],"","",true,false],
		
		// Equipment box
		["Box_NATO_Equip_F",[-6.36719,11.5259,-4.76837e-007],221.012,1,0,[-0.000181165,0.000400534],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;
		  
		  this addItemCargoGlobal ['B_UavTerminal', 4];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_AssaultPack_rgr', 1];
		  this addBackpackCargoGlobal ['B_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['B_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"b_uav", // Marker type
	25,      // Radius of composition area
	50       // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_UGV_01_rcws_F",[4.81787,-3.41357,0.011271],209.059,1,0,[-0.0867619,-0.0858628],"","",true,false]
];

// The vehicles that may spawn in the different car ports
_uav = ["B_UGV_01_F", "B_UGV_01_rcws_F", "B_T_UAV_03_dynamicLoadout_F"];

// Selects a vehicle for each car port
_veh select 0 set [0, selectRandom _uav];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
