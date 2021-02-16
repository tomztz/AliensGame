class Barrier{
  
  float x;
  float y;
  float width1;
  float height1;
  Alien alien;
  Bullet bullet;
  
  Barrier(float xpos,float ypos){
    
    
    
    this.x=xpos;
    this.y=ypos;
    this.width1=PADDLEWIDTH;
    this.height1=PADDLEHEIGHT;
    
  }
  boolean move0(Alien alien){
    
    if(alien.bomb.x>x&&alien.bomb.x<x+width1&&alien.bomb.y>y&&alien.bomb.y<y+height1){
      
      if(height1>0){
      height1=height1-0.1;
      
      return true;
      }
     
      
    }
    return false;
  }
   boolean move1(Bullet bullet) {
    if(bullet.x>x&&bullet.x<x+width1&&bullet.y<y&&bullet.y>y-height1){
      if(height1>0){
       height1--;
   
       
       return true;
      
      
    }
  
    }
   
       return false;
  }
  
  void draw(){
    
    rect(x,y,width1,height1);
    
  }
  
  
  
  
  
  
  
  
}
