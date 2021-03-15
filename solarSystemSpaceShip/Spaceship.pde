public class SpaceShip {
  
  float[] sideDir = {1,0,0};

  PShape spaceship;
  float[] pos = new float[3];
  float speed;
  
  float[] view = new float[3];
  float rotX, rotY;
  
  boolean w,s,a,d = false;
 
  public SpaceShip(float[] initialPos){
    resetSpaceShipPos(initialPos);
    view[0] = 0;
    view[1] = 0;
    view[2] = 1;
    speed = 5;
    beginShape ( ) ;
    spaceship = createShape (SPHERE,10);
    spaceship.setStroke(255);
    endShape (CLOSE) ;
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
      
      float[] newView = {0,0,0};
      float[] newSideDir = new float[3];
      float[] u = new float[3];
      for(int m = 0; m < 3; m++){
        for(int n = 0; n < 3; n++){
          newView[m] += view[n] * maskY[n][m];
          newSideDir[m] += sideDir[n] * maskY[n][m];
        }
      }
      
      sideDir = newSideDir;
      view = newView;
      view[1] -= angleX;
  }
  
  public void resetSpaceShipPos(float[] initialShipPos){
    for(int i = 0; i < 3 ;i++){
      pos[i] = initialShipPos[i];
    }
  }
}
