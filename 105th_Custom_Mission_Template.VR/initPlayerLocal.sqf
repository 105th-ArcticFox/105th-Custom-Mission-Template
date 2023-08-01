params ["_player", "_isJIP"];

waitUntil {!isnull _player && isPlayer _player};

//---------- 105th Standard Template Options ----------
_enableSelfRadioGetOption = true;

_enableViewDistance = true;

_enableDynamicGroups = true;

_enableTeleportToSL = true;

_camoFacePaint = false;

//---------- 105th Standard Template Code ----------

//---------- Unit BFT Settings ----------

if ("BlueForceTracker" call BIS_fnc_getParamValue isEqualTo 0) then {_player setVariable ["ace_map_hideBlueForceMarker", true, true];};

if ("BlueForceTracker" call BIS_fnc_getParamValue isEqualTo 1) then {ace_map_BFT_Show_playerNames = false;};

//Dead _player Body Removal

_player addEventHandler 
    [ 
        "Respawn", 
        { 
            params ["_unit", "_corpse"];
 
            _null = [_unit, _corpse] spawn 
											{ 
												params ["_unit", "_corpse"];
												
												waitUntil {sleep 0.33; alive _unit}; 
												
												deleteVehicle _corpse;
											} 
					 
        } 
    ];


//View Distance Action
CHVD_maxView = 2000; // Set maximum view distance (default: 12000)
CHVD_maxObj = 2000; // Set maximum object view distance (default: 12000)

//Init Mission Briefing
_null = [] call SOC_fnc_briefing;

//TS & TFAR Connection Status and Messaging
_is_connected_to_105th_TS = "105th SOC" find (_player call TFAR_fnc_getTeamSpeakServerName);

_mssg = "";

if (_is_connected_to_105th_TS isEqualTo 0) 
	
	then {_mssg = format ["%1 is connected to the 105th SOC TeamSpeak", profileName];}
	
	Else {
			_mssg = format ["%1 is NOT connected to the 105th SOC TeamSpeak or %1's TFAR TeamSpeak plugin is DISABLED", profileName];
			waitUntil {Sleep 0.33; alive _player};
			titleText ["<t size='1.33' shadow='2'>Please join us on TeamSpeak at 38.133.154.60:9992 or verify your TFAR TeamSpeak plugin is enabled.</t>", "PLAIN DOWN",6, TRUE, TRUE];
		 };

_mssg remoteExec ["systemChat", 0, false];

//Increase ACE object carrying values
ACE_maxWeightCarry  = 5000;
ACE_maxWeightDrag  = 5000;

//Wait Until _player Is Boots On Ground
waitUntil {alive _player};

//ACE self interaction items

//create radio sub-menu under equipment and add Get TFR self action

if (_enableSelfRadioGetOption) then {

	_DVRadioActions = ["DV_radioMenu", "105th Radios", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
	[_player, 1, ["ACE_SelfActions", "ACE_Equipment"], _DVRadioActions] call ace_interact_menu_fnc_addActionToObject;
	_action = ["DV_getRadioSelfAction", "Get SR", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa", {_null = [_player] spawn SOC_fnc_getShortRadio;}, {true}] call ace_interact_menu_fnc_createAction;
	[_player, 1, ["ACE_SelfActions", "ACE_Equipment", "DV_radioMenu"], _action] call ace_interact_menu_fnc_addActionToObject;
};

//View Distance Action
if (_enableViewDistance) then {
	_action3 = ["tg_chvd", "View Distance", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\scout_ca.paa", {chvd = [] spawn CHVD_fnc_openDialog;}, {true}] call ace_interact_menu_fnc_createAction;
	[_player, 1, ["ACE_SelfActions"], _action3] call ace_interact_menu_fnc_addActionToObject;
};

//Dynamic Groups
if (_enableDynamicGroups) 
	then {
			["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
			[player, ""] call BIS_fnc_setUnitInsignia;
		 };

//Teleport To Squad Leader
if (_enableTeleportToSL) then {_null = [] spawn SOC_fnc_teleportToSL;};

//---------- Camo Faces ----------
if (_camoFacePaint) then {_null = [_player] spawn SOC_fnc_camoFace};
