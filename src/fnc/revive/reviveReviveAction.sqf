/*

*/

params ["_target"];

private ["_actionId"];

if (!hasInterface) exitWith {};

/* Parameters for BIS_fnc_holdActionAdd:
 *     target - Object
 *     title - String
 *     idleIcon - String
 *     progressIcon - String
 *     conditionShow - String
 *     conditionProgress - String
 *     codeStart - Code
 *     codeProgress - Code
 *     codeCompleted - Code
 *     codeInterrupted - Code
 *     arguments - Array
 *     duration - Number
 *     priority - Number
 *     removeCompleted - Bool
 *     showUnconscious - Bool
 */
_actionId =
[
	_target,
	"Revive",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa",
	"_this distance _target < 2",
	"_caller distance _target < 2",
	{
	    // Animate caller (initial animation)
		params ["_target", "_caller", "_actionId", "_arguments"];
	},
	{
	    // Animate caller (looping animation)
	    params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
	},
	{
	    // Stop animating caller and revive target
		params ["_target", "_caller", "_actionId", "_arguments"];
		
		// Remove the action for all players
		[_target, "revive"] remoteExec ["fnc_reviveUnregisterAction"];
		
		{
			// Revives the player and resets their necessary attributes
			player setDamage 0;
			player allowDamage true;
			player setCaptive false;
			player setUnconscious false;
			
			player setVariable ["reviveIsIncapacitated", false];
			
			/*[reviveColorEffect, reviveVigEffect, reviveBlurEffect] ppEffectEnable false;*/
		} remoteExec ["bis_fnc_call", _target];
	},
	{
	    // Stop animating caller
		params ["_target", "_caller", "_actionId", "_arguments"];
	},
	[],
	6,
	0,
	false, // The action will be removed on completion by script
	false
] call BIS_fnc_holdActionAdd;

_actionId
