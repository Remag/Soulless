///gets which song is supposed to be playing for the current room and plays it

var roomSong;

switch (room)                       //determines which song to play
{
    case rTitle:                    //add rooms here, if you have several rooms that play the same song they can be put together
        roomSong = -1;
        break;
    case rMenu:
    case rOptions:
        roomSong = oMusicContainer.menuMusic;
        break;                      //make sure to always put a break after setting the song
    case rAvoidanceMainRoom:
    case rPracticeActiveRoom:
        roomSong = oMusicContainer.avoidanceMusic;
        break;
    default:                        //default option in case the room does not have a song set
        roomSong = -1;
        break;
}

if (roomSong != -2)
    scrPlayMusic(roomSong,true); //play the song for the current room
