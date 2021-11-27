/*
	Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_terminal", "_veh", "_uav"];

if (!isServer) exitWith {};

_terminal = [] call compile preProcessFile "src\fnc\randomCargo\playerUavTerminal.sqf";

_comp =
[
	[
		["Land_Cargo_House_V3_F",[-9.53418,11.2295,0],329.857,1,0,[0,0],"","",true,false],
		["Land_SatelliteAntenna_01_F",[-12.0935,7.26758,-0.00388479],207.318,1,0,[0.0196104,0.0133862],"","",true,false],
		
		// Equipment box
		["Box_CSAT_Equip_F",[-5.59668,10.418,4.76837e-007],230.89,1,0,[-1.7567e-005,0.000227304],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;
		  
		  this addItemCargoGlobal ['" + _terminal + "', 1];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addBackpackCargoGlobal ['B_FieldPack_ocamo', 1];
		  this addBackpackCargoGlobal ['O_UAV_01_backpack_F', 1];
		  this addBackpackCargoGlobal ['O_UGV_02_Demining_backpack_F', 1];
		 ",true,false]
	],
	"o_uav", // Marker type
	25,      // Radius of composition area
	50       // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["O_UGV_01_rcws_F",[7.5105,-1.06641,0.0112128],212.704,1,0,[-0.0881294,-0.0890837],"","",true,false]
];

// The vehicles that may spawn in the different car ports
_uav = ["O_UGV_01_F", "O_UGV_01_rcws_F"];

// Selects a vehicle for each car port
_veh select 0 set [0, selectRandom _uav];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
