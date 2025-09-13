/*
 * Author: DartRuffian
 * Script that adds an action to an object to teleport them to a position.
 *
 * Change _target to the name of the object to teleport players to.
 * The `2` and `1` values for the waitAndExecute functions is the delay in seconds.
 *
 * Can be placed into an object's init box in Eden. Copy everything below the `*/`
 */

this addAction ["Open Door", {
    params ["_door", "_caller"];

    private _target = door1_exit;

    titleText [nil, "BLACK OUT"];
    playSound3D ["\ls\core\addons\sounds\props\door_open.wss", _door];
    [{
        params ["_door", "_caller", "_target"];
        _caller setDir (getDir _target);
        _caller setPosASL (getPosASL _target);

        [{
            playSound3D ["\ls\core\addons\sounds\props\door_close.wss", _this];
            titleText [nil, "BLACK IN"];
        }, _target, 1] call CBA_fnc_waitAndExecute;
    }, [_door, _caller, _target], 2] call CBA_fnc_waitAndExecute;
}, nil, 0, true, true, "", "true", 5];
