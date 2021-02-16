final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int SCREENX=1000;
final int SCREENY=1000;
final int PADDLEHEIGHT = 30;
final int PADDLEWIDTH = 100;
final int MARGIN = 100;
final int ALIEN_ALIVE = 0;
final int ALIEN_DEAD = 10;



class Alien {
float xpos;
float ypos;

int direction=0;
int counter=0;
int status=ALIEN_ALIVE;
float velo=1;
PImage alienImage;/* declare variables for alien position, direction of movement and appearance */
float angle1=0;
float angle=PI/360;
boolean hasBomb=false;
Bomb bomb;

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(float xpos, float ypos, PImage alienImage){
  this.xpos=xpos;
  this.ypos=ypos;
  this.alienImage=alienImage;/* set up the new alien object */ 
 }
  
 void move(){
   
   
   if(direction==A_FORWARD){
     xpos=xpos+velo;
     velo =velo+0.0001;
     ypos=ypos+sin(angle1*10);  
      angle1 += angle;
     if(xpos>=SCREENX-alienImage.width){
       direction=A_DOWN;
     }
   }
   if(direction==A_DOWN&&xpos>=SCREENX-alienImage.width){
     ypos++;
   
     counter++;
     if(counter>=25){
     direction=A_BACKWARD;
     counter=0;
     }
 
   }
   
   if(direction==A_DOWN&&xpos<=0+alienImage.width){
     //ypos=ypos+sin(siny)*4;
     //siny=siny+1;
     ypos++;
     counter++;
   if(counter>=25){
     direction=A_FORWARD;
     counter=0;
   }
     }
   
   
   if(direction==A_BACKWARD){
     xpos=xpos-velo;
     velo =velo+0.05;
     ypos=ypos+sin(angle1*10);  
      angle1 += angle;
    
     if(xpos<=0+alienImage.width){
       direction=A_DOWN;
     }
  /* Move the alien according to the instructions in the exercise */ 
 }
  
 }
 
 
  void draw(){
    if(status == ALIEN_ALIVE){
    image(alienImage,xpos,ypos);
  if(hasBomb==false&&(int)random(1000)>=990){//&&(int)random(1000)>=990
    bomb=new Bomb(xpos,ypos);
     
    hasBomb=true;
    
  }
}
     else if(status!=ALIEN_DEAD){
      image(explodedImage, xpos, ypos);
      status++;
    }   
    
  /* Draw the alien using the image() method demonstrated in class */
  }
  void die(){
     if(status==ALIEN_ALIVE){
    status++;  
    kills++;
     }
   }
}
