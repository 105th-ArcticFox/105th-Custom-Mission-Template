waitUntil {!isNull player && isPlayer player};

//---------- 105th Standard Template Options ----------
_enableSelfRadioGetOption = true;

_enableViewDistance = true;

_enableTeleportToSL = true;

_enableDynamicGroups = false;

//---------- 105th Standard Template Code ----------
#include "MissionScripts\Parameters.sqf";

// Unit BFT Settings ----------
if (BlueForceTracker == 0) then {player setVariable ["ace_map_hideBlueForceMarker", true, true];};

if (BlueForceTracker == 1) then {ace_map_BFT_ShowPlayerNames = false;};

// Dead Player Body Removal
player addEventHandler 
    [ 
        "Killed", 
        { 
            _body = _this select 0; 
 
            [_body] spawn 
            { 
                waitUntil { alive player }; 
                _body = _this select 0; 
                deleteVehicle _body; 
            } 
        } 
    ];

player addEventHandler 
    [ 
        "Respawn", 
        { 
            _body = _this select 0; 
 
            [_body] spawn 
            { 
                waitUntil { alive player }; 
                _body = _this select 0; 
                deleteVehicle _body; 
            } 
 
        } 
    ];

// Init Mission Briefing
[] execVM "missionScripts\briefing.sqf";


// TS & TFAR Connection Status and Messaging
_is_connected_to_105th_TS = "105th SOC" find (player call TFAR_fnc_getTeamSpeakServerName);

_mssg = "";

if (_is_connected_to_105th_TS == 0) 
	
	then {_mssg = format ["%1 is connected to the 105th SOC TeamSpeak", profileName];}
	
	Else {
			_mssg = format ["%1 is NOT connected to the 105th SOC TeamSpeak or %1's TFAR TeamSpeak plugin is DISABLED", profileName];
			waitUntil {Sleep 0.33; alive player};
			titleText ["<t size='1.33' shadow='2'>Please join us on TeamSpeak at 38.133.154.60:9992 or verify your TFAR TeamSpeak plugin is enabled.</t>", "PLAIN DOWN",6, TRUE, TRUE];
		 };

_mssg remoteExec ["systemChat", 0, false];


// Wait Until Player Is Boots On Ground
waitUntil {Sleep 1; alive player};

// ACE self interaction items

// create radio sub-menu under equipment and add Get TFR self action

if (_enableSelfRadioGetOption) then {

	_RadioActions = ["radioMenu", "105th Radios", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _RadioActions] call ace_interact_menu_fnc_addActionToObject;
	_action = ["getRadioSelfAction", "Get SR", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa", {[player, player] spawn SOC_fnc_getShortRadio;}, {true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "ACE_Equipment", "radioMenu"], _action] call ace_interact_menu_fnc_addActionToObject;
};



// View Distance Action
if (_enableViewDistance) then {
	_action3 = ["tg_chvd", "View Distance", "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\scout_ca.paa", {chvd = [] spawn CHVD_fnc_openDialog;}, {true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action3] call ace_interact_menu_fnc_addActionToObject;
};

// Teleport To Squad Leader
if (_enableTeleportToSL) then {[] spawn SOC_fnc_teleportToSL;};


// Initialize Dynamic Groups
if (_enableDynamicGroups) then {
	["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
	[player, ""] call BIS_fnc_setUnitInsignia;
};
