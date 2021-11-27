/*
	DragBody script by BangaBob (H8erMaker) v1.2
	Modified by Bishop
	
	Description
		Drag incapacitated bodies. JIP/MP/SP/Dedicated compatible
	
	Instructions
		Add this line into the init.sqf. This will add a drag action to all editor placed units.
		null = allUnits execVM "H8_dragBody.sqf";
		
		Or use for just playable units.
		null = playableUnits execVM "BangaBob\H8_dragBody.sqf";
	
	Functions
		[UNIT1, UNIT2, UNIT3] spawn H8_addDrag;
		Add living units into the script. (Useful for units spawned mid-mission).
*/

#define H8_CARRYTEXT "Carry Body"  // AddAction text for drag body
#define H8_DRAGTEXT "Drag Body"    // AddAction text for drag body
#define H8_DROPTEXT "Release Body" // AddAction text for dropping body
#define H8_LOADTEXT "Load Body"    // AddAction text for dropping body

H8_fnc_Action =
{
	/* 1. The target is not this unit.
	 * 2. The target is not attached to another object.
	 * 3. This unit does not have any other attached objects.
	 * 4. The target is within 3 meters.
	 * 5. The target is incapacitated.
	 */
	_condition = "vehicle _this != vehicle _target &&
				  isNull attachedTo _target &&
				  count attachedObjects _this == 0 &&
				  _target distance _this < 3 &&
				  (lifeState _target) == 'INCAPACITATED'";
	
	{
		//_x addaction [H8_CARRYTEXT, { call H8_CarryAction }, nil, 6, false, false, "", _condition];
		_x addAction [H8_DRAGTEXT, { call H8_DragAction }, nil, 6, false, false, "", _condition];
	} forEach _this;
};

/*
H8_CarryAction =
{
	_unit = (_this select 0);
	
	// GLOBAL CODE
	_unitID = _unit getVariable "H8_increm";
	[[_unit, vehicle player, _unitID], "H8_fnc_attach", true] call BIS_fnc_MP;
	_unit attachTo [player, [0, 1, 0]];
	
	// CLIENT SIDE
	player playAction "grabCarry";
	player forceWalk true;
	
	_dropID = player addAction [H8_DROPTEXT, { call H8_dropAction }, _unit, 6];
	_hideID = player addAction [H8_LOADTEXT, { call H8_putIncar }, _unit, 6, false, false, "", "_target distance _this < 8 and cursorTarget isKindOf 'LandVehicle'"];
	
	player setVariable ["H8hideVeh", _hideID];
	player setVariable ["H8dropact", _dropID];
};*/

H8_DragAction =
{
	_unit = (_this select 0);
	
	// GLOBAL CODE
	_unitID = _unit getVariable "H8_increm";
	[[_unit, vehicle player, _unitID], "H8_fnc_attach", true] call BIS_fnc_MP;
	_unit attachTo [player, [0, 1, 0]];
	
	// CLIENT SIDE
	player playAction "grabDrag";
	player forceWalk true;
	
	_dropID = player addAction [H8_DROPTEXT, { call H8_dropAction }, _unit, 6];
	_hideID = player addAction [H8_LOADTEXT, { call H8_putIncar }, _unit, 6, false, false, "", "_target distance _this < 9 and cursorTarget isKindOf 'LandVehicle'"];
	
	player setVariable ["H8hideVeh", _hideID];
	player setVariable ["H8dropact", _dropID];
};

H8_putIncar =
{
	_hideID = (_this select 2);
	_dropID = player getVariable "H8dropact";
	_unit = (_this select 3);
	_vehicle = cursorTarget;
	
	// CLIENT CODE
	player playMove "amovpknlmstpsraswrfldnon";
	player forceWalk false;
	player removeAction _hideID;
	player removeAction _dropID;
	
	// GLOBAL CODE
	_unitID = _unit getVariable "H8_increm";
	0 = [[_unit, vehicle player, _unitID], "H8_fnc_detach", true] call BIS_fnc_MP;
	sleep 1;
	deTach _unit;
	_unit moveInCargo _vehicle;
	
	/* No need for a unload action since Arma 3 already handles unloading unconsious units from vehicles.
	 */
};

H8_dropAction =
{
	_dropID = (_this select 2);
	_hideID = player getVariable "H8hideVeh";
	_unit = (_this select 3);
	
	// GLOBAL CODE
	_unitID = _unit getVariable "H8_increm";
	0 = [[_unit, vehicle player, _unitID], "H8_fnc_detach", true] call BIS_fnc_MP;
	deTach _unit;
	
	// CLIENT SIDE
	player removeAction _hideID;
	player removeAction _dropID;
	player playMove "amovpknlmstpsraswrfldnon";
	player forceWalk false;
};

H8_fnc_attach =
{
	_unit = (_this select 0);
	_player = (_this select 1);
	_unitID = (_this select 2);
	
	_id = format ["h8EF%1", _unitID];
	
	_unit attachTo [_player];
	_unit setDir 180;
	_unit switchMove "AinjPpneMrunSnonWnonDb";
};

H8_fnc_detach =
{
	_unit = (_this select 0);
	_player = (_this select 1);
	_unitID = (_this select 2);
	
	_id = format ["h8EF%1", _unitID];
	
	detach _unit;
	_unit switchMove "AinjPpneMstpSnonWrflDb_release";
};

/*
H8_addCarry =
{
	// TODO
};*/

H8_addDrag =
{
	{
		H8_increments = H8_increments + 1;
		_x setVariable ["H8_increm", H8_increments, true];
		H8_dragUnitArray set [count H8_dragUnitArray, _x];
	} forEach _this;
	
	[_this, "H8_fnc_Action", TRUE] call BIS_fnc_MP;
	
	publicVariable "H8_increments";
	publicVariable "H8_dragUnitArray";
};

if (isServer) then
{
	if (isNil ("H8_dragUnitArray")) then
	{
		H8_dragUnitArray = [];
		H8_increments = 0;
	};
	
	{
		H8_increments = H8_increments + 1;
		_x setVariable ["H8_increm", H8_increments, true];
		H8_dragUnitArray set [count H8_dragUnitArray, _x];
	} forEach _this;
	
	publicVariable "H8_increments";
	publicVariable "H8_dragUnitArray";
};

if (!isServer && (player != player)) then
{
	waitUntil { player == player };
	waitUntil { time > 15 };
};

if (hasInterface) then
{
	0 = H8_dragUnitArray spawn H8_fnc_Action;
};
