/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
	
	Returns:
	    String - 
*/

params ["_side"];

private ["_type", "_types"];

if (!isServer) exitWith {};

/* MRAPs are present under both type "MRAP"
 * and for type "Car".
 * 
 * Technicals are present under both type
 * "Technical" and for type "Car".
 */

_type = "Car"; // Assumed civilian

if (_side != civilian) then
{
	//_types = ["Car", "Technical", "MRAP", "APC", "Tank", "AAA", "Artillery"];
	//_type = _types select floor random [0, 0, count _types];
	
	/* Attampts to address the issue of too few armored vehicles.
	 */
	_types = ["Car", "MRAP", "APC", "Tank", "AAA", "Artillery"]; // Right-skewed for higher MRAP chances
	_type = _types select floor random [0, 1, count _types];     //
};

_type
