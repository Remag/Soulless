var color1 = argument0;
var color2 = argument1;


with( objGate4EdgeBlock ) {
    self.targetColor = merge_colour( color1, color2, x / 800 );
}
with( objGate4CornerBlock ) {
    self.targetColor = merge_colour( color1, color2, x / 800 );
}
