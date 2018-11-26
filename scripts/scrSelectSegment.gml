var segmentId = argument0;

currentSegment = segmentId;

var globalSegment = scrFindGlobalSegment( currentGate, currentSegment );
var segmentController = instance_create( 0, 0, oPracticeAvoidanceController );
segmentController.t = scrGetSegmentOffset( globalSegment );
var musicId = audio_play_sound( global.musAvoidance, 0, false );

audio_sound_gain( musicId, 0, 0 );
audio_sound_gain( musicId, 0.3, 500 );
segmentController.practiceMusicId = musicId;
