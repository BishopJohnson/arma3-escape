/*
    Author:
	    Bishop Johnson
	
	Returns:
	    String - 
*/

private ["_types", "_type"];

if (!isServer) exitWith {};

_types =
[
    "HEAVY",
    "MEDIUM",
	"LIGHT"
];

_type = selectRandom _types;

_type
