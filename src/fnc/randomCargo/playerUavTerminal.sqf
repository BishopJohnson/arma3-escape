/*
	Author:
	    Bishop Johnson
	
	Returns:
	    String - 
*/

private ["_terminal"];

switch (PLAYER_FACTION) do
{
	case west: { _terminal = "B_UavTerminal"; };
	case east: { _terminal = "O_UavTerminal"; };
	case independent: { _terminal = "I_UavTerminal"; };
};

_terminal
