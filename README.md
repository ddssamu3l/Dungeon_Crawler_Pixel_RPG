# Dungeon Crawler RPG
Currently my largest Processing 4 project, this project summarizes all the skills I have acquired throughout my Processing 4 learning journey up to this point. It features over 21 files that handles the variety of features of this game such as the playable character, enemy types, collision between actors, fog of war, level up system, attrition system, GIF animations, movement vectors and more...

![Screenshot (62)](https://github.com/ddssamu3l/Dungeon_Crawler_Pixel_RPG/assets/72890797/b17e0165-7a17-4702-a3b7-bec02277df72)

# Image-Based Procedural Level Generation

The highlight of this project is the image-based procedural level generation that generates the game's map based off of the colors of the pixels of a .png image, which can offer tens of thousands of possible maps with no extra coding.

The inspiration for this feature came from coding the level data in a much earlier version of the game. Initially, this project was only intended to have a single map implemented by hard-coding each room since the level wasn't planned to be very big and manual initialization offered customizability to each individual room. However, when actually proceeding with this approach, length of repetitive code quickly became apparent that the hard-coding approach is going to be too dreadful to implement and offered no flexibility for change if the level design/layout was ever to be changed. 

After some brain-storming and GoodNotes sketches, I realized the level deisgns I've created are all arranged in a grid-shaped arrangement where each room have adjacent rooms in the North, South, East and West direction. I noticed that I can represent my level maps through pixels of an image. A white dot can mean empty space, and a black dot can represent a room where the play can traverse through. 


## How the procedural generation works:

The program reads the pixels of a .png image stored in the /data folder and uses the colors of the pixels as data to generate a map. Here’s an example of a .png image being used to generate a map. The image is called “EasyMap.png” in the /data folder. It generates a series of "Easy" difficulty rooms in a straight line. 

**Note that the image shown here is not the actual "EasyMap.png" folder that is stored in the /data folder as the true "EasyMap.png" is only a 10x10 image which is too small to be displayed**

<img src= "https://github.com/ddssamu3l/Dungeon_Crawler_Pixel_RPG/assets/72890797/3cfb590e-b28e-4a60-a614-67a4d835595a" width="200" />

Internally, the entire map of the dungeon is stored in a 2d array that stores a “Room” object.

The game uses nested loops to iterate through every pixel of the image.
For each pixel at (i,j), where i<n and j<m, if the pixel isn’t white (#FFFFFF), the game initializes a new “Room” object at map[I][j]. In other words, if a pixel at (I,j) is white, then map[I][j] is null;

The program then considers the colour of the pixel to determine the amount and types of enemies that will be spawned in a particular room. For instance, if the image has a pixel that is coloured green (#67d771), then it will spawn a single stationary “tower” enemy. This specific green colour is defined and named “EasyDifficulty” in the game’s global variables. The only restriction to the .png image is that every non-coloured pixel should all be white, and the pixel at (1,1) should always be black (#000000) because it is where the player is always spawned in.

Here's the demo of the 1x4 map that is generated off of "EasyMap.png"

https://github.com/ddssamu3l/Dungeon_Crawler_Pixel_RPG/assets/72890797/1cbfa8b6-8be6-4e8c-aaf1-422bd4fa653c


Notice how there are only entrances/exits to other rooms placed where there are adjacent coloured pixels in the .png map image. In the video above, the player starts in room (1,1) and that room only has a single entrance to room (2,1). Room (2,1) has an exit/entrance on the left and right side, which matches the locations where room (2,1) would actually have adjacent rooms. This feature is also non-manually implemented on a room by room basis. 

## How to know where neighbor rooms exist and create a portal that takes the player to the next room:

When generating a room, the game has to also consider which adjacent rooms the player can enter from the room that the player is currently in, and appropriately draw an entrance/exit to the next adjacent room at the correct locations (north, south, east and west entrance/exits).

To achieve this, the “Room” object just has to consider if the four adjacent indices in the Rooms array is null or not. If the player is currently in Room (i,j) or map[I][j], then the game checks if map[i-1][j], map[I+1][j], map[i][j+1], map[I][j-1] is null or not. If map[I+1][j] is not null for instance, then it means there is an adjacent room to the right of the current room and there should be an exit trigger at the right of the current room that sets the player’s location to map[I+1][j] when entered. 

This code checks whether an exit should be placed in each direction of the current room. It can be found in "room.pde"

![rpgProjectCheckExitCode](https://github.com/ddssamu3l/Dungeon_Crawler_Pixel_RPG/assets/72890797/81c0614f-6d87-416d-b54d-56364f92749e)
