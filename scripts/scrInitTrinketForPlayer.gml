var trinketObj = oPlayerData.currentTrinket.trinketObject;
if( trinketObj != -1 ) {
    var obj = instance_create( x, y, trinketObj );
    obj.parent = id;
}
