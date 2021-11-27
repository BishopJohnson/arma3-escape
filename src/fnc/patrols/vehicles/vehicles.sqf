/*
    Author:
	    Bishop Johnson
	
	Parameter(s):
	    Side - 
	    String - 
	
	Returns:
	    String - 
*/

params ["_side", "_type"];

private ["_veh", "_vehicles"];

if (!isServer) exitWith {};

/* MRAPs are present under both type "MRAP"
 * and for type "Car".
 * 
 * Technicals are present under both type
 * "Technical" and for type "Car".
 */

_veh = "";
switch (_side) do
{
    case west:
	{
	    switch (_type) do
		{
		    case "MRAP":
			{
			    _vehicles = ["B_MRAP_01_F", "B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"];
				_veh = selectRandom _vehicles;
			};
			case "Technical":
			{
			    _vehicles = ["B_LSV_01_unarmed_F", "B_LSV_01_armed_F", "B_LSV_01_AT_F", "B_G_Offroad_01_F", "B_G_Offroad_01_armed_F", "B_G_Offroad_01_AT_F"];
				_veh = selectRandom _vehicles;
			};
			case "APC":
			{
				_vehicles = ["B_APC_Wheeled_01_cannon_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F"];
				_veh = selectRandom _vehicles;
			};
			case "Tank":
			{
			    _vehicles = ["B_AFV_Wheeled_01_cannon_F", "B_AFV_Wheeled_01_up_cannon_F", "B_MBT_01_cannon_F", "B_MBT_01_TUSK_F"];
				_veh = selectRandom _vehicles;
			};
			case "AAA":
			{
			    _vehicles = ["B_APC_Tracked_01_AA_F"];
				_veh = selectRandom _vehicles;
			};
			case "Artillery":
			{
			    _vehicles = ["B_MBT_01_arty_F", "B_MBT_01_mlrs_F"];
				_veh = selectRandom _vehicles;
			};
			default // Car
			{
			    _vehicles = ["B_MRAP_01_F", "B_LSV_01_unarmed_F", "B_G_Offroad_01_F", "B_Truck_01_mover_F", "B_Truck_01_transport_F", "B_Truck_01_covered_F", "B_Truck_01_box_F", "B_Truck_01_ammo_F", "B_Truck_01_fuel_F", "B_Truck_01_medical_F", "B_Truck_01_Repair_F", "B_Quadbike_01_F"];
				_veh = selectRandom _vehicles;
			};
		};
	};
	case east:
	{
	    switch (_type) do
		{
		    case "MRAP":
			{
			    _vehicles = ["O_MRAP_02_F", "O_MRAP_02_hmg_F", "O_MRAP_02_gmg_F"];
				_veh = selectRandom _vehicles;
			};
			case "Technical":
			{
			    _vehicles = ["O_LSV_02_unarmed_F", "O_LSV_02_armed_F", "O_LSV_02_AT_F", "O_G_Offroad_01_F", "O_G_Offroad_01_armed_F", "O_G_Offroad_01_AT_F"];
				_veh = selectRandom _vehicles;
			};
			case "APC":
			{
				_vehicles = ["O_APC_Wheeled_02_rcws_v2_F", "O_APC_Tracked_02_cannon_F"];
				_veh = selectRandom _vehicles;
			};
			case "Tank":
			{
			    _vehicles = ["O_MBT_02_cannon_F", "O_MBT_04_cannon_F", "O_MBT_04_command_F"];
				_veh = selectRandom _vehicles;
			};
			case "AAA":
			{
			    _vehicles = ["O_APC_Tracked_02_AA_F"];
				_veh = selectRandom _vehicles;
			};
			case "Artillery":
			{
			    _vehicles = ["O_MBT_02_arty_F"];
				_veh = selectRandom _vehicles;
			};
			default // Car
			{
			    _vehicles = ["O_MRAP_02_F", "O_LSV_02_unarmed_F", "O_G_Offroad_01_F", "O_Truck_02_transport_F", "O_Truck_02_covered_F", "O_Truck_02_box_F", "O_Truck_02_Ammo_F", "O_Truck_02_fuel_F", "O_Truck_02_medical_F", "O_Truck_03_transport_F", "O_Truck_03_covered_F", "O_Truck_03_ammo_F", "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_repair_F", "O_Truck_03_device_F", "O_Quadbike_01_F"];
				_veh = selectRandom _vehicles;
			};
		};
	};
	case independent:
	{
	    switch (_type) do
		{
		    case "MRAP":
			{
			    _vehicles = ["I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_MRAP_03_gmg_F"];
				_veh = selectRandom _vehicles;
			};
			case "Technical":
			{
			    _vehicles = ["I_G_Offroad_01_F", "I_G_Offroad_01_armed_F", "I_G_Offroad_01_AT_F"];
				_veh = selectRandom _vehicles;
			};
			case "APC":
			{
				_vehicles = ["I_APC_Wheeled_03_cannon_F", "I_APC_tracked_03_cannon_F"];
				_veh = selectRandom _vehicles;
			};
			case "Tank":
			{
			    _vehicles = ["I_MBT_03_cannon_F", "I_LT_01_scout_F", "I_LT_01_cannon_F", "I_LT_01_AT_F"];
				_veh = selectRandom _vehicles;
			};
			case "AAA":
			{
			    _vehicles = ["I_LT_01_AA_F"];
				_veh = selectRandom _vehicles;
			};
			case "Artillery":
			{
			    _vehicles = ["I_Truck_02_MRL_F", ""];
				_veh = selectRandom _vehicles;
			};
			default // Car
			{
			    _vehicles = ["I_MRAP_03_F", "I_G_Offroad_01_F", "I_Truck_02_transport_F", "I_Truck_02_covered_F", "I_Truck_02_box_F", "I_Truck_02_ammo_F", "I_Truck_02_fuel_F", "I_Truck_02_medical_F", "I_Quadbike_01_F"];
				_veh = selectRandom _vehicles;
			};
		};
	};
	default // Civilian
	{
	    _vehicles = ["C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_Offroad_01_repair_F", "C_SUV_01_F", "", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F", "C_Offroad_02_unarmed_F", "C_Van_02_transport_F", "C_Van_02_vehicle_F", "C_Van_02_service_F", "C_Van_02_medevac_F", "C_Truck_02_transport_F", "C_Truck_02_covered_F", "C_Truck_02_fuel_F", "C_Truck_02_box_F", "C_Quadbike_01_F"];
		_veh = selectRandom _vehicles;
	};
};

_veh
