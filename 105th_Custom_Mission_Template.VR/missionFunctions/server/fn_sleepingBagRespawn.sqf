/*
	Author: |105th| ArcticFox

	Description:
		 Adds the ability for players to deploy a green camp sleeping bag as a forward mobile respawn point in a mission.

	Parameter(s):
		0: OBJECT - Object with the sleeping bag deploy option.
		
	Returns:
		NOTHING

	Example:
		[sleepingBagMap] spawn SOC_fnc_sleepingBagRespawn;
		
	Known Limitations: 
		1: If the player which placed the sleeping bag disconnects the sleeping bag will be removed per the BIS camp bag logic. 
		
	Known Issues:
		1: The respawn marker will remain on the map after player disconnect. Future versions may look at removing the respawn marker on player disconnect. 
*/

if (!isServer) exitWith {};

params [["_sleepingBagTeleportMap", objNull, [objNull]]];

missionNamespace setVariable ["deployedRespawnBags", [], true];

[
	_sleepingBagTeleportMap,              
	"<t size='1.25' color='#0047AB'>Open Sleeping Bag Teleport Map</t>",             
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",   
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",    
	"_this distance _target < 5",         
	"_caller distance _target < 5",         
	{},                
	{},                
	{
		params ["_sleepingBagTeleportMap"];
		
		if (missionNamespace getVariable ["deployedRespawnBags", []] isNotEqualTo []) Then {
		
			openMap true;
			
			onMapSingleClick {};
			
			[_sleepingBagTeleportMap, _caller] onMapSingleClick {
											
				params ["_sleepingBagTeleportMap", "_caller"];
																		
				_caller setPosWorld getPosWorld ((_pos nearObjects ["Respawn_Sleeping_bag_F", 50]) select 0);   
																						
				openMap false; 
																							
				onMapSingleClick {};
																							
				if (_caller distance _sleepingBagTeleportMap <= 5) then {Hint "No sleeping bags deployed at this location. Try again."};
																						
				};
		
		
			} else {
			
				Hint "No Sleeping Bags Deployed";
			
				};

	},       
	{},                
	[_sleepingBagTeleportMap],                
	1,                
	0,                
	false,               
	false               
	
	] remoteExec ["BIS_fnc_holdActionAdd",0,true];
	


[
	player, {
	
	_player = _this;

	_player addEventHandler ["WeaponAssembled", {
	
		params ["_unit", "_deployedBag"];
												
		if (typeOf _deployedBag isEqualTo "Respawn_Sleeping_bag_F") then {  
			   
			private _mkrSB = createMarker [str (_deployedBag), _deployedBag];     
						   
			_mkrSB setMarkerType "respawn_inf";  
			  
			_mkrSB setMarkerColor "colorBLUFOR"; 
			 
			private _gridPos = mapGridPosition _deployedBag; 
			 
			_mkrSB setMarkerText _gridPos;
			
			private _allDeployedSB = missionNamespace getVariable ["deployedRespawnBags", []];
			
			_allDeployedSB pushBack _mkrSB;
			
			missionNamespace setVariable ["deployedRespawnBags", _allDeployedSB, true];
			
			};
			
		}];
		
		
	_player addEventHandler ["WeaponDisassembled", {
												
		params ["_unit", "_packedBag"];
		
		if (typeOf _packedBag isEqualTo "B_Respawn_Sleeping_bag_F") then {
		
			private _allDeployedSB = missionNamespace getVariable ["deployedRespawnBags", []];
		
			private _nearestSBMarker = ([_allDeployedSB, [], {_unit distance getMarkerPos _x}, "ASCEND"] call BIS_fnc_sortBy) select 0;
			
			deleteMarker _nearestSBMarker;
			
			_allDeployedSB deleteAt (_allDeployedSB find _nearestSBMarker);
			
			missionNamespace setVariable ["deployedRespawnBags", _allDeployedSB, true];
		
			};
			
		}];

	_player addEventHandler ["Respawn", {_this select 0 setPos getMarkerPos "respawn_west";}];
	
	}

] remoteExec ["call", 0, true];