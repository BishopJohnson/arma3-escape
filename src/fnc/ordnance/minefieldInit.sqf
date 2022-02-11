/*

*/

#define KEY "minefields"
#define MAX_RADIUS 200
#define MAX_MINES_PER_AREA 50

params ["_count"];

if (!isServer) exitWith {};
/*
if (isNil "COMPOSITIONS") then
{
	/* The values for each key are multidimensional arrays formatted as
	 * [position, radius, side, comp] where comp is the array returned by the
	 * a given base file.
	 */
	/*
	COMPOSITIONS = call DICT_fnc_create;
	[COMPOSITIONS, KEY, []] call DICT_fnc_set;
};
*/

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	/* TODO: Prevent minefields from spawning inside compositions and other minefields
	 *       (possibly extend this to towns too).
	 */

	private _position = [nil, ["water"]] call BIS_fnc_randomPos;
	private _type = selectRandom (call compile preprocessFile "src\fnc\ordnance\mineTypes.sqf");
	private _side = call Escape_fnc_GetRandomEnemySide;

	[
		_type,
		_position,
		MAX_RADIUS,
		MAX_MINES_PER_AREA,
		_side
	] execVM "src\fnc\ordnance\spawnMinefield.sqf";
	
	/*
	// DEBUG CODE: Displays the minefields on the map
	private _mrkName = format ["Marker%1", _i];
	createMarker [_mrkName, _position];
	_mrkName setMarkerShape "ELLIPSE";
	_mrkName setMarkerSize [MAX_RADIUS, MAX_RADIUS];
	*/
};
