/*
	Author:
	    Bishop Johnson
	
	Parameter(s):
	    Array -
	
	Return:
		Array -
*/

#define DEFAULT_ITERATION_AMOUNT 0

params
[
	"_position",
	["_iterations", DEFAULT_ITERATION_AMOUNT, [0]]
];

private "_ret";

if (_iterations < DEFAULT_ITERATION_AMOUNT) then
{
	_iterations = DEFAULT_ITERATION_AMOUNT;
};

private _size = worldSize;
private _minDistance = _size;

private "_tempPos";
private "_tempDist";
private "_isOnXAxis";

// Northern edge
_tempPos = [_size / 2, _size];
_tempDist = _tempPos distance _position;
if (_tempDist <= _minDistance) then
{
	_ret = _tempPos;
	_minDistance = _tempDist;
	_isOnXAxis = true;
};

// Southern edge
_tempPos = [_size / 2, 0];
_tempDist = _tempPos distance _position;
if (_tempDist <= _minDistance) then
{
	_ret = _tempPos;
	_minDistance = _tempDist;
	_isOnXAxis = true;
};

// Eastern edge
_tempPos = [_size, _size / 2];
_tempDist = _tempPos distance _position;
if (_tempDist <= _minDistance) then
{
	_ret = _tempPos;
	_minDistance = _tempDist;
	_isOnXAxis = false;
};

// Western edge
_tempPos = [0, _size / 2];
_tempDist = _tempPos distance _position;
if (_tempDist <= _minDistance) then
{
	_ret = _tempPos;
	_minDistance = _tempDist;
	_isOnXAxis = false;
};

private _count = 1;
while {_count <= _iterations} do
{
	_count = _count + 1;
	
	private _slice = _size / (2 ^ _count);
	
	// Determines if we check further ahead or back on the axis for the current point
	if (_isOnXAxis) then
	{
		if (_ret select 0 >= _position select 0) then
		{
			_tempPos = [(_ret select 0) + _slice, _ret select 1];
		}
		else
		{
			_tempPos = [(_ret select 0) - _slice, _ret select 1];
		};
	}
	else
	{
		if (_ret select 1 >= _position select 1) then
		{
			_tempPos = [_ret select 0, (_ret select 1) + _slice];
		}
		else
		{
			_tempPos = [_ret select 0, (_ret select 1) - _slice];
		};
	};
	
	_tempDist = _tempPos distance _position;
	if (_tempDist < _minDistance) then
	{
		_ret = _tempPos;
		_minDistance = _tempDist;
	};
};

_ret
