# Dungeon Crawler RPG
Currently my largest Processing 4 project, this project summarizes all the skills I have acquired throughout my Processing 4 learning journey up to this point. It features over 21 files that handles the variety of features of this game such as the playable character, enemy types, collision between actors, fog of war, level up system, attrition system, GIF animations, movement vectors and more...

# Image-Based Procedural Level Generation

The initialization of the dungeon takes an m by n .png image as input and reads the colours of the image’s individual pixels to generate each “room” of the dungeon. 

Internally, the entire map of the dungeon is stored in a 2d array that stores a “Room” object. The Rooms array is the same dimensions as the .png image (Room[][] map = new Room[n][m]);

## How the procedural generation works:

The game uses nested loops to iterate through ever pixel of the image.
For each pixel at (i,j), where i<n and j<m, if the pixel isn’t white (#FFFFFF), the game initializes a new “Room” object at map[I][j]. In other words, if a pixel at (I,j) is white, then map[I][j] is null;

The program then considers the colour of the pixel to determine the amount and types of enemies that will be spawned in a particular room. For instance, if the image has a pixel that is coloured green (#06d771), then it will spawn a single stationary “tower” enemy. This specific green colour is defined and named “EasyDifficulty” in the game’s global variables. The only restriction to the .png image is that every non-coloured pixel should all be white, and the pixel at (1,1) should always be black (#000000) because it is where the player is always spawned in.

Here’s an example of a map that contains only “EasyDifficulty” rooms. The image is called “EasyMap.png” in the /data folder. It generates a series of rooms in a straight line. 

Notice how there are only entrances/exits to other rooms placed where there are adjacent coloured pixels in the .png map image. In the video above, the player starts in room (1,1) and that room only has a single entrance to room (2,1). Room (2,1) has an exit/entrance on the left and right side, which matches the locations where room (2,1) would actually have adjacent rooms. This feature is also non-manually implemented on a room by room basis. 

When generating a room, the game has to also consider which adjacent rooms the player can enter from the room that the player is currently in, and appropriately draw an entrance/exit to the next adjacent room at the correct locations (north, south, east and west entrance/exits).

To achieve this, the “Room” object just has to consider if the four adjacent indices in the Rooms array is null or not. If the player is currently in Room (i,j) or map[I][j], then the game checks if map[i-1][j], map[I+1][j], map[i][j+1], map[I][j-1] is null or not. If map[I+1][j] is not null for instance, then it means there is an adjacent room to the right of the current room and there should be an exit trigger at the right of the current room that sets the player’s location to map[I+1][j] when entered. 

The video demo below shows the room generation mechanic at work. 

There are three .png images that generate three different maps in the /data files. “EasyMap.png” generates a map of only easy levels, “MediumMap.png” generates both easy and medium difficulty levels, and “map.png” generates the hardest and largest map that the game is intended to be played with. 
