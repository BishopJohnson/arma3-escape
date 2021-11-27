/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
*/

if (isServer) then
{
	private _trigger = createTrigger ["EmptyDetector", [0, 0], true];
	_trigger setTriggerStatements
	[
		"{ lifeState _x == 'INCAPACITATED' } count (call BIS_fnc_listPlayers) == count (call BIS_fnc_listPlayers)",
		"'EveryoneLost' call BIS_fnc_endMissionServer;",
		""
	];
	_trigger setTriggerTimeout [5, 5, 5, true];
};

if (!hasInterface) exitWith {};

player setVariable ["reviveIsIncapacitated", false];

/* Dictionary of the revive action the player may perform. The keys are the
 * string format of the player unit's name and the value is a array with the
 * target reference and action id.
 */
reviveReviveActions = call DICT_fnc_create;

// Screen effects when downed
/*
reviveColorEffect = ppEffectCreate ["ColorCorrections", 1632];
reviveVigEffect = ppEffectCreate ["ColorCorrections", 1633];
reviveBlurEffect = ppEffectCreate ["DynamicBlur", 525];
*/

// Function with params to be used in event handler
fnc_reviveAddAction =
{
	params ["_target"];
	
	if (!hasInterface) exitWith {};
	
	[_target] execVM "src\fnc\revive\reviveAddAction.sqf";
};

// Registers the action for the player
fnc_reviveRegisterAction =
{
	params ["_target", "_action", "_actionId"];

	private ["_key"];
	
	if (!hasInterface) exitWith {};
	
	_key = format ["%1,%2", _target, _action];
	
	// Unregisters the old action if one exists
	if ([reviveReviveActions, _key] call DICT_fnc_exists) then
	{
		[_target, _action] call fnc_reviveUnregisterAction;
	};
	
	[reviveReviveActions, _key, [_target, _actionId]] call DICT_fnc_set;
};

// Unregisters the action for the player
fnc_reviveUnregisterAction =
{
	params ["_target", "_action"];
	
	private ["_key", "_val", "_actionId"];
	
	if (!hasInterface) exitWith {};
	
	_key = format ["%1,%2", _target, _action];
	_val = [reviveReviveActions, _key] call DICT_fnc_get;
	_target = _val select 0;
	_actionId = _val select 1;
	
	if (_action == "revive") then
	{
		[_target, _actionId] call BIS_fnc_holdActionRemove;
	}
	else
	{
		_target removeAction _actionId;
	};
	
	// Unregisters the action
	[reviveReviveActions, _key] call DICT_fnc_del;
};

// Event handler for when the player exits a vehicle
player addEventHandler
[
	"GetOutMan",
	{
		params ["_vehicle", "_role", "_unit", "_turret"];
		
		private ["_isIncapacitated"];
		
		_isIncapacitated = player getVariable "reviveIsIncapacitated";
		
		// Case were a downed player is unloaded from a vehicle
		if (_isIncapacitated) then
		{
			player remoteExec ["fnc_reviveAddAction"];
		};
	}
];

// Event handler for when the player takes damage
player addEventHandler
[
	"HandleDamage",
	{
		params ["_unit", "_hitSelection", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint"];
		
		private ["_isIncapacitated", "_countIncapacitated", "_msg"];
		
		_isIncapacitated = player getVariable "reviveIsIncapacitated";
		
		// Checks if the player would die from damage
		if (_damage + damage player >= 1 && !_isIncapacitated) then
		{
			//[reviveColorEffect, reviveVigEffect, reviveBlurEffect] ppEffectEnable true;
			
			player allowDamage false;   // Puts the player in a downed state
			player setCaptive true;     //
			player setUnconscious true; //
			
			player setVariable ["reviveIsIncapacitated", true];
			
			if (player == vehicle player) then
			{
				player remoteExec ["fnc_reviveAddAction"];
			};
			
			if (isNull _instigator) then
			{
				_msg = format ["%1 was downed", name player];
			}
			else
			{
				if (!isPlayer _instigator) then
				{
					_msg = format ["%1 was downed by (AI) %2", name player, name _instigator];
				}
				else
				{
					_msg = format ["%1 was downed by %2", name player, name _instigator];
				};
			};
			
			[_msg] remoteExec ["systemChat"];
			
			["reviveUnitDownedEvent", [/* no params */]] call CBA_fnc_serverEvent;
			
			_damage = 0;
		};
		
		if (_isIncapacitated) then { _damage = 0; };
		
		// Returned damage is applied to the player
		_damage
	}
];
