void startMenu(){
  g.show();
  button.show();
}
void game(){
    currentRoom.drawRoom();
    drawObjects();
   drawDarkness();
   currentRoom.checkRoom();
   drawMap();
   drawPlayerCurrentStats();
}
void pause(){
  drawPauseMenu();
  drawPauseMenuButtons();
  pauseMenuButtonInteractions();
}
void end(){
  drawEndingScreen();
}
