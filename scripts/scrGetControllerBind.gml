///scrGetControllerBind(buttonIndex)
///gets a string representation of the button for a controller
///argument0 - button constant (i.e. gp_face1, gp_start)

var buttonIn = argument0;

switch (buttonIn)
{
    case gp_face1: return "A"; break;
    case gp_face2: return "B"; break;
    case gp_face3: return "X"; break;
    case gp_face4: return "Y"; break;
    case gp_shoulderl: return "LBumper"; break;
    case gp_shoulderlb: return "LTrigger"; break;
    case gp_shoulderr: return "RBumper"; break;
    case gp_shoulderrb: return "RTrigger"; break;
    case gp_select: return "Select"; break;
    case gp_start: return "Start"; break;
    case gp_stickl: return "LStick"; break;
    case gp_stickr: return "RStick"; break;
    case gp_padu: return "D-Pad U"; break;
    case gp_padd: return "D-Pad D"; break;
    case gp_padl: return "D-Pad L"; break;
    case gp_padr: return "D-Pad R"; break;
    default: return "Unknown"; break;
}
