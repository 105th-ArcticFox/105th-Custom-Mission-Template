/*
	Author: |105th| ArcticFox

	Description:
		Version 3. Adds a hold action to the groups leader allowing him to move the respawn position marker to their position a set number of times throughout the mission. 

	Parameter(s):
		0: GROUP - Group assigned to the rally-point
		1: NUMBER - number of rally-points available in the mission
		2: MARKER (Optional, default "respawn_west") rally-point marker
		3: BOOLEAN - (Optional, default false) Auto move players to custom marker on respawn. Only use parameter if respawn marker other than reapawn_west used. 

	Returns:
		NOTHING

	Example:
		 [playerGroup, 5] spawn SOC_fnc_rallyPointRespawn;
		 
		 Update available rally-points mid mission with: _rallyPointGroup setVariable ["availableRallyPoints", 999, true];
*/

if (!isServer) exitWith {};

params [
			["_rallyPointGroup", "", [grpNull]], 
			["_availableRallyPoints", 3, [0]],
			["_rallyPointMarker","respawn_west",[""]],
			["_customMarkerAutoMove", false, [true]]
		];
		
if (_customMarkerAutoMove)

	then {
			[[player, _rallyPointMarker], 
			
					{
						params ["_player", "_rallyPointMarker"];
						
						_player setVariable ["rallyPointMarker", _rallyPointMarker, true];
					
						_player addEventHandler ["Respawn", {
							
															params ["_unit"];
															
															_unit setPos getMarkerPos _unit getVariable "rallyPointMarker";
					
														   }
											   ] 
					}
					
			] remoteExec ["call", _rallyPointGroup, true];
		
		};
	
		
[[Str _availableRallyPoints + " New Rally-Points Available.","PLAIN",1]] remoteExec ["titleText", _rallyPointGroup, false];

		
while {_availableRallyPoints > 0} 

	do {
		
		//systemChat "get rallypoint group leader";
		_rallyPointGroupLeader = leader _rallyPointGroup;
		
		if (!alive _rallyPointGroupLeader) then {waitUntil {sleep 1; isNull _rallyPointGroupLeader}; _rallyPointGroupLeader = leader _rallyPointGroup;};

		//systemChat str _rallyPointGroupLeader;
		
		_rallyPointGroup setVariable ["availableRallyPoints", _availableRallyPoints, true];

			//systemChat "add RP action to group leader";
			
			[[_rallyPointGroupLeader, _rallyPointMarker], 
			
				{

					params ["_rallyPointGroupLeader", "_rallyPointMarker"];
				
					rallyPointActionID = [_rallyPointGroupLeader,            
					"<t color='#0000FF'>ESTABLISH RALLY-POINT</t>",  
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",  
					"_this isEqualTo _target",  
					"true",  
					{
						"infoText" cutText ["Establishing New Rally-Point!","PLAIN",1];
					},  
					{},  
					{
						"infoText" cutFadeOut 0;
						
						_a1 setMarkerPos getpos _target;
						
						_availableRallyPoints = (group _a0 getVariable "availableRallyPoints") - 1; 
						
						group _a0 setVariable ["availableRallyPoints", _availableRallyPoints, true];
						
						[[Str _availableRallyPoints + " Rally-Points Remaining","PLAIN",1]] remoteExec ["titleText", group _a0, false];
					},
					{
						"infoText" cutFadeOut 0;
					},  
					[_rallyPointGroupLeader, _rallyPointMarker],  
					5,  
					0,  
					false,  
					false] call BIS_fnc_holdActionAdd;
					
					_rallyPointGroupLeader setVariable ["rallyPointActID", rallyPointActionID, true];
					
				}
			] remoteExec ["call", _rallyPointGroupLeader];
					
		waitUntil {sleep 1; 
		
					//systemChat "Check if available RPs is less then 1 or new leader or leader not alive";
					
					_rallyPointGroup getVariable "availableRallyPoints" < 1 || _rallyPointGroupLeader isNotEqualTo leader _rallyPointGroup || !alive _rallyPointGroupLeader
				   };
		
		_availableRallyPoints = _rallyPointGroup getVariable "availableRallyPoints";
		
		//systemChat "remove RP action from leader if available RPs is 0 or new leader assigned";
		[_rallyPointGroupLeader, _rallyPointGroupLeader getVariable "rallyPointActID"] remoteExec ["BIS_fnc_holdActionRemove", _rallyPointGroupLeader];
		
		};