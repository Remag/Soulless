///scrA50Spawn(variant,framesToTarget,modifier,color)
///argument0 - attack variant
///argument1 - framesToTarget
///argument2 - distance modifier
///argument3 - image blend

var variant = argument0;
var framesToTarget = argument1;
var modifier = argument2;
var color = argument3;

if( modifier < 1 && variant == 0 ) {
    modifier /= 2;
}
switch( variant ) {
    case 0: {
        scrTargetLine( framesToTarget, modifier, color, objAlgA50Sphere );
        break;
    }
    case 1: {
        scrTargetCircle( 0, 0, framesToTarget, modifier, color, objAlgA50Sphere );
        break;
    }
    case 2: {
        scrTargetCircle( 800, 0, framesToTarget, modifier, color, objAlgA50Sphere );
        break;
    }
    case 3: {
        scrTargetCircle( 0, 608, framesToTarget, modifier, color, objAlgA50Sphere );
        break;
    }
    case 4: {
        scrTargetCircle( 800, 608, framesToTarget, modifier, color, objAlgA50Sphere );
        break;
    }
}
