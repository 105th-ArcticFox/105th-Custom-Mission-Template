/*
	Author: |105th| ArcticFox

	Description:
		Adds a hold action to the current group leader when near the respawn point or on object at base allowing the group leader to abort the mission.

	Parameter(s):
		0: GROUP - Group assigned to the rally-point
		1: MARKER or OBJECT - (default "respawn_west" marker) 

	Returns:
		NOTHING

	Example:
		Call on server only. [] spawn SOC_fnc_abortMission;
*/

params [
		"_abortGroup",
		"_abortLocation"
		];



if (typeName _abortLocation isNotEqualTo "OBJECT") 

	then 	{	
	
				waitUntil {sleep 10; leader _abortGroup distance getMarkerPos _abortLocation > 25};
				
				while {true} 

				do {
						_abortGroupLeader = leader _abortGroup;
	
						if (!alive _abortGroupLeader) then {waitUntil {sleep 1; isNull _abortGroupLeader}; _abortGroupLeader = leader _abortGroup;};
						
						[_abortGroupLeader, 
		
							{	
			
								abortActionID = [_this,            
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
				
								_this setVariable ["actionID", abortActionID, true];
				
							}
						] remoteExec ["call", _abortGroupLeader];
				
						waitUntil {sleep 1; (leader _groupVarName distance getMarkerPos _abortLocation > 25) || _abortGroupLeader isNotEqualTo leader _abortGroup || !alive _abortGroupLeader};
						
						[_abortGroupLeader, _abortGroupLeader getVariable "actionID"] remoteExec ["BIS_fnc_holdActionRemove", _abortGroupLeader];
			
					};
			}
			
	else 	{
	
				[_abortLocation,            
				"<t color='#FF0000'>ABORT MISSION</t>",             
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",           
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsdown_ca.paa",            
				"Leader _abortGroup distance _target < 5",  
				"Leader _abortGroup distance _target < 5",             
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
				false] remoteExec ["BIS_fnc_holdActionAdd", -2, true];
				
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