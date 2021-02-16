class Bullet{
  
  float x; 
  float y;
  int radius;
  
  float dy;
  color bulletColor = color(200, 100, 50);
  
  Bullet(Player tp){
    radius=8;
     x=tp.xpos+PADDLEWIDTH/2;
     y=tp.ypos+radius;
    dy = 5;
  //  if(isShoot==false){
        
        
       
  //     x=thePlayer.xpos+PADDLEWIDTH/2;
        
  //     isShoot=true;
       
  //   }
    
  }
  void move(){
  
y = y-dy;
 

}

  void draw(){
fill(bulletColor);
if(changeShape==false){
ellipse(int(x), int(y), radius,
radius);}

if(changeShape==true){
  
  triangle((x)-10,(y),x+10,y-20,x+30,y);
  
}
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
