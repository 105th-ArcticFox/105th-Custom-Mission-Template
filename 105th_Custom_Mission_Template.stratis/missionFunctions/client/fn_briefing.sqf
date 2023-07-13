//note the order in which you list things is upside down as to how it will show in the briefing on the map screen



//Mission OPORD
player createDiaryRecord["Diary", ["MISSION NOTES","
- AI HEARING HAS BEEN TURNED ON! Consider noise discipline when trying to move concealed in the AO.<br/><br/>
- Once the squad departs the ORP the group leader can end the mission via a hold action once back at the ORP.<br/><br/>
- If a mission start time of 3:00 was selected a radio trigger is available to advance time to 6:15 in order to allow for a night infiltration and daytime morning assault. To access the radio trigger select BACKSPACE - 0 Reply - 0 Radio - action the trigger to advance time to 6:15 when desired.
"]];

player createDiaryRecord["Diary", ["REVIVE AND RESPAWN","
REVIVE<br/><br/>
- All personnel are equipped with individual first aid equipment. The Medic, Squad Leader, and Team Leaders can administer blood bag IVs.<br/><br/>
RESPAWN<br/><br/>
- All players will respawn at OPR-BLUE.<br/>
- If all players are KIA the mission will fail.
"]];

player createDiaryRecord["Diary", ["COMMAND AND CONTROL","
COMMAND<br/><br/>
Succession of Command: As briefed by SL<br/>
Callsigns: Squad CHARLIE 2-2, Platoon CHARLIE 2-6<br/>
Radio Frequencies: Squad Freq 100, Platoon Freq 106<br/>
Radio protocol: Strict<br/><br/>
SIGNAL<br/><br/>
Codewords: Departing ORP = TULLAMORE DEW, Break Contact = WHIPLASH, Beginning Assault = JAMESON, OBJ Secure = BUSHMILLS<br/>
Double Passwords: Balls/Deep<br/>
Running Password: Johnnie Walker
"]];

player createDiaryRecord["Diary", ["SUSTAINMENT","
LOGISTICS<br/><br/>
Class II:<br/>
- AN/PVS-15 NVG as required by mission start time<br/>
- IR Strobe or chemlight required by mission start time<br/><br/>
Class V:<br/>
- 10x 5.56mm STNAG per M4A1 equipped soldier<br/>
- 4x 5.56mm linked 200rnd belts per M249 autorifleman<br/>
- 10x M441 HE 40mm GL per M320 UGL<br/>
- 2x M67 per soldier<br/>
- 2x AN-M8 HC per soldier<br/>
- 2x Yellow Smoke<br/>
- 2x Blue Smoke<br/>
- 2x M112 demo change<br/>
- 2x breeching change<br/>
- 2x M152 firing device<br/><br/>
Class VIII:<br/>
- 15 bandages per soldier<br/>
- 2x splints per soldier<br/>
- 2x tourniquet per soldier<br/>
- 2x Morphine auto-injector per soldier<br/>
- 1x CLS bag carried by medic<br/><br/>
Additional ammunition and equipment is located in a support box at ORP-BLUE and may be distributed at the squad leaders discretion.<br/><br/>
 "]];

player createDiaryRecord["Diary", ["EXECUTION","
Commander's Intent: Destroy TLA forces operating out of the camp and eliminate their ability to sustain operations in the area.<br/><br/>
          End State:<br/>
          All enemy forces at OBJ-Red are killed or captured<br/>
          Enemy weapons cache is located and destroyed<br/>
          All buildings, enemy KIA, and EPWs searched for intel<br/><br/>
Concept of Operations:<br/>
Phase 1: Move from ORP-BLUE to the BoF and Assault positions as designated by the SL for OBJ-RED<br/>
Phase 2: Assault and clear OBJ-RED<br/>
Phase 3: Conduct a sweep of the OBJ for EPWs, an enemy weapons cache, and any intel<br/>
Phase 4: Withdrawal back to ORP-BLUE<br/>
NOTE: Additional details to be added by SL<br/><br/>
Scheme of Movement and Maneuver: As briefed by SL<br/><br/>
Mission Subordinate Units: As briefed by SL<br/><br/>
Coordinating Instructions:<br/>
- OPORD effective immediately<br/>
- Weapons Condition: YELLOW<br/>
- ROE: approved to engage all armed individuals in the AO<br/>
- Fire Support: not available<br/> 
- FFIR: enemy contact or sighting (location, size of element), ACE after consolidation, captured EPWs<br/>
- Reduced visibly in jungle environment PID all targets prior to engaging<br/>
- Additional Coordinating Instructions to be added by SL
"]];

player createDiaryRecord["Diary", ["MISSION","
CHARLIE 2-2 will conduct a raid on OBJ-RED NLT 30 minutes from receipt of this OPORD with the intent to destroy enemy forces on the OBJ and destroy their weapons cache, in order to deny TLA forces the ability to sustain operations in the area.
"]];

player createDiaryRecord["Diary", ["SITUATION","
Area of Operation: North of gridline 074, South of gridline 079, East of gridline 109, West of gridline 115.<br/><br/>
Terrain: The AO is centered around a hill with a ridge line running north-south throughout the AO. The AO is primarily covered in dense jungle. There are three identified trails in AO moving East, North and West out of the objective. Additionally, a secondary road runs North to south along the eastern boundary of the objective.<br/><br/>
Enemy Forces: A reconnaissance patrol has identified a Tanoa Liberation Army (TLA) camp in the jungle north of Kotomo. This camp is believed to be used to stockpile weapons and explosives for insurgent forces in the area. The camp's strength has been estimated between 15 and 20 TLA fighters. 2-4 man patrols have been observed patrolling up to 150m from the camp. Enemy forces in the AO have been observed utilizing soviet bloc type small arms (AKM, RPK, PKM, etc.). TLA forces are known to not have night vision capability. No other enemy forces are known to be operating in the AO.<br/><br/>
No civilians are expected in the AO.<br/><br/>
Attachments: 1x Platoon Medic
"]];

player createDiaryRecord["Diary", ["ORIENTATION","
Current Location: ORP-BLUE (Grid 1092 0753)<br/><br/>
Objective: OBJ-RED (Grid 1134 0761)
"]];



//Pre-Combat Checklist
PLAYER createDiarySubject ["Pre-Combat Checklist", "Pre-Combat Checklist"];

player createDiaryRecord["Pre-Combat Checklist", ["Pre-Combat Checklist", "Designate Succession of Command<br/><br/>Assign Buddy Teams<br/><br/>Designate Primary and Secondary Medics<br/><br/>Explain Casualty Action Plan<br/><br/>Designate Primary and Secondary Comms Channels<br/><br/>Brief Insertion and Exfil Plans<br/><br/>Brief Fire Support Plan<br/><br/>Brief Primary and Secondary Mission Objectives<br/><br/>Review Special Instructions<br/><br/>Review Actions on Contact<br/><br/>Assign Order of Movement<br/><br/>Brief ROE"]];



//105th SOC INFO
PLAYER createDiarySubject ["105th SOC Info", "105th SOC Info"];

player createDiaryRecord["105th SOC Info", ["105th TeamSpeak and Discord Info","
TeamSpeak Address: 38.133.154.60:9992<br/><br/> 
Discord Link: discord.io/105thSOC"]];

player createDiaryRecord["105th SOC Info", ["105th Server Rules","
105th SOC ArmA 3 Server Rules<br/><br/>
1.  This is a TEAMWORK server<br/><br/>
2.  ABSOLUTELY NO TEAM KILLING!<br/><br/>
3.  Follow your leader and the chain of command. DON’T LONEWOLF<br/><br/>
4.  Communicate. TFAR is required to Squad lead / use Air Assets<br/><br/>
5.  Wear the same camo pattern as other players<br/><br/>
6.  Play your role. We don't need a ghillie suit lmg rocket rifleman... EVER<br/><br/> 
7.  Don't kill Civilians, VIPs, or HVTs meant for extract<br/><br/>
8.  Don't abuse mission assets<br/><br/>
9.  Don't take vehicles from base without asking leaders/admins<br/><br/>
10. Don't discharge your weapons inside the base perimeter
"]];

player createDiaryRecord["105th SOC Info", ["105th SOP","
The 105th Special Operations Capable unit is a special force comprised of members with widely varying specialties. Currently the 105th is engaged in endeavors to suppress insurgency and terrorism in remote and disparate corners of the globe. We operate on the ground, from sea, and the air in offensive measures to destroy the enemy. Common missions for this unit are disruptions of enemy chain of command, intelligence gathering, reconnaissance,  airborne landings, forward assaults, foot/vehicle patrols, and other general purpose combat missions.<br/><br/>

Teamwork and communication are critical in this unit. You will never have to salute an officer, you will hold no rank, you will obligate no time. However, you're welcome to stay if you can follow the leader without hesitation and respect the rules of the unit."]];