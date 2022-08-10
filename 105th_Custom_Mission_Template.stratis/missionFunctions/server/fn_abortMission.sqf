/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the current group leader when near the respawn point or on object at base allowing the group leader to abort the mission.

	Parameter(s):
		0: MARKER or OBJECT - (default "respawn_west" marker) Note: Group param required if marker is used.
		1: GROUP - Group which will have the abort action available. Note: only group leader will have action.

	Returns:
		NOTHING

	Example:
		Call on server only. ["respawn_west", playerGroup_1] spawn SOC_fnc_abortMission;
*/

params [
		["_abortLocation", "respawn_west"],
		["_abortGroup", nil]
		];



if (typeName _abortLocation isNotEqualTo "OBJECT") 

	then 	{	
				_missionIncomplete = true;
	
				waitUntil {sleep 10; leader _abortGroup distance getMarkerPos _abortLocation > 25};
				
				while {_missionIncomplete} 

				do {
						_abortGroupLeader = leader _abortGroup;
	
						if (!alive _abortGroupLeader) then {waitUntil {sleep 1; isNull _abortGroupLeader}; _abortGroupLeader = leader _abortGroup;};
						
						waitUntil {sleep 1; _abortGroupLeader distance getMarkerPos _abortLocation < 25};
						
						[_abortGroupLeader, 
		
							{	
			
								abortActionID = [_this,
								"<t color='#FF0000'>ABORT MISSION</t>", 
								"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
								"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa", 
								"_this == _target",  
								"true",  
								{
									"abortText" cutText ["Aborting Mission.","PLAIN",1]
								},  
								{},  
								{
									[["The mission is ending.","PLAIN DOWN",1]] remoteExec ["titleText",0,false];

									sleep 5;

									["End3"] remoteExec ["BIS_fnc_endMission", 0, true];
								},
								{
									"abortText" cutFadeOut 0;
								},  
								[],  
								5,  
								0,  
								true,  
								false] call BIS_fnc_holdActionAdd;
				
								_this setVariable ["abortActID", abortActionID, true];
				
							}
						] remoteExec ["call", _abortGroupLeader];
				
						waitUntil {sleep 1; _abortGroupLeader distance getMarkerPos _abortLocation > 25 || _abortGroupLeader isNotEqualTo leader _abortGroup || !alive _abortGroupLeader || !_missionIncomplete};
						
						[_abortGroupLeader, _abortGroupLeader getVariable "abortActID"] remoteExec ["BIS_fnc_holdActionRemove", _abortGroupLeader];
			
					};
			}
			
	else 	{
				
				if (!isNil "_abortGroup") then {actionTarget = "leader _abortGroup distance _target < 5"} else {actionTarget = "_this distance _target < 5"};
				
				[_abortLocation,            
				"<t color='#FF0000'>ABORT MISSION</t>",             
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",            
				actionTarget,  
				actionTarget,             
				{
					"abortText" cutText ["Aborting Mission.","PLAIN",1]
				},            
				{},            
				{    
					[["The mission is ending.","PLAIN DOWN",1]] remoteExec ["titleText",0,false];

					sleep 5;

					["End3"] remoteExec ["BIS_fnc_endMission", 0, true];
				},            
				{
					"abortText" cutFadeOut 0;
				},            
				[],            
				3,           
				0,            
				true,            
				false] remoteExec ["BIS_fnc_holdActionAdd", 0, true];
				
			};
							
							
							































































_groupVarName  = _this select 0;

waitUntil {sleep 10; leader _groupVarName distance getMarkerPos "respawn_west" > 25};

//systemChat "Mission Abort Monitor Start";

missionIncomplete = true;

while {missionIncomplete}

	do {
			
			//systemChat "Check leader distance";
			
			if ((leader _groupVarName distance getMarkerPos "respawn_west" < 25) && alive leader _groupVarName)
			
			then {
					
					if (player != leader _groupVarName) then {[player, AbortMission] remoteExecCall ["BIS_fnc_holdActionRemove", 0]};
					
					sleep 1;
			
					AbortMission = [leader _groupVarName,            
					"<t color='#FF0000'>ABORT MISSION</t>",             
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
					"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",            
					"_this == _target",  
					"true",             
					{"abortText" cutText ["Aborting Mission.","PLAIN",1]},            
					{},            
					{    
						[["The mission is ending.","PLAIN DOWN",1]] remoteExec ["titleText",0,false];

						sleep 5;

						["End2"] remoteExec ["BIS_fnc_endMission", 0, true];
					},            
					{
					"abortText" cutFadeOut 0;
					},            
					[],            
					3,           
					0,            
					true,            
					false] call BIS_fnc_holdActionAdd;
					
					sleep 1;
					
					waitUntil {sleep 10; (leader _groupVarName distance getMarkerPos "respawn_west" > 25) || player != leader _groupVarName || !alive player};
					
					sleep 1;
					
					[player, AbortMission] remoteExecCall ["BIS_fnc_holdActionRemove", 0]; 
					
				};
			
		sleep 10;	
			
		};