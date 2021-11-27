/*
    Author:
	    Bishop Johnson
	
	Returns:
	    Array - 
*/

private ["_comp", "_veh", "_range", "_car", "_turrent"];

if (!isServer) exitWith {};

_comp =
[
	[  
		["CamoNet_BLUFOR_F",[0.407959,6.70068,0],0,1,0,[0,0],"","",true,false],  
		["Land_WaterBarrel_F",[7.9292,-0.999023,0],0,1,0,[0,0],"","",true,false], 
		["Land_WaterBarrel_F",[7.92554,1.03369,0],0,1,0,[0,0],"","",true,false], 
		["Land_HBarrier_5_F",[9.99561,2.24902,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_5_F",[-10.0044,2.24902,0],90,1,0,[0,-0],"","",true,false], 
		["Land_HBarrier_5_F",[-2.24927,10.9966,0],0,1,0,[0,0],"","",true,false],
		
		// Item crates
        ["Box_NATO_AmmoOrd_F",[-0.000488281,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Ammo_F",[1.99951,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_Grenades_F",[-2.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_AmmoVeh_F",[-7.10132,0.0117188,0],0,1,0,[0,0],"","",true,false],
		["Box_NATO_Wps_F",[3.99951,6.00049,0],0,1,0,[0,0],"","[this, ""BASIC""] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false],
		["Box_NATO_Support_F",[-4.00049,6.00049,0],90,1,0,[0,-0],"","",true,false],
		["Box_NATO_WpsLaunch_F",[-2.00049,4.00049,0],0,1,0,[0,0],"","[this, ""LAUNCHER""] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false],
		["Box_NATO_WpsSpecial_F",[1.99951,4.00049,0],0,1,0,[0,0],"","[this, ""SPECIAL""] execVM ""src\fnc\randomCargo\randomCargo.sqf"";",true,false]
	],
	"b_Ordnance", // Marker type
	20,           // Radius of composition area
	35            // Radius of patrol
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
    ["B_Truck_01_covered_F",[16.1875,-0.159668,0.114967],0,random [0.2, 0.5, 0.7],0,[0,0],"","",true,false], // Car
	["B_HMG_01_high_F",[-9.27026,10.4614,-0.0749998],315.162,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["B_HMG_01_high_F",[10.002,9.76367,-0.0749998],44.1353,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false],
	["B_HMG_01_high_F",[9.89429,-9.68652,-0.0749998],135,1,0,[0,-0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false], 
	["B_HMG_01_high_F",[-10.0217,-8.99854,-0.0749998],225.936,1,0,[0,0],"","this setVehicleAmmo random [0.2, 0.5, 1];",true,false]
];

// Removes two of the turrents
for [{private _i = 0}, {_i < 2}, {_i = _i + 1}] do
{
	_turrent = selectRandom _veh;
	_veh = _veh - [_turrent];
};

// The vehicles that may spawn as the parked vehicle
_car = ["B_MRAP_01_F", "B_LSV_01_unarmed_F", "B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_mover_F"];

// The turrents that may spawn in the different fortifications
_turrent = ["B_HMG_01_high_F", "B_GMG_01_high_F", "B_HMG_01_F", "B_GMG_01_F", "B_static_AT_F", "B_static_AA_F"];

// Selects a vehicle to be parked
_veh select 0 set [0, selectRandom _car];

// Selects a turrent for each fortification
_veh select 1 set [0, selectRandom _turrent];
_veh select 2 set [0, selectRandom _turrent];

// Adds the vehicles to the composition
_comp = [(_comp select 0) + _veh, _comp select 1, _comp select 2, _comp select 3];

_comp
