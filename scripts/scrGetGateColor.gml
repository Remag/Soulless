var gate = argument0;

switch( gate ) {
    case 1:
        return c_red;
    case 2:
        return c_yellow;
    case 3:
        return make_color_rgb( 0, 255, 255 );
    case 4:
        return c_green;
    case 5:
        return c_purple;
    default:
        return c_white;
}
