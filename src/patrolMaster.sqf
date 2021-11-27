/*

*/

#define CLEAN_UP_CHECK_LOOP 60 // 1 minute
#define AIR_CHECK_LOOP 480     // 8 minutes
#define INF_INIT_MAX_SPAWN_RADIUS 1000 // Spawn distance on initialization
#define INF_INIT_MIN_SPAWN_RADIUS 750  //
#define VEH_INIT_MAX_SPAWN_RADIUS 1000 //
#define VEH_INIT_MIN_SPAWN_RADIUS 800  //
#define INF_MAX_SPAWN_RADIUS 1250 // Spawn distances during runtime
#define INF_MIN_SPAWN_RADIUS 1000 //
#define VEH_MAX_SPAWN_RADIUS 1200 //
#define VEH_MIN_SPAWN_RADIUS 1000 //
#define AIR_MAX_SPAWN_RADIUS 2500 //
#define AIR_MIN_SPAWN_RADIUS 2000 //
#define INF_DESPAWN_RADIUS 2000   // Despawn distances
#define VEH_DESPAWN_RADIUS 2000   //
#define AIR_DESPAWN_RADIUS 3500   //
#define MAX_INFANTRY_SIZE 10 // Max number of entities per faction
#define MAX_VEHICLE_SIZE 6   //
#define MAX_CIVILIAN_SIZE 6  //
#define MAX_AIR_TOTAL 3      // Max number of air vehicles in total
#define AIR_MAX_SPAWN_CHANCE 0.8

private ["_side", "_group", "_groups", "_newGroup", "_maxSize"];

if (!isServer) exitWith {};

infantryPatrols = call DICT_fnc_create;
[infantryPatrols, "west", []] call DICT_fnc_set;
[infantryPatrols, "east", []] call DICT_fnc_set;
[infantryPatrols, "guer", []] call DICT_fnc_set;

vehiclePatrols = call DICT_fnc_create;
[vehiclePatrols, "west", []] call DICT_fnc_set;
[vehiclePatrols, "east", []] call DICT_fnc_set;
[vehiclePatrols, "guer", []] call DICT_fnc_set;
[vehiclePatrols, "civ", []] call DICT_fnc_set;

airPatrols = call DICT_fnc_create;
[airPatrols, "west", []] call DICT_fnc_set;
[airPatrols, "east", []] call DICT_fnc_set;
[airPatrols, "guer", []] call DICT_fnc_set;

