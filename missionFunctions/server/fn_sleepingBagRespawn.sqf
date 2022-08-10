/*
	Author: |105th| ArcticFox

	Description:
		 

	Parameter(s):
		0: OBJECT - Object with the sleeping bag deploy option.
		
	Returns:
		NOTHING

	Example:
		Call on server only. [sleepingBagMap] spawn SOC_fnc_sleepingBagRespawn;
		
	Known Issues: 
		1: If the player which placed the sleeping bag disconnects the sleeping bag will be removed per the BIS camp bag logic. The respawn marker will remain on the map. Future versions may look at removing the respawn marker on player disconnect. 
*/

params [
		"_sleepingBagTeleportMap"
		];


[_sleepingBagTeleportMap,              
"<t size='1.25' color='#0047AB'>Open Sleeping Bag Teleport Map</t>",             
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",   
"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa",    
"_this distance _target < 5",         
"_caller distance _target < 5",         
{},                
{},                
{
	call {

			ActiveSBObj = allMissionObjects "Respawn_Sleeping_bag_F";   
    
			Sleep 1; 
    
			if (Count ActiveSBObj < 1) 
			
			Then {Hint "No Sleeping Bags Deployed"} 
			
			Else {
					openMap true;
					onMapSingleClick {};
					onMapSingleClick {  
										RefPos = _Pos;  
										_sortedByRange = [ActiveSBObj,[],{RefPos distance _x},"ASCEND"] call BIS_fnc_sortBy;  
										_sortedByRange params ["_nearestSB"];  
                              
										If (_pos distance _nearestSB < 50) 
										
										Then {Player SetPos GetPos _nearestSB; openMap false; onMapSingleClick {};}   
                              
										Else {Hint "No sleeping bags deployed at this location. Try again."; openMap false; onMapSingleClick {};};  
									};  
                     };  
		};
},       
{},                
[],                
1,                
0,                
false,               
false               
] remoteExec ["BIS_fnc_holdActionAdd",0,true];


//---------- Sleeping Bag Spawn Player Event Handlers ----------


[player, ["WeaponAssembled", {if ( typeOf (_this select 1) == "Respawn_Sleeping_bag_F") then {  
     
_name = [_this select 1] call BIS_fnc_objectVar; 
   
createMarker [_name, _this select 1];     
               
_name setMarkerType "respawn_inf";  
  
_name setMarkerColor "colorBLUFOR"; 
 
_VarNameSB  = call compile _name; 
 
_GridPos = mapGridPosition _VarNameSB; 
 
_name setMarkerText _GridPos; 
  
DeplyedSB pushBack _name;  
  
publicVariable "DeplyedSB";  
   
}}]] remoteExec ["addEventHandler", 0, true];
 
 
 
[player,  ["WeaponDisassembled", {if (TypeOf (_this select 1) in ["B_Respawn_Sleeping_bag_F"]) then {


_SortedSBMarkerArr = [DeplyedSB, [], {player distanceSqr getMarkerPos _x}, "ASCEND"] call BIS_fnc_sortBy;

_SortedSBMarkerArr params ["_nearestSBMarker"];

//systemChat Str (_SortedSBMarkerArr);

//systemChat Str (_nearestSBMarker);

deleteMarker _nearestSBMarker;

DeplyedSB = DeplyedSB - [_SortedSBMarkerArr Select 0]; 

publicVariable "DeplyedSB";
 
}}]] remoteExec ["addEventHandler", 0, true];

