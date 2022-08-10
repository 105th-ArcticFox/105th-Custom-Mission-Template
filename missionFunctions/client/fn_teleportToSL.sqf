//********************************************************************************
//Enable compact version of notification to players upon joining the server.    **
enableCompactNotifications = false;
//********************************************************************************
hint "JIP! SCROLL WHEEL and hold SPACE to teleport to your group leader! Press U for group management. 5 min limit.";
cutText ["","BLACK OUT"];
cutText ["JIP! SCROLL WHEEL and hold SPACE to teleport to your group leader! Press U for group management. 5 min limit.","PLAIN",2];
JIPTOSLNOTUSED = true;
teleportActionID = [
    player,
    "Teleport to your group Leader",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff2_ca.paa",
    "true",
    "true",
    {
        private ["_leader"];
        _leader = leader player;
        if (_leader == player) then
        {
            hint "You are trying to teleport to yourself! Press U for group management.";
            cutText ["","BLACK OUT"];
            cutText ["You are trying to teleport to yourself! Press U for group management.","PLAIN",2];
        };
    },
    {},
    {
        private ["_leader","_LX","_LY","_LZ"];
        _leader = leader player;

        //If leader's vehicle is the leader himself, move player 3m behind him
        if (vehicle _leader == _leader) then
        {
            //Getting the coords
            _LX = (getpos _leader select 0) + (3*sin ((getDir _leader) -180));
            _LY = (getpos _leader select 1) + (3*cos ((getDir _leader) -180));
            _LZ = (getpos _leader select 2);
            player setpos [_LX,_LY,_LZ];
            [player, teleportActionID] call BIS_fnc_holdActionRemove;

            hint "Teleported nearby the leader.";
            cutText ["","BLACK OUT"];
            cutText ["Teleported nearby the leader.","PLAIN",2];
            JIPTOSLNOTUSED = false;
        }
        //If leader is inside vehicle, move player into vehicle cargo
        else
        {
            /*Checking if there is room in the vehicle, gives hint if there is none
            if there is room, player is moved into cargo of leader's vehicle*/
            if ((vehicle _leader) emptyPositions "cargo"==0) then
            {
                hint "No room in squad leader's vehicle.";
                cutText ["","BLACK OUT"];
                cutText ["No room in squad leader's vehicle.","PLAIN",2];
            }
            else
            {
                player moveincargo vehicle _leader;
                [player, teleportActionID] call BIS_fnc_holdActionRemove;

                hint "Teleported into the leader's vehicle.";
                cutText ["","BLACK OUT"];
                cutText ["Teleported into the leader's vehicle.","PLAIN",2];
                JIPTOSLNOTUSED = false;
            };
        };
    },
    {
        hint "Teleport aborted.";
        cutText ["","BLACK OUT"];
        cutText ["Teleport aborted.","PLAIN",2];
    },
    [],
    10,
    -99, //very low priority
    false, //do not remove on completion if there is no room in vic of leader.
    false
] call BIS_fnc_holdActionAdd;

sleep 120;//120
if(JIPTOSLNOTUSED) then {systemChat "3 min until the teleport to SL option disappears";};
sleep 120;//120
if(JIPTOSLNOTUSED) then {systemChat "1 min until the teleport to SL option disappears";};
sleep 40;//40
if(JIPTOSLNOTUSED) then {systemChat "20 sec until the teleport to SL option disappears";};
sleep 20;
[player, teleportActionID] call BIS_fnc_holdActionRemove;
if(JIPTOSLNOTUSED) then {systemChat "Teleport to SL option no longer available";};