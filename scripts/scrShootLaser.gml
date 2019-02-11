var skin = argument0;

if( !instance_exists( oLaserChargeController ) ) {
    var controller = instance_create( 0, 0, oLaserChargeController );
    controller.playerSkin = skin;
    controller.parent = object_index;
    controller.xOffset = 10;
    controller.yOffset = -2;
}
