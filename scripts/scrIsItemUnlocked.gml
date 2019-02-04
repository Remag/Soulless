var section = argument0;
var item = argument1;

var unlockId = section * 6 + item;
return oPlayerData.itemUnlocks[unlockId] == 0;
