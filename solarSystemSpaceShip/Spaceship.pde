float[] x = {1,0,0};


public class SpaceShip {
  
  float[] dir = {0,0,1};
  float[] sideDir = {1,0,0};

  PShape spaceship;
  float[] pos = new float[3];
  float speed;
  
  float[] view = new float[3];
  float rotX, rotY;
  
  boolean w,s,a,d = false;
 
  public SpaceShip(float x, float y, float z){
    pos[0] = x;
    pos[1] = y;
    pos[2] = z;
    /*view[0] = x + 40;
    view[1] = y;
    view[2] = z;
    */
    view[0] = 0;
    view[1] = 0;
    view[2] = 1;
    speed = 5;
    
    beginShape ( ) ;
    spaceship = createShape (BOX,10);
    spaceship.setStroke(255);
    endShape (CLOSE) ;
  }

  public void moveX(float i){
    pos[0] += i;
  }
  
  public void moveY(float i){
    pos[1] += i;
  }
  
  public void moveZ(float i){
    pos[2] += i;
  }
  
  public void moveForward(float i){
    for(int n = 0; n < 3; n++){
      pos[n] += view[n] * i;
    }
  }
  
  public void moveSide(float i){
    for(int n = 0; n < 3; n++){
      pos[n] += sideDir[n] * i;
    }
  }

  void rotateCamera(float angleY, float angleX){
      float[][] maskY = {{cos(angleY), 0, sin(angleY)}, {0, 1, 0}, {-sin(angleY), 0, cos(angleY)}};
      //float[][] maskZ = {{cos(angleZ), -sin(angleZ), 0}, {sin(angleZ), cos(angleZ), 0}, {0, 0, 1}}; 
      
      float[] newView = {0,0,0};
      float[] newDir = {0,0,0};
      float[] newSideDir = new float[3];
      float[] u = new float[3];
      for(int m = 0; m < 3; m++){
        for(int n = 0; n < 3; n++){
          newView[m] += view[n] * maskY[n][m];
          //u[m] += x[n] * maskY[n][m];
          //newDir[m] = dir[n] * maskY[n][m];
          newSideDir[m] += sideDir[n] * maskY[n][m];
        }
        print(sideDir[m] + ", ");
        //print(newDir[m] + ", ");

      }
      print("\n");
      
      dir = newDir;
      sideDir = newSideDir;
      /*
      x = u;
      print("u="+u[0] + ", " + u[1] + ", " + u[2] + ";  masku=");
      
      float[][] maskU = {{cos(angleX)+u[0]*u[0]*(1-cos(angleX)), u[0]*u[1]*
          (1-cos(angleX))-sin(angleX), u[0]*u[2]*(1-cos(angleX))+u[1]*sin(angleX)},
          {u[1]*u[0]*(1-cos(angleX))+u[2]*sin(angleX), cos(angleX)+u[1]*u[1]*(1-cos(angleX)),
          u[1]*u[2]*(1-cos(angleX))-u[0]*sin(angleX)}, {u[2]*u[0]*(1-cos(angleX))-u[1]*sin(angleX),
          u[2]*u[1]*(1-cos(angleX))+u[0]*sin(angleX), cos(angleX)+u[2]*u[2]*(1-cos(angleX))}};
         
          
      
      for(int m = 0; m < 3; m++){
        for(int n = 0; n < 3; n++){
          print(maskU[n][m] + ", ");
        }
      }
      print("\n");
      
      */
      
      view = newView;
      /*
      float[][] maskU = {{1,0,0}, {0,cos(angleX),-sin(angleX)}, {0,sin(angleX),cos(angleX)}};

      newView = new float[3];
      for(int m = 0; m < 3; m++){
        for(int n = 0; n < 3; n++){
          newView[m] += view[n] * maskU[n][m];
        }
      }
      
      view = newView;
      */
      
      view[1] -= angleX;
  }
  
  public void resetSpaceShip(){
    pos[0] = 100;
    pos[1] = 100;
    pos[2] = 0;
  }
}
