/* Declare an array of Aliens */
PImage alienImage;
PImage explodedImage;
PImage backgroundImage;
PImage planeImage;
Player thePlayer;
Bullet bullet;
Bomb bomb;
float x;
float y;
float r;
int count;
int index;
int count1;
int count2;
Alien A;
Alien Aliens[];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Bomb> bombs=new ArrayList<Bomb>();
ArrayList<Bullet>blockedBullets=new ArrayList<Bullet>();
boolean isExplode=false;
boolean isMoving=false;
boolean isShoot=false;
boolean powerUp=false;
boolean exploded=false;
boolean changeShape=false;
float by;
float bx;
boolean isDie=false;
PFont myFont;
int kills;
Barrier barrier1;
Barrier barrier2;
Barrier barrier3;
Barrier barrier4;

void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
backgroundImage=loadImage("bd.jpg");
  background(255);
   thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);

   
    bullet = new Bullet(thePlayer);
    barrier1=new Barrier(0,SCREENY-300);
    barrier2=new Barrier(SCREENX-300,SCREENY-300);
    barrier3= new Barrier(SCREENX-PADDLEWIDTH,SCREENY-300);
    barrier4= new Barrier(300,SCREENY-300);
    
  ellipseMode(RADIUS);
  alienImage=loadImage("spacer.gif");
 explodedImage=loadImage("exploding.gif");
 planeImage=loadImage("pi.jpg");
  Aliens= new Alien[10];
  //bomb=new Bomb(500,500);
 x=0;
 count=0;
 kills=0;

  by=SCREENY/4;
  bx=SCREENX/2;

  init_aliens (Aliens); 
  
  
  myFont=loadFont("AgencyFB-Reg-48.vlw");
  
 
}

void init_aliens (Alien[]Aliens) {
 
  /* pass in your array, plus the image to use */
  for (int i=0; i<Aliens.length; i++){
      
      x=random(SCREENX/6,3*SCREENX/6);
      y=random(SCREENY/4);
      Aliens[i] = new Alien(x, y, alienImage);}
  }
  
  
  void init_bullet() {
    Bullet bullet=new Bullet(thePlayer);
    bullets.add(bullet);
   
  
  }
void draw_array(Alien theArray[]){
  //init_aliens (Aliens);
for(count=0; count<theArray.length; count++){
  


theArray[count].draw();}


}
void move_array(Alien theArray[]){
  for(count=0; count<theArray.length; count++){
    theArray[count].move();
  }
}
void reduceBarrier(Alien theArray[]){

  
      
    
    //for(Bullet bullet:bullets){
      
      for(int i=0;i<Aliens.length;i++){
        
      if(theArray[i].hasBomb){
        barrier1.move0(theArray[i]);
        barrier2.move0(theArray[i]);
        barrier3.move0(theArray[i]);
        barrier4.move0(theArray[i]);
          
      } 
      }
    //}
  
  
}

void powerUp(){
 r=random(10000);
 if(r>9909){
   powerUp=true;
 }
    
 }
 void dropBonus(){
    fill(300,10,10);
   rect(bx,by,10,10);
  
   
   by=by+5;
   
   if(by>thePlayer.ypos&&bx>=thePlayer.xpos&&bx<=thePlayer.xpos+planeImage.width
   &&by<thePlayer.ypos+planeImage.height){
   // for (Bullet bullet:bullets){
   //   bullet.bulletColor=color(100,0,0);
      
      
   //}
   changeShape=true;
   
   
 }
 }
void isWin(Alien aliens[]){
  
  if(kills==aliens.length){
    textFont(myFont);
       textSize(100); 
       text("Victory",SCREENX/2,SCREENY/2);
       noLoop();
    
  }
}
//boolean exploded(float r){
 void getBomb(Alien theArray[]){
   for(count2=0;count2<theArray.length;count2++){
     if (theArray[count2].hasBomb==true){
       if(barrier1.move0(theArray[count2])==false&&barrier2.move0(theArray[count2])==false
     &&barrier3.move0(theArray[count2])==false&&barrier4.move0(theArray[count2])==false){
       if(!bombs.contains(theArray[count2].bomb)){
   theArray[count2].bomb.move();
    theArray[count2].bomb.draw();
     theArray[count2].bomb.collide(thePlayer);}}
     else{
       
       bombs.add(theArray[count2].bomb);
     }
      if(theArray[count2].bomb.isCollide==true){
       
       textFont(myFont);
       textSize(100);
       text("Game over",SCREENX/2,SCREENY/2);
       noLoop();
       
     }
     if(theArray[count2].bomb.offScreen()==true){
       theArray[count2].hasBomb=false;
      
     }
  }
  
 
   }
 }
void collide(Alien Aliens[]){
  for(count1=0;count1<Aliens.length;count1++){
    for(Bullet bullet:bullets){
if(Aliens[count1].ypos+alienImage.height>=bullet.y&&
Aliens[count1].ypos<=bullet.y&&Aliens[count1].xpos<=bullet.x&&
Aliens[count1].xpos+alienImage.width>=bullet.x){
  
  Aliens[count1].die();
  exploded=true;
}
  
  
}
    
  }
 
  
  
}

//void displayText(){
//  if(bomb.isCollide==true){
       
//       textFont(myFont);
//       text("Game over",50,150);
//       noLoop();
       
//     }
  
//}
void mouseClicked(){
  init_bullet();
  
}



  void draw() {
    
    background(backgroundImage);
   
    thePlayer.move(mouseX);
     thePlayer.draw();
     powerUp();
     if(powerUp==true&&exploded==true){
       
       dropBonus();
 }
     
  
      
     for(Bullet bullet:bullets){
       if(barrier1.move1(bullet)==false&&barrier2.move1(bullet)==false&&barrier3.move1(bullet)==false&&barrier4.move1(bullet)==false){
         if(!blockedBullets.contains(bullet)){
     bullet.move();
     bullet.draw();
     barrier1.move1(bullet);
     barrier2.move1(bullet);
     barrier3.move1(bullet);
     barrier4.move1(bullet);}}
     else{
       
       blockedBullets.add(bullet);
     }
     
     }
     
  
    
    collide(Aliens);

    draw_array(Aliens);
    
    //if(count<Aliens.length){#
   
     
    move_array(Aliens);
    if(barrier1.height1>=2){
     barrier1.draw();}
      if(barrier2.height1>=2){
     barrier2.draw();}
     if(barrier3.height1>=2){
     barrier3.draw();}
     if( barrier4.height1>=2){
     barrier4.draw();}
     
     reduceBarrier(Aliens);
     
    getBomb(Aliens);
    isWin(Aliens);
    
    
    
    //bomb.move();
     //bomb.draw();
     //bomb.collide(thePlayer);
     //displayText();
    //reset();
    //explode();
    
   /* clear the screen */
    
   //count=count+1;/* for each alien in the array - move the alien, then draw the alien */
    }
   
    
