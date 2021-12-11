/*
    Author:
	    Bishop Johnson

	Returns:
	    Array -
*/

#include "..\..\..\..\define.hpp"

if (!isServer) exitWith {};

private _comp =
[
	[
		["Land_Razorwire_F",[0.0668945,8.72949,0],90,1,0,[0,-0],"","",true,false],
		["Land_CncBarrier_F",[-2.00818,-6.99756,0],90,1,0,[0,-0],"","",true,false],
		["Land_CncBarrier_F",[-2.00818,7.00244,0],90,1,0,[0,-0],"","",true,false],
		["Land_CncBarrier_F",[-1.00732,-10.0034,0],45,1,0,[0,0],"","",true,false],
		["Land_CncBarrier_F",[1.29553,11.4937,0],15,1,0,[0,0],"","",true,false],
		["Land_CncBarrier_F",[-1.30042,11.4927,0],345,1,0,[0,0],"","",true,false]
	],
	20, // Radius of composition area
	AAF_KEY
];

_comp
