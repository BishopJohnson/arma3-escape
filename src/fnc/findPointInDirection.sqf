/*
	author: Bishop
	description: none
	returns: Position2D
*/

params ["_pos", "_dir", "_dist"];

private _posX = _pos select 0;
private _posY = _pos select 1;
private _relDir = _dir % 90;

if (_dir >= 0 && _dir < 90) exitWith
{
    _relX = _dist * sin _relDir;
    _relY = _dist * cos _relDir;
    private _result = [_posX + _relX, _posY + _relY];

    _result
};

if (_dir >= 90 && _dir < 180) exitWith
{
    _relX = _dist * cos _relDir;
    _relY = _dist * sin _relDir;
    private _result = [_posX + _relX, _posY - _relY];

    _result
};

if (_dir >= 180 && _dir < 270) exitWith
{
    _relX = _dist * sin _relDir;
    _relY = _dist * cos _relDir;
    private _result = [_posX - _relX, _posY - _relY];

    _result
};

if (_dir >= 270 && _dir < 360) exitWith
{
    _relX = _dist * cos _relDir;
    _relY = _dist * sin _relDir;
    private _result = [_posX - _relX, _posY + _relY];

    _result
};
