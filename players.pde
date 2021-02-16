class Player {
float xpos; float ypos;
//color paddlecolor = color(50);
int life=3;
PImage planeImage;

Player(int screen_y)
{
xpos=SCREENX/2;
ypos=screen_y;
planeImage=loadImage("pi.jpg");

}
void move(float x){
if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-planeImage.width;
else xpos=x;
}
void draw()
{
//fill(paddlecolor);
//rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
image(planeImage,xpos,ypos);
}


}

    
  
    
