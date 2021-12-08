/*
    author: Bishop
    description: none
    returns: nothing
*/

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

if (!local this) exitWith {};

private _map = worldName;
if (Escape_Csat_Pacific_Use_Camo) then
{
    switch (_map) do
    {
        case TANOA_KEY;
        case LIVONIA_KEY:
        {
            _weaponP = "arifle_CTAR_ghex_F";
            _vest = "V_TacVest_oli";
            _nvg = "O_NVGoggles_ghex_F";
        };
        default
        {
            _weaponP = "arifle_CTAR_hex_F";
            _vest = "V_TacVest_khk";
            _nvg = "NVGoggles_OPFOR";
        };
    };
}
else
{
    _weaponP = "arifle_CTAR_blk_F";
    _vest = "V_TacVest_oli";
    _nvg = "O_NVGoggles_ghex_F";
};

// Remove existing items
removeAllWeapons this;
removeAllItems this;
removeAllAssignedItems this;
removeUniform this;
removeVest this;
removeBackpack this;
removeHeadgear this;

comment "Add weapons";
this addWeapon _weaponP;
this addPrimaryWeaponItem "30Rnd_580x42_Mag_F";
this addWeapon "hgun_Rook40_F";

comment "Add containers";
this forceAddUniform "U_O_PilotCoveralls";
this addVest _vest;

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 3 do {this addItemToUniform "30Rnd_580x42_Mag_F";};
this addItemToUniform "SmokeShellRed";
this addItemToUniform "SmokeShellOrange";
this addItemToUniform "SmokeShellYellow";
for "_i" from 1 to 2 do {this addItemToUniform "Chemlight_red";};
this addHeadgear "H_CrewHelmetHeli_O";

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;

[
    this,
    selectRandom
    [
        "AsianHead_A3_01",
        "AsianHead_A3_02",
        "AsianHead_A3_03",
        "AsianHead_A3_04",
        "AsianHead_A3_05",
        "AsianHead_A3_06",
        "AsianHead_A3_07"
    ],
    selectRandom ["male01chi", "male02chi", "male03chi"]
] call BIS_fnc_setIdentity;
