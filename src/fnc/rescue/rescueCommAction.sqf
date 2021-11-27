/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Object - 
*/

params ["_box"];

if (!isServer) exitWith {};

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
[
	_box,
	"Connect",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 2",
	"_caller distance _target < 2",
	{
	    // Opens data terminal
	    params ["_target", "_caller", "_actionId", "_arguments"];
		
		[_target, 3] remoteExec ["BIS_fnc_DataTerminalAnimate"];
	},
	{
	    // Do nothing
	    params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
	},
	{
	    // Closes data terminal and calls for rescue
	    params ["_target", "_caller", "_actionId", "_arguments"];
		
		[_target, 0] remoteExec ["BIS_fnc_DataTerminalAnimate"];
		
		[position _target] remoteExec ["fnc_startEscape", 2]; // Executes only on the server
		
		[
			_target,
			_actionId
		] remoteExec ["BIS_fnc_holdActionRemove", (call BIS_fnc_listPlayers)]
	},
	{
	    // Closes data terminal
	    params ["_target", "_caller", "_actionId", "_arguments"];
		
		[_target, 0] remoteExec ["BIS_fnc_DataTerminalAnimate"];
	},
	[],
	10,
	1,
	false, /* Action is removed through script */
	false
] remoteExec ["BIS_fnc_holdActionAdd"];
