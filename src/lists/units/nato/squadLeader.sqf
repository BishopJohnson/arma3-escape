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
            _weaponP = "arifle_MX_khk_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Hamr_khk_F";
            _mag = "30Rnd_65x39_caseless_khaki_mag";
            _tracerMag = "30Rnd_65x39_caseless_khaki_mag_Tracer";
            _uniform = "U_B_T_Soldier_F";
            _vest = "V_PlateCarrierGL_tna_F";
            _helmet = "H_HelmetB_Enh_tna_F";
            _nvg = "NVGoggles_tna_F";
        };
        case (_map == LIVONIA_KEY && Escape_Using_Apex):
        {
            _weaponP = "arifle_MX_Black_F";
            _weaponS = "hgun_P07_khk_F";
            _optic = "optic_Hamr";
            _mag = "30Rnd_65x39_caseless_black_mag";
            _tracerMag = "30Rnd_65x39_caseless_black_mag_Tracer";
            _uniform = "U_B_CombatUniform_vest_mcam_wdl_f";
            _vest = "V_PlateCarrierGL_wdl";
            _helmet = "H_HelmetSpecB_wdl";
            _nvg = "NVGoggles_INDEP";
        };
        default
        {
            _weaponP = "arifle_MX_F";
            _weaponS = "hgun_P07_F";
            _optic = "optic_Hamr";
            _mag = "30Rnd_65x39_caseless_mag";
            _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
            _uniform = "U_B_CombatUniform_mcam_vest";
            _vest = "V_PlateCarrierGL_rgr";
            _helmet = "H_HelmetB_desert";
            _nvg = "NVGoggles";
        };
    };
}
else
{
    _weaponP = "arifle_MX_F";
    _weaponS = "hgun_P07_F";
    _optic = "optic_Hamr";
    _mag = "30Rnd_65x39_caseless_mag";
    _tracerMag = "30Rnd_65x39_caseless_mag_Tracer";
    _uniform = "U_B_CombatUniform_mcam_vest";
    _vest = "V_PlateCarrierGL_rgr";
    _helmet = "H_HelmetB_desert";
    _nvg = "NVGoggles";
};

comment "Remove existing items";
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
this addWeapon _weaponS;
this addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
this forceAddUniform _uniform;
this addVest _vest;

comment "Add binoculars";
this addWeapon "Binocular";

comment "Add items to containers";
this addItemToUniform "FirstAidKit";
for "_i" from 1 to 2 do {this addItemToUniform _mag;};
this addItemToUniform "Chemlight_green";
this addItemToVest _mag;
for "_i" from 1 to 2 do {this addItemToVest _tracerMag;};
for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {this addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {this addItemToVest "B_IR_Grenade";};
this addItemToVest "SmokeShell";
this addItemToVest "SmokeShellGreen";
this addItemToVest "SmokeShellBlue";
this addItemToVest "SmokeShellOrange";
this addItemToVest "Chemlight_green";
this addHeadgear _helmet;

comment "Add items";
this linkItem "ItemMap";
this linkItem "ItemCompass";
this linkItem "ItemWatch";
this linkItem "ItemRadio";
this linkItem "ItemGPS";
this linkItem _nvg;
