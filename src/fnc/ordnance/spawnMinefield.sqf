/*

*/

params ["_type", "_position", "_radius", "_count", "_side"];

private ["_pos", "_mine"];

if (!isServer) exitWith {};

for [{private _i = 0}, {_i < _count}, {_i = _i + 1}] do
{
	// Chooses a random position on land within the given area
	_pos =
	[
		[[_position, _radius]],
		["water"]
	] call BIS_fnc_randomPos;
	
	_mine = createMine [_type, _pos, [], 0];
	_side revealMine _mine;
};
