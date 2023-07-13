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

if (isDedicated) exitWith {};

if (isnil "DeplyedSB") then {DeplyedSB = []};

_player = player;

_player addEventHandler ["WeaponAssembled", {
												if ( typeOf (_this select 1) isEqualTo "Respawn_Sleeping_bag_F") 
														
														then {  
     
																_name = [_this select 1] call BIS_fnc_objectVar; 
																   
																createMarker [_name, _this select 1];     
																			   
																_name setMarkerType "respawn_inf";  
																  
																_name setMarkerColor "colorBLUFOR"; 
																 
																_VarNameSB  = call compile _name; 
																 
																_GridPos = mapGridPosition _VarNameSB; 
																 
																_name setMarkerText _GridPos; 
																  
																DeplyedSB pushBack _name;  
																  
																publicVariable "DeplyedSB";  
   
															 }
											}
						];
 
 
_player addEventHandler ["WeaponDisassembled", {
												if (typeOf (_this select 1) isEqualTo "B_Respawn_Sleeping_bag_F") 
															
													then {


															_SortedSBMarkerArr = [DeplyedSB, [], {_this select 0 distanceSqr getMarkerPos _x}, "ASCEND"] call BIS_fnc_sortBy;

															_SortedSBMarkerArr params ["_nearestSBMarker"];

															deleteMarker _nearestSBMarker;

															DeplyedSB = DeplyedSB - [_SortedSBMarkerArr Select 0]; 

															publicVariable "DeplyedSB";
														}
											}
						];
						
						
_player addEventHandler ["Respawn", {_this select 0 setPos getMarkerPos "respawn_west";}];

params [["_sleepingBagTeleportMap", nil, [objNull]]]; 

while {true} 

do {
	
		waitUntil {sleep 1; _player distance _sleepingBagTeleportMap < 5};
		
			//systemChat "Action Added";

			_sleepingBagActionID = [_sleepingBagTeleportMap,              
									"<t size='1.25' color='#0047AB'>Open Sleeping Bag Teleport Map</t>",             
									"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",   
									"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",    
									"_this distance _target < 5",         
									"_caller distance _target < 5",         
									{},                
									{},                
									{
									params ["_sleepingBagTeleportMap"];

									if (Count DeplyedSB < 1) 
												
									Then {Hint "No Sleeping Bags Deployed"} 
													
									Else {
											openMap true;
											onMapSingleClick {};
											[_sleepingBagTeleportMap, _caller] onMapSingleClick {
											
																							params ["_sleepingBagTeleportMap", "_caller"];
																		
																							_caller setPos getPos (nearestObjects [_pos, ["Respawn_Sleeping_bag_F"], 50] select 0);
																							
																							openMap false; 
																							
																							onMapSingleClick {};
																							
																							if (_caller distance _sleepingBagTeleportMap < 5) then {Hint "No sleeping bags deployed at this location. Try again."};
																						};
										};
									},       
									{},                
									["_sleepingBagTeleportMap"],                
									1,                
									0,                
									false,               
									false               
									] call BIS_fnc_holdActionAdd;
									
			//systemChat str _sleepingBagActionID;
			
		waitUntil {sleep 1; _player distance _sleepingBagTeleportMap > 5};
		
		//systemChat "Action Removed";

		[_sleepingBagTeleportMap, _sleepingBagActionID] call BIS_fnc_holdActionRemove;
		
	};

