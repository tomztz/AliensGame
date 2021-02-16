class Bomb{
  float x;
  float y;
  float dy;
  Alien aliens[];
  int radius;
  color bombColor=color(255,204,0);

  boolean isCollide=false;

  
  
Bomb(float xp,float yp){
    radius=7;
    this.x=xp;
    this.y=yp;
    dy=5;
    
  }
  
  void move(){
    
    y=y+dy;
    
  }
  
  void draw(){
    fill(bombColor);
    ellipse(int(x), int(y), radius,
radius);}
  
  
  boolean offScreen(){
    if(y>SCREENY){
      return true;
      
    }
    return false;
    
  }
  
  void collide(Player player){
    
    if(x>=player.xpos&&x<=player.xpos+PADDLEWIDTH&&
    y>=player.ypos&&y<=player.ypos+PADDLEHEIGHT){
      isCollide=true;
      
    }
    
  }  }
  
  

  
