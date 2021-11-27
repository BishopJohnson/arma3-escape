/*
	author: Bishop
	description: Adds action to local player to convert enemy UAV backpacks to the corrosponding type for their faction.
	returns: nothing
*/

private ["_uav1Packs", "_uav6Packs", "_uav6MedPacks", "_ugv2Packs", "_uav1", "_uav6", "_uav6Med", "_ugv2"];

if (!hasInterface || side player == civilian) exitWith {};

_uav1Packs = ["B_UAV_01_backpack_F", "O_UAV_01_backpack_F", "I_UAV_01_backpack_F", "I_E_UAV_01_backpack_F"];
_uav6Packs = ["B_UAV_06_backpack_F", "O_UAV_06_backpack_F", "I_UAV_06_backpack_F", "I_E_UAV_06_backpack_F"];
_uav6MedPacks = ["B_UAV_06_medical_backpack_F", "O_UAV_06_medical_backpack_F", "I_UAV_06_medical_backpack_F", "I_E_UAV_06_medical_backpack_F"];
_ugv2Packs = ["B_UGV_02_Demining_backpack_F", "O_UGV_02_Demining_backpack_F", "I_UGV_02_Demining_backpack_F", "I_E_UGV_02_Demining_backpack_F"];

switch (side player) do
{
    case west:
    {
        _uav1 = "B_UAV_01_backpack_F";
        _uav1Packs = _uav1Packs - ["B_UAV_01_backpack_F"];
        _uav6 = "B_UAV_06_backpack_F";
        _uav6Packs = _uav6Packs - ["B_UAV_06_backpack_F"];
        _uav6Med = "B_UAV_06_medical_backpack_F";
        _uav6MedPacks = _uav6MedPacks - ["B_UAV_06_medical_backpack_F"];
        _ugv2 = "B_UGV_02_Demining_backpack_F";
        _ugv2Packs = _ugv2Packs - ["B_UGV_02_Demining_backpack_F"];
    };
	case east:
	{
	    _uav1 = "O_UAV_01_backpack_F";
        _uav1Packs = _uav1Packs - ["O_UAV_01_backpack_F"];
        _uav6 = "O_UAV_06_backpack_F";
        _uav6Packs = _uav6Packs - ["O_UAV_06_backpack_F"];
        _uav6Med = "O_UAV_06_medical_backpack_F";
        _uav6MedPacks = _uav6MedPacks - ["O_UAV_06_medical_backpack_F"];
        _ugv2 = "O_UGV_02_Demining_backpack_F";
        _ugv2Packs = _ugv2Packs - ["O_UGV_02_Demining_backpack_F"];
	};
	case independent:
	{
	    _uav1 = "I_UAV_01_backpack_F";
        _uav1Packs = _uav1Packs - ["I_UAV_01_backpack_F", "I_E_UAV_01_backpack_F"];
        _uav6 = "I_UAV_06_backpack_F";
        _uav6Packs = _uav6Packs - ["I_UAV_06_backpack_F", "I_E_UAV_06_backpack_F"];
        _uav6Med = "I_UAV_06_medical_backpack_F";
        _uav6MedPacks = _uav6MedPacks - ["I_UAV_06_medical_backpack_F", "I_E_UAV_06_medical_backpack_F"];
        _ugv2 = "I_UGV_02_Demining_backpack_F";
        _ugv2Packs = _ugv2Packs - ["I_UGV_02_Demining_backpack_F", "I_E_UGV_02_Demining_backpack_F"];
	};
};

private _backpacks = _uav1Packs + _uav6Packs + _uav6MedPacks + _ugv2Packs;

private "_terminals";
switch (side player) do
{
    case west:
	{
	    _terminals = ["B_UavTerminal"];
	};
	case east:
	{
	    _terminals = ["O_UavTerminal"];
	};
	case independent:
	{
	    _terminals = ["I_UavTerminal", "I_E_UavTerminal"];
	};
};

private _condition = format
[
    "backpack player in %1 && count (%2 arrayIntersect assignedItems _this) > 0",
    str _backpacks, str _terminals
];

player addAction
[
	"Hack UAV Backpack",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

        private _backpack = backpack _caller;
        removeBackpack _caller;

        private _backpacks = _arguments select 0;
        for [{ private _i = 0 }, { _i < count _backpacks }, { _i = _i + 1 }] do
        {
            if (_backpack in (_backpacks select _i)) exitWith
            {
                _caller addBackpack ((_arguments select 1) select _i);
            };
        };
	},
	[
	    [_uav1Packs, _uav6Packs, _uav6MedPacks, _ugv2Packs],
	    [_uav1, _uav6, _uav6Med, _ugv2]
	],
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
