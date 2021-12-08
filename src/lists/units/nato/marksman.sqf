/*
    author: Bishop
    description: none
    returns: nothing
*/

private ["_weaponP", "_weaponS", "_weaponL", "_optic", "_bipod", "_mag", "_tracerMag", "_uniform", "_vest", "_helmet", "_backpack", "_nvg"];

if (!local this) exitWith {};

private _map = worldName;
if (Escape_Nato_Use_Camo) then
{
    switch true do
    {
        case (_map == TANOA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MXM_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_SOS_khk_F";
            _bipod = "bipod_01_F_khk";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrier1_tna_F";
            _helmet = "H_HelmetB_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Contact):
        {
            _weaponP = "arifle_MXM_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_SOS";
            _bipod = "bipod_01_F_blk";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _uniform = "U_B_CombatUniform_mcam_wdl_f";
            _vest = "V_PlateCarrier1_wdl";
            _helmet = "H_HelmetB_plain_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MXM_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Hamr";
            _bipod = "bipod_01_F_snd";
            _mag = "30Rnd_65x39_caseless_mag";
            _uniform = "U_B_CombatUniform_mcam";
            _vest = "V_PlateCarrier1_rgr";
            _helmet = "H_HelmetB_grass";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MXM_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Hamr";
    _bipod = "bipod_01_F_snd";
    _mag = "30Rnd_65x39_caseless_mag";
    _uniform = "U_B_CombatUniform_mcam";
    _vest = "V_PlateCarrier1_rgr";
    _helmet = "H_HelmetB_grass";
    _nvg = "NVGoggles";
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
this addPrimaryWeaponItem "acc_pointer_IR";
this addPrimaryWeaponItem _optic;
this addPrimaryWeaponItem _mag;
this addPrimaryWeaponItem _bipod;
this addWeapon _weaponS;
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform _uniform;
this addVest _vest;

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
for "_i" from 1 to 5 do {this addItemToVest _mag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "Chemlight_green";
this addHeadgear _helmet;

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem _nvg;
