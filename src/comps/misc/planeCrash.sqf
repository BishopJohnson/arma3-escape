/*

*/

#define RADIUS 25

private ["_comp", "_veh", "_position", "_marker"];

if (!isServer) exitWith {};

/* TODO: Utilize COMPOSITION dictionary to store comp data to optimize
 *       spawning later.
 */

// Selects base position
_position = [] call BIS_fnc_randomPos;
while {!([_position, RADIUS] call compile preprocessFile "src\fnc\checkSlope.sqf")} do
{
	_position = [] call BIS_fnc_randomPos;
};

// Removes all terrain objects
{
	_x hideObjectGlobal true;
	_x enableSimulationGlobal false;
} forEach nearestTerrainObjects [_position, [], RADIUS];

_comp =
[
	["Land_Wreck_Plane_Transport_01_F",[5.6333,0.661133,0],0,1,0,[0,0],"","",true,false],
	["test_EmptyObjectForSmoke",[5.6333,0.661133,0],0,1,0,[0,0],"","",true,false],
	["CraterLong_small",[5.71289,4.7373,0],0,1,0,[0,0],"","",true,false],
	["CraterLong",[5.9043,-9.52148,0],178.846,1,0,[0,-0],"","",true,false],
	["CraterLong_small",[6.01221,9.71582,0],0,1,0,[0,0],"","",true,false],
	["CraterLong_small",[6.31836,14.6982,0],0,1,0,[0,0],"","",true,false]
];

_veh =
[
/*  [object, position, azimuth, fuel, damage, orientation, varName, init, simulated, asl] */
	// Item crates
	["Box_NATO_Wps_F",[0.258057,0.185547,-4.76837e-007],0.000161979,1,0,[0,-0],"","",true,false],         // (0) basic weapons
	["Box_NATO_WpsLaunch_F",[0.0986328,8.46729,-9.53674e-007],360,1,0,[0,-0],"","",true,false],           // (1) launchers
	["Box_NATO_WpsSpecial_F",[-0.152588,-10.1152,-1.43051e-006],0.000128465,1,0,[0,-0],"","",true,false], // (2) special weapons
	["Box_NATO_Ammo_F",[-0.604004,4.99902,-9.53674e-007],2.59403e-005,1,0,[0,0],"","",true,false],        // (3) basic ammo
	["Box_NATO_AmmoOrd_F",[1.13647,10.4121,-1.43051e-006],359.994,1,0,[-0,-0],"","",true,false],          // (4) explosives
	["Box_NATO_Grenades_F",[-0.258789,-2.79053,-1.43051e-006],359.995,1,0,[-0,0],"","",true,false],       // (5) grenades
	["Box_NATO_Support_F",[1.57959,6.76953,-4.76837e-007],0.000226324,1,0,[0,0],"","",true,false],        // (6) support
	["Box_NATO_Equip_F",[0.763916,3.28223,0],360,1,0,[0,-0],"","",true,false],                            // (7) equipment
	["Box_NATO_Uniforms_F",[0.432861,-6.86523,-4.76837e-007],359.999,1,0,[-0,0],"","",true,false],        // (8) uniforms
	
	// Pilots (damage set to 100%)
	["Sign_Arrow_Blue_F",[-2.27979,1.31299,0],random 360,1,1,[0,0],"","",true,false], // (9)  pilot #1
	["Sign_Arrow_Blue_F",[-2.3606,-1.5498,0],random 360,1,1,[0,0],"","",true,false]   // (10) pilot #2
];

switch (PLAYER_FACTION) do
{
	case east:
	{
		_veh select 0 set [0, "Box_East_Wps_F"];
		_veh select 1 set [0, "Box_East_WpsLaunch_F"];
		_veh select 2 set [0, "Box_East_WpsSpecial_F"];
		_veh select 3 set [0, "Box_East_Ammo_F"];
		_veh select 4 set [0, "Box_East_AmmoOrd_F"];
		_veh select 5 set [0, "Box_East_Grenades_F"];
		_veh select 6 set [0, "Box_East_Support_F"];
		_veh select 7 set [0, "Box_CSAT_Equip_F"];
		_veh select 8 set [0, "Box_CSAT_Uniforms_F"];
		
		_veh select 9 set [0, "O_helipilot_F"];
		_veh select 10 set [0, "O_helipilot_F"];
	};
	case independent:
	{
		_veh select 0 set [0, "Box_IND_Wps_F"];
		_veh select 1 set [0, "Box_IND_WpsLaunch_F"];
		_veh select 2 set [0, "Box_IND_WpsSpecial_F"];
		_veh select 3 set [0, "Box_IND_Ammo_F"];
		_veh select 4 set [0, "Box_IND_AmmoOrd_F"];
		_veh select 5 set [0, "Box_IND_Grenades_F"];
		_veh select 6 set [0, "Box_IND_Support_F"];
		_veh select 7 set [0, "Box_AAF_Equip_F"];
		_veh select 8 set [0, "Box_AAF_Uniforms_F"];
		
		_veh select 9 set [0, "I_helipilot_F"];
		_veh select 10 set [0, "I_helipilot_F"];
	};
	default // West
	{
		_veh select 9 set [0, "B_Helipilot_F"];
		_veh select 10 set [0, "B_Helipilot_F"];
	};
};

_comp append _veh;

[_position, random 360, _comp] call BIS_fnc_ObjectsMapper;

/*
// DEBUG CODE
_marker = createMarker ["plane_crash", _position];
_marker setMarkerType "hd_unknown";
_marker setMarkerColor "ColorBlack";
*/