// The event called when a infantry group is eliminated
["Escape_GroupEliminated",
{
	params ["_group"];
	
	private ["_newGroup", "_side"];
	
	_side = side _group;
	
	// Try to create new group until successful
	_newGroup = objNull;
	while {isNull _newGroup} do
	{
		_newGroup = [_side, floor random [2, 5, 8]] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
		_newGroup = [_side, _newGroup, INF_MAX_SPAWN_RADIUS, INF_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\infantry\spawnPatrol.sqf";
	};
	
	[_newGroup] execVM "src\fnc\patrols\infantry\eventAssigner.sqf";
	
	_groups = [infantryPatrols, format ["%1", _side]] call DICT_fnc_get;
	
	_groups = _groups - [_group];
	_groups append [_newGroup];
	
	[infantryPatrols, format ["%1", _side], _groups] call DICT_fnc_set;
}] call CBA_fnc_addEventHandler;

// The event called when a vehicle group is eliminated
["Escape_VehicleEliminated",
{
	params ["_group"];
	
	private ["_newGroup", "_side"];
	
	_side = side _group;
	
	// Try to create new group until successful
	_newGroup = objNull;
	while {isNull _newGroup} do
	{
		_newGroup = [_side, VEH_MAX_SPAWN_RADIUS, VEH_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\vehicles\spawnPatrol.sqf";
	};
	
	[_newGroup] execVM "src\fnc\patrols\vehicles\eventAssigner.sqf";
	
	_groups = [vehiclePatrols, format ["%1", _side]] call DICT_fnc_get;
	
	_groups = _groups - [_group];
	_groups append [_newGroup];
	
	[vehiclePatrols, format ["%1", _side], _groups] call DICT_fnc_set;
}] call CBA_fnc_addEventHandler;

// The event called when a air group is eliminated
["Escape_AirEliminated",
{
	params ["_group"];
	
	private ["_side"];
	
	_side = side _group;
	
	_groups = [airPatrols, format ["%1", _side]] call DICT_fnc_get;
	
	_groups = _groups - [_group];
	
	[airPatrols, format ["%1", _side], _groups] call DICT_fnc_set;
}] call CBA_fnc_addEventHandler;

// Spawns initial infantry patrols
{
	switch (_x) do
	{
		case "west": { _side = west; };
		case "east": { _side = east; };
		case "guer": { _side = independent; };
		default { /* TODO: Stop this process. */ };
	};
	
	if (_side != PLAYER_FACTION) then
	{
		_groups = [infantryPatrols, _x] call DICT_fnc_get;

		// Spawns patrols for the side
		while {count _groups < MAX_INFANTRY_SIZE} do
		{
			_group = [_side, floor random [2, 5, 8]] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
			_group = [_side, _group, INF_INIT_MAX_SPAWN_RADIUS, INF_INIT_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\infantry\spawnPatrol.sqf";
			
			if (!isNull _group) then
			{
				[_group] execVM "src\fnc\patrols\infantry\eventAssigner.sqf";
				
				_groups append [_group];
			};
		};
	};
} forEach (infantryPatrols call DICT_fnc_keys);

// Spawns initial vehicle patrols
{
	switch (_x) do
	{
		case "west": { _side = west; };
		case "east": { _side = east; };
		case "guer": { _side = independent; };
		case "civ": { _side = civilian; };
		default { /* TODO: Stop this process. */ };
	};
	
	if (_side != PLAYER_FACTION) then
	{
		_groups = [vehiclePatrols, _x] call DICT_fnc_get;
		
		if (_side != civilian) then
		{
			_maxSize = MAX_VEHICLE_SIZE;
		}
		else
		{
			_maxSize = MAX_CIVILIAN_SIZE;
		};
		
		// Spawns vehicles for the side
		while {count _groups < _maxSize} do
		{
			_group = [_side, VEH_INIT_MAX_SPAWN_RADIUS, VEH_INIT_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\vehicles\spawnPatrol.sqf";
			
			if (!isNull _group) then
			{
				[_group] execVM "src\fnc\patrols\vehicles\eventAssigner.sqf";
				
				_groups append [_group];
			};
		};
	};
} forEach (vehiclePatrols call DICT_fnc_keys);

// Schedules process to handle air patrols
[PLAYER_FACTION, airPatrols] spawn
{
	params ["_playerFaction", "_airPatrols"];
	
	private ["_count", "_group", "_groups", "_side", "_spawnPatrol"];
	
	_spawn_fnc =
	{
		params ["_count"];
		
		private ["_result", "_rand", "_threshold"];
		
		_result = false;
		
		_rand = random 1;
		_threshold = (-AIR_MAX_SPAWN_CHANCE / MAX_AIR_TOTAL) * _count + AIR_MAX_SPAWN_CHANCE; // Linear threshold
		
		if (_rand < _threshold) then { _result = true };
		
		_result
	};
	
	while {true} do
	{
		sleep AIR_CHECK_LOOP;
		
		_spawnPatrol = false;
		
		// Counts the number of air patrols
		_count = 0;
		{
			_groups = [_airPatrols, _x] call DICT_fnc_get;
			_count = _count + (count _groups);
		} forEach (_airPatrols call DICT_fnc_keys);
		
		_spawnPatrol = [_count] call _spawn_fnc;
		
		//if (_spawnPatrol) then { hint "will spawn air patrol" } // DEBUG CODE
		//else { hint "will not spawn air patrol" };              //
		
		while {_spawnPatrol} do // Runs until a patrol is spawned
		{
			/* TODO: The faction with fewer air vehicles ought to have a higher
			 *       chance of having one spawned.
			 */
			_side =  selectRandom ([west, east, independent] - [_playerFaction]);
			
			_groups = [airPatrols, format ["%1", _side]] call DICT_fnc_get;
			
			_group = [_side, AIR_MAX_SPAWN_RADIUS, AIR_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\air\spawnPatrol.sqf";
			
			if (!isNull _group) then
			{
				[_group] execVM "src\fnc\patrols\air\eventAssigner.sqf";
				
				_groups append [_group];
				
				_spawnPatrol = false;
			};
		};
	};
};

[
	"Escape_PlayerPositionUpdated",
	{
		private ["_side", "_group", "_groups", "_newGroup", "_flagToDelete"];
		
		// For each faction's infantry patrols
		{
			switch (_x) do
			{
				case "west": { _side = west; };
				case "east": { _side = east; };
				case "guer": { _side = independent; };
				default { /* TODO: Stop this process. */ };
			};
			
			// For each patrol
			{
				_group = _x;
				_flagToDelete = true; // Assume the group ought to be deleted
				
				// For each player
				{
					if (_x distance2D leader _group <= INF_DESPAWN_RADIUS) then
					{
						_flagToDelete = false;
					};
				} forEach (call BIS_fnc_listPlayers);
				
				// Delete the group and spawn another
				if (_flagToDelete) then
				{
					// Try to create new group until successful
					_newGroup = objNull;
					while {isNull _newGroup} do
					{
						_newGroup = [_side, floor random [2, 5, 8]] call compile preprocessFile "src\fnc\randomUnits\pickGroup.sqf";
						_newGroup = [_side, _newGroup, INF_MAX_SPAWN_RADIUS, INF_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\infantry\spawnPatrol.sqf";
					};
					
					[_newGroup] execVM "src\fnc\patrols\infantry\eventAssigner.sqf";
					
					_groups = [infantryPatrols, format ["%1", _side]] call DICT_fnc_get;
					
					_groups = _groups - [_group];
					_groups append [_newGroup];
					
					[infantryPatrols, format ["%1", _side], _groups] call DICT_fnc_set;
					
					{ deleteVehicle _x; } forEach units _group; // Deletes entire group
				};
			} forEach ([infantryPatrols, _x] call DICT_fnc_get);
		} forEach (infantryPatrols call DICT_fnc_keys);
		
		// For each faction's vehicle patrols
		{
			switch (_x) do
			{
				case "west": { _side = west; };
				case "east": { _side = east; };
				case "guer": { _side = independent; };
				case "civ": { _side = civilian; };
				default { /* TODO: Stop this process. */ };
			};
			
			// For each patrol
			{
				_group = _x;
				_flagToDelete = true; // Assume the group ought to be deleted
				
				// For each player
				{
					if (_x distance2D leader _group <= VEH_DESPAWN_RADIUS) then
					{
						_flagToDelete = false;
					};
				} forEach (call BIS_fnc_listPlayers);
				
				// Delete the group and spawn another
				if (_flagToDelete) then
				{
					// Try to create new group until successful
					_newGroup = objNull;
					while {isNull _newGroup} do
					{
						_newGroup = [_side, VEH_MAX_SPAWN_RADIUS, VEH_MIN_SPAWN_RADIUS] call compile preprocessFile "src\fnc\patrols\vehicles\spawnPatrol.sqf";
					};
					
					[_newGroup] execVM "src\fnc\patrols\vehicles\eventAssigner.sqf";
					
					_groups = [vehiclePatrols, format ["%1", _side]] call DICT_fnc_get;
					
					_groups = _groups - [_group];
					_groups append [_newGroup];
					
					[vehiclePatrols, format ["%1", _side], _groups] call DICT_fnc_set;
					
					{ deleteVehicle _x; } forEach units _group; // Deletes entire group
				};
			} forEach ([vehiclePatrols, _x] call DICT_fnc_get);
		} forEach (vehiclePatrols call DICT_fnc_keys);
		
		// For each faction's air patrols
		{
			switch (_x) do
			{
				case "west": { _side = west; };
				case "east": { _side = east; };
				case "guer": { _side = independent; };
				case "civ": { _side = civilian; };
				default { /* TODO: Stop this process. */ };
			};
			
			// For each patrol
			{
				_group = _x;
				_flagToDelete = true; // Assume the group ought to be deleted
				
				// For each player
				{
					if (_x distance2D leader _group <= AIR_DESPAWN_RADIUS) then
					{
						_flagToDelete = false;
					};
				} forEach (call BIS_fnc_listPlayers);
				
				// Delete the group and spawn another
				if (_flagToDelete) then
				{
					_groups = [airPatrols, format ["%1", _side]] call DICT_fnc_get;
					
					_groups = _groups - [_group];
					
					[airPatrols, format ["%1", _side], _groups] call DICT_fnc_set;
					
					{ deleteVehicle _x; } forEach units _group; // Deletes entire group
				};
			} forEach ([airPatrols, _x] call DICT_fnc_get);
		} forEach (airPatrols call DICT_fnc_keys);
	}
] call CBA_fnc_addEventHandler;
