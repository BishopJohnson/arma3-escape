/*
	author: Bishop
	description: Adds action to local player to "hack" UAV terminals of other factions and convert them into one usable
	             by the player.
	returns: nothing
*/

if (!hasInterface || side player == civilian) exitWith {};

private "_terminal";
private _terminals =
[
    "B_UavTerminal",
    "O_UavTerminal",
    "I_UavTerminal",
    "C_UavTerminal",
    "I_E_UavTerminal"
];
switch (side player) do
{
    case west:
	{
	    _terminal = "B_UavTerminal";
	    _terminals = _terminals - ["B_UavTerminal"];
	};
	case east:
	{
	    _terminal = "O_UavTerminal";
	    _terminals = _terminals - ["O_UavTerminal"];
	};
	case independent:
	{
	    _terminal = "I_UavTerminal";
	    _terminals = _terminals - ["I_UavTerminal", "I_E_UavTerminal"];
	};
};

private _condition = format ["count (%1 arrayIntersect assignedItems _this) > 0", str _terminals];

player addAction
[
	"Hack UAV Terminal",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

        _caller linkItem _arguments select 0;
	},
	_terminal,
	1,
	false,
	true,
	"",
	_condition, // _target, _this, _originalTarget
	-1,
	false,
	"",
	""
];
