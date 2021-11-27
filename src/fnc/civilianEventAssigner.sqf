/*

*/

params ["_civ"];

private [];

if (!isServer) exitwith {};

if (side _civ != civilian) exitWith {};

_civ addEventHandler
[
	"Dammaged",
	{
		params ["_unit", "_selection", "_damage", "_hitIndex", "_hitPoint", "_shooter", "_projectile"];
		
		private ["_instigator"];
		
		if (_damage + damage _unit >= 1) then
		{
			[
				"A civilian was killed!"
			] remoteExec ["hint"];
			
			_instigator = getShotParents _projectile;
			
			/* Preempts the civilian's death by the instigator to prevent
			 * their side becoming hostile to them.
			 */
			_unit setDamage [1, false];
			
			if (isPlayer _instigator) then
			{
				/* TODO: Increment death by players counter.
				 */
				
				[
					format ["%1 killed a civilian!", (name _instigator)]
				] remoteExec ["hint"];
			};
		};
	}
];
