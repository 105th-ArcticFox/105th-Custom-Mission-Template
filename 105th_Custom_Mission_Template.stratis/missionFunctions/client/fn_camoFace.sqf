/*
	Author: |105th| ArcticFox

	Description:
		 Converts players face to camo face paint variant or applies a random camo face if camo face variant is not available.

	Parameter(s):
		0: OBJECT - Player to have face painted.
		
	Returns:
		NOTHING

	Example:
		[_player] call SOC_fnc_camoFace;
*/

params [["_player", player, [objNull]]]; 

_newFace = call {
					if (face _player in ["WhiteHead_22_a","WhiteHead_22_l","WhiteHead_22_sa"]) exitWith {face _player};
					if (face _player in ["GreekHead_A3_10_a","GreekHead_A3_10_l","GreekHead_A3_10_sa"]) exitWith {face _player};
					if (face _player in ["PersianHead_A3_04_a","PersianHead_A3_04_l","PersianHead_A3_04_sa"]) exitWith {face _player};
					
					if (face _player isEqualTo "WhiteHead_01") exitWith {"CamoHead_White_01_F"};
					if (face _player isEqualTo "WhiteHead_02") exitWith {"CamoHead_White_02_F"};
					if (face _player isEqualTo "WhiteHead_03") exitWith {"CamoHead_White_03_F"};
					if (face _player isEqualTo "WhiteHead_04") exitWith {"CamoHead_White_04_F"};
					if (face _player isEqualTo "WhiteHead_05") exitWith {"CamoHead_White_05_F"};
					if (face _player isEqualTo "WhiteHead_06") exitWith {"CamoHead_White_06_F"};
					if (face _player isEqualTo "WhiteHead_07") exitWith {"CamoHead_White_07_F"};
					if (face _player isEqualTo "WhiteHead_08") exitWith {"CamoHead_White_08_F"};
					if (face _player isEqualTo "WhiteHead_09") exitWith {"CamoHead_White_09_F"};
					if (face _player isEqualTo "WhiteHead_10") exitWith {"CamoHead_White_10_F"};
					if (face _player isEqualTo "WhiteHead_11") exitWith {"CamoHead_White_11_F"};
					if (face _player isEqualTo "WhiteHead_12") exitWith {"CamoHead_White_12_F"};
					if (face _player isEqualTo "WhiteHead_13") exitWith {"CamoHead_White_13_F"};
					if (face _player isEqualTo "WhiteHead_14") exitWith {"CamoHead_White_15_F"};
					if (face _player isEqualTo "WhiteHead_15") exitWith {"CamoHead_White_16_F"};
					if (face _player isEqualTo "WhiteHead_16") exitWith {"CamoHead_White_17_F"};
					if (face _player isEqualTo "WhiteHead_17") exitWith {"CamoHead_White_18_F"};
					if (face _player isEqualTo "WhiteHead_18") exitWith {"CamoHead_White_19_F"};
					if (face _player isEqualTo "WhiteHead_19") exitWith {"CamoHead_White_20_F"};
					if (face _player isEqualTo "WhiteHead_20") exitWith {"CamoHead_White_21_F"};

					if (face _player isEqualTo "AfricanHead_01") exitWith {"CamoHead_African_01_F"};
					if (face _player isEqualTo "AfricanHead_02") exitWith {"CamoHead_African_02_F"};
					if (face _player isEqualTo "AfricanHead_03") exitWith {"CamoHead_African_03_F"};
					
					if (face _player isEqualTo "GreekHead_A3_01") exitWith {"CamoHead_Greek_01_F"};
					if (face _player isEqualTo "GreekHead_A3_02") exitWith {"CamoHead_Greek_02_F"};
					if (face _player isEqualTo "GreekHead_A3_03") exitWith {"CamoHead_Greek_03_F"};
					if (face _player isEqualTo "GreekHead_A3_04") exitWith {"CamoHead_Greek_04_F"};
					if (face _player isEqualTo "GreekHead_A3_05") exitWith {"CamoHead_Greek_05_F"};
					if (face _player isEqualTo "GreekHead_A3_06") exitWith {"CamoHead_Greek_06_F"};
					if (face _player isEqualTo "GreekHead_A3_07") exitWith {"CamoHead_Greek_07_F"};
					if (face _player isEqualTo "GreekHead_A3_08") exitWith {"CamoHead_Greek_08_F"};
					if (face _player isEqualTo "GreekHead_A3_09") exitWith {"CamoHead_Greek_09_F"};
					
					if (face _player isEqualTo "AsianHead_A3_01") exitWith {"CamoHead_Asian_01_F"};
					if (face _player isEqualTo "AsianHead_A3_02") exitWith {"CamoHead_Asian_02_F"};
					if (face _player isEqualTo "AsianHead_A3_03") exitWith {"CamoHead_Asian_03_F"};
					
					if (face _player isEqualTo "PersianHead_A3_01") exitWith {"CamoHead_Persian_01_F"};
					if (face _player isEqualTo "PersianHead_A3_02") exitWith {"CamoHead_Persian_02_F"};
					if (face _player isEqualTo "PersianHead_A3_03") exitWith {"CamoHead_Persian_03_F"};
			
					selectRandom ["CamoHead_White_01_F", "CamoHead_White_02_F", "CamoHead_White_03_F", "CamoHead_White_04_F", "CamoHead_White_05_F", "CamoHead_White_06_F", "CamoHead_White_07_F", "CamoHead_White_08_F", "CamoHead_White_09_F", "CamoHead_White_10_F", "CamoHead_White_11_F", "CamoHead_White_12_F", "CamoHead_White_13_F", "CamoHead_White_14_F", "CamoHead_White_15_F", "CamoHead_White_16_F", "CamoHead_White_17_F", "CamoHead_White_18_F", "CamoHead_White_19_F", "CamoHead_White_20_F", "CamoHead_White_21_F"];
				};

[_player, _newFace] remoteExec ["setFace", 0, _player];