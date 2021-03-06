/*
	author: Bishop
	description: none
	returns: nothing
*/

#include "..\..\..\define.hpp"

private ["_vehicles", "_veh", "_variants"];

if (!isServer) exitWith {};

private _dict = createHashMap;
private _map = worldName;

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// Quadbike
_vehicles set ["quadbike", [["C_Quadbike_01_F"], ["Black", "Blue", "Red", "White"], true]];

_dict set [RAND_VEH_QUADBIKE_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Cars unarmed
_vehicles = createHashMap;

// Hatchback
_vehicles set ["hatchback", [
    ["C_Hatchback_01_F"],
    ["Beige", "Beigecustom", "Black", "Blue", "Bluecustom", "Dark", "Green", "Grey", "Yellow"],
    true
]];

// Hatchback
_vehicles set ["hatchbackSport", [
    ["C_Hatchback_01_sport_F"],
    ["Beige", "Blue", "Green", "Grey", "Orange", "Red", "White"],
    true
]];

// MB 4WD
if (Escape_Using_Apex) then
{
    _vehicles set ["4wd", [
        ["C_Offroad_02_unarmed_F"],
        ["Black", "Blue", "Brown", "Green", "Olive", "Orange", "Red", "White"],
        true
    ]];
};

// Offroad
_vehicles set ["offroad", [
    ["C_Offroad_01_F"],
    ["Beige", "Blue", "Bluecustom", "Darkred", "Green", "Red", "White"],
    true
]];

// Offroad Covered
if (Escape_Using_Contact) then
{
    _vehicles set ["offroadCovered", [["C_Offroad_01_covered_F"], ["Black", "Green"], true]];
};

// SUV
_vehicles set ["suv", [["C_SUV_01_F"], ["Black", "Grey", "Orange", "Red"], true]];

// Tractor
if (Escape_Using_Contact) then
{
    _vehicles set ["tractor", [["C_Tractor_01_F"], ["Blue", "Green", "Red"], true]];
};

// Van
if (Escape_Using_Orange) then
{
    _variants = ["BattleBus", "Black", "Blue", "Green", "Masked", "Orange", "Red", "Swifd", "Vrana", "White"];
    if (_map == TANOA_KEY) then { _variants append ["BluePearl", "Daltgreen"] };

    _vehicles set ["van", [["C_Van_02_vehicle_F", "C_Van_02_transport_F"], _variants, true]];
};

_dict set [RAND_VEH_CAR_UNARMED_KEY, _vehicles];

///////////////////////////////////////////////////////////////////////////////////////////////////////// Trucks unarmed
_vehicles = createHashMap;

// Truck
_vehicles set ["truck", [["C_Van_01_transport_F", "C_Van_01_box_F"], ["Black", "Red", "White"], true]];

// Zamak
_vehicles set ["zamak", [["C_Truck_02_transport_F"], ["Blue", "Orange"], true]];

// Zamak Covered
_vehicles set ["zamakCovered", [
    ["C_Truck_02_covered_F"],
    ["BlueBlue", "BlueOlive", "OrangeBlue", "OrangeOlive"],
    true
]];

_dict set [RAND_VEH_TRUCK_UNARMED_KEY, _vehicles];

/////////////////////////////////////////////////////////////////////////////////////////////////////////// Utility cars
_vehicles = createHashMap;

// Fuel Truck
_vehicles set ["fuelTruck", [
    ["C_Van_01_fuel_F"],
    ["Black", "Black_v2", "Red", "Red_v2", "White", "White_v2"],
    true
]];

// Offroad
_vehicles set ["offroad", [["C_Offroad_01_repair_F"], true, true]];

// Van
if (Escape_Using_Orange) then
{
    _vehicles set ["van", [["C_Van_02_medevac_F", "C_Van_02_service_F"], true, true]];
};

// Zamak Fuel
_vehicles set ["zamakFuel", [["C_Truck_02_fuel_F"], ["Blue", "Orange"], true]];

// Zamak Repair
_vehicles set ["zamakRepair", [
    ["C_Truck_02_box_F"],
    ["BlueGreen", "BlueOrange", "OrangeGreen", "OrangeOrange"],
    true
]];

_dict set [RAND_VEH_UTIL_KEY, _vehicles];

private _side = str civilian;
private _sideDict = Escape_Random_Vehicles get _side;
_sideDict set [CIVILIAN_KEY, _dict];
Escape_Random_Vehicles set [_side, _sideDict];
