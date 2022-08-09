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
						
					
			