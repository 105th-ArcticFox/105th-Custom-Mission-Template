/*
	Author: |105th| ArcticFox

	Description:
		 Assigns player new short range radio.

	Parameter(s):
		0: OBJECT - Player to receive new radio.
		1: STRING - Radio classname to be assigned.
	Returns:
		NOTHING

	Example:
		[_player, "TFAR_anprc152"] call SOC_fnc_getShortRadio;
*/

params [
			["_player", player, [objNull]],
			["_srRadio", "TFAR_anprc152", [""]]
	   ];

_player linkItem _srRadio;

systemChat format ["You have been assigned a: %1", _srRadio];