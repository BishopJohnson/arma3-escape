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
		["Land_HBarrier_1_F",[1,10.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-9.00385,9.24854,0],90,1,0,[0,-0],"","",true,false],
		["Land_WaterTank_F",[8.00006,-8.5,-5.72205e-006],0.000584186,1,0,[0.00532521,0.00402497],"","",true,false],
		["Land_Razorwire_F",[-5.72882,11.0674,-2.38419e-006],0,1,0,[0,0],"","",true,false],
		["Land_FieldToilet_F",[-3,-11.5,4.76837e-007],180,1,0,[9.74706e-005,2.69194e-005],"","",true,false],
		["Land_HBarrierWall4_F",[6.99976,9.99951,0],0,1,0,[0,0],"","",true,false],
		["Land_BagBunker_Tower_F",[-9.01685,-9.98047,0],0,1,0,[0,0],"","",true,false],
		["Land_Cargo_House_V1_F",[10.9785,-10,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrier_1_F",[-9,10.9927,0],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_5_F",[-5.24872,-14.0039,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[3.99591,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_3_F",[14.177,7.51367,0],90,1,0,[0,-0],"","",true,false],
		["Land_HBarrierWall_corner_F",[12.4917,10.0005,0],0,1,0,[0,0],"","",true,false],
		["Land_Mil_WiredFence_F",[11.9959,-14.0024,-9.53674e-006],0,1,0,[0,0],"","",true,false],
		["Land_HBarrier_Big_F",[16.9176,-9.96484,0],90,1,0,[0,-0],"","",true,false],
		
		// Item crates
		["Box_IND_Ammo_F",[-10.2,-12.6001,-1.43051e-006],359.999,1,0,[-0.00080437,0.00148494],"","",true,false],
		["Box_IND_WpsLaunch_F",[-8.55634,-7.56689,0],360,1,0,[0.000407251,-2.35693e-006],"",
		 "[this, 'LAUNCHER', 1, 2] execVM 'src\fnc\randomCargo\randomCargo.sqf';
		 ",true,false],
		["Box_IND_Support_F",[-10.0685,-7.62305,-1.90735e-006],89.9995,1,0,[-0.000900781,0.00136405],"",
		 "clearItemCargoGlobal this;
		  clearBackpackCargoGlobal this;
		  clearWeaponCargoGlobal this;
		  clearMagazineCargoGlobal this;
		  
		  this addItemCargoGlobal ['FirstAidKit', 10];
		  this addItemCargoGlobal ['Medikit', 1];
		  this addItemCargoGlobal ['Toolkit', 1];
		  this addItemCargoGlobal ['MineDetector', 1];
		  this addItemCargoGlobal ['ItemMap', 2];
		 ",true,false]
	],
	25 // Radius of composition area
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["I_MRAP_03_hmg_F",[-4.59137,6.99902,0],270,random [0.2, 0.4, 0.6],0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["I_HMG_01_high_F",[-9.40002,-11.7998,2.78],270.001,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// The vehicles that may spawn as the parked vehicle
_car = ["I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"];

// The turrents that may spawn in the different fortifications
_turrent = ["I_HMG_01_high_F", "I_GMG_01_high_F", "I_static_AT_F", "I_static_AA_F"];

// Selects a car and turrent
_veh select 0 set [0, selectRandom _car];
_veh select 1 set [0, selectRandom _turrent];

if (random 1 > 0.3) then { _veh deleteAt 0 }; // Deletes car if condition is met

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1];

_comp
