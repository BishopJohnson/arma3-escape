/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array - 
		Number - 
		Number (Optional) -
	
	Returns:
	    Bool - Returns true if slope is under the acceptable threshold.
*/

#define DEFAULT_THRESHOLD 10

params ["_position", "_radius"];

private ["_threshold", "_azimuth", "_dirBar", "_sum", "_count", "_result", "_pos", "_i", "_j"];

if (!isServer) exitWith {};

_threshold = DEFAULT_THRESHOLD; //the upper slope limit in degrees

if (count _this > 2) then {_threshold = _this select 2;};

_azimuth = 0; //azimuth 0 is North

_dirBar = [0, 0, 0, 0]; //[N, W, S, E]

_sum = 0;
_count = 20;

/* Finds the average of the gradiants in
 * each Cardinal direction.
 */
for [{_i = 0}, {_i < 4}, {_i = _i + 1}] do
{
    //finds the sum of a gradiant in a given direction
    for [{_j = 0}, {_j < _count}, {_j = _j + 1}] do
	{
	    //picks a random point in the area
	    _pos = [[[_position, _radius]], ["water"]] call BIS_fnc_randomPos;
		
	    _sum = _sum + abs([_pos, _azimuth, 10] call BIS_fnc_terrainGradAngle);
	};
	
	_dirBar set [_i, _sum / _count];
	
	_azimuth = _azimuth + 90;
	_sum = 0;
};

_result = true; //assumed true

//checks if any direction is over the threshold
if (_dirBar select 0 > _threshold || _dirBar select 1 > _threshold || _dirBar select 2 > _threshold || _dirBar select 3 > _threshold) then
{
    _result = false;
};

_result 