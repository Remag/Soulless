///scrGetKeybind(key)
///gets a string saying what the current keybind is
///argument0 - input key

var keyIn = argument0;

switch(keyIn)
{
    //special keys
    case vk_space: return "Space";
    case vk_shift: return "Shift";
    case vk_control: return "Ctrl";
    case vk_alt: return "Alt";
    case vk_enter: return "Enter";
    case vk_up: return "Up";
    case vk_down: return "Down";
    case vk_left: return "Left";
    case vk_right: return "Right";
    case vk_backspace: return "Back";
    case vk_tab: return "Tab";
    case vk_insert: return "Insert";
    case vk_delete: return "Delete";
    case vk_pageup: return "Pg U";
    case vk_pagedown: return "Pg D";
    case vk_home: return "Home";
    case vk_end: return "End";
    case vk_escape: return "Esc";
    case vk_printscreen: return "Prnt Scr";
    case vk_f1: return "F1";
    case vk_f2: return "F2";
    case vk_f3: return "F3";
    case vk_f4: return "F4";
    case vk_f5: return "F5";
    case vk_f6: return "F6";
    case vk_f7: return "F7";
    case vk_f8: return "F8";
    case vk_f9: return "F9";
    case vk_f10: return "F10";
    case vk_f11: return "F11";
    case vk_f12: return "F12";
    case vk_lshift: return "LShift";
    case vk_rshift: return "RShift";
    case vk_lcontrol: return "LCtrl";
    case vk_rcontrol: return "RCtrl";
    case vk_lalt: return "LAlt";
    case vk_ralt: return "RAlt";
    //numpad keys
    case 96: return "0";
    case 97: return "1";
    case 98: return "2";
    case 99: return "3";
    case 100: return "4";
    case 101: return "5";
    case 102: return "6";
    case 103: return "7";
    case 104: return "8";
    case 105: return "9";
    case 106: return "*";
    case 107: return "+";
    case 109: return "-";
    case 110: return ".";
    case 111: return "/";
    //misc keys
    case 186: return ";";
    case 187: return "=";
    case 188: return ",";
    case 189: return "-";
    case 190: return ".";
    case 191: return "/";
    case 192: return "`";
    case 219: return "[";
    case 220: return "\";
    case 221: return "]";
    case 222: return "'";
    //other characters
    default: return chr(keyIn);
}
