///irandomNoRepeat(from,to,banned values...)
///argument0 - range from
///argument1 - range to
///argument2 - banned value 1
///argument3 - banned value 2

var value = irandom_range( argument0, argument1 );
while( value == argument2 || value == argument3 ) {
    value = irandom_range( argument0, argument1 );
}
return value;
