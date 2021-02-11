float table = 80;
float baseL = 100;
float armL1 = 10;
float armL2 = 15;
float armL3 = 60;
float armL4 = 50;
float baseW = 10;
float armW1 = 10;
float armW2 = 10;
float armW3 = 10;
float length1 = 0;
float angle2 = 0;
float angle3 = 0;
float length4 = 0;
float dif = 1.0;


void setup(){
  size(1200, 800, P3D);
  //background(255);
  
  camera(80, 80, 300, 0, 0, 0, 0, 0, -1);
  
}

void draw(){
  
  background(255);
  
  if(keyPressed){
    if(angle2 == 0 && angle3 == 0){
      if(key == '1' && length1 < 80-armL1/2){
        length1 = length1 + dif;
      }
      if(key == '!' && length1 > 0){
        length1 = length1 - dif;
      }
    }
    if(length1 == 80-armL1/2){
      if(key == '2' && angle2 < 360){
        angle2 = angle2 + dif;
      }
      if(key == '"' && angle2 > 0){
        angle2 = angle2 - dif;
      }
      if(angle2 == 0){
        if(key == '4' && length4 < table-armL3-armW2/2-5){
          length4 = length4 + dif;
        }
        if(key == '$' && length4 > 0){
          length4 = length4 - dif;
        }
        if(length4 > table-armL3-armW2/2-6){
          if(key == '3' && angle3 < 90){
            angle3 = angle3 + dif;
          }
          if(key == '#' && angle3 > 0){
            angle3 = angle3 - dif;
          }
        }
      }
      if(angle3 == 90){
        if(angle2 > 0 && angle2 < 45){
          length4 = table/cos(radians(angle2))-armL3-armW2/2-5;
        }
        if(angle2 > 45 && angle2 < 135){
          length4 = table/sin(radians(angle2))-armL3-armW2/2-5;
        }
        if(angle2 > 135 && angle2 < 225){
          length4 = -table/cos(radians(angle2))-armL3-armW2/2-5;
        }
        if(angle2 > 225 && angle2 < 315){
          length4 = -table/sin(radians(angle2))-armL3-armW2/2-5;
        }
        if(angle2 > 315 && angle2 < 360){
          length4 = table/cos(radians(angle2))-armL3-armW2/2-5;
        }
      }
    }
  }
  
  //base
  pushMatrix();
  translate(armW1/2+baseW/2,0,baseL/2);
  fill(200);
  box(baseW,baseW,baseL);
  popMatrix();
  translate(0,0,baseL-40);
  fill(175);
  box(armW1+2,armW1+2,80);
  
  //go to 1st joint
  translate(0,0,-40+armL1/2);
  translate(0,0,length1);
  //go to center of 1st link
  fill(150);
  box(armW1,armW1,armL1);
  
  //go to 2nd joint
  translate(0,0,armL1/2);
  rotateZ(radians(angle2));  
  //go to center of 2nd link
  translate(0,0,armL2/2);
  fill(125);
  box(armW2,armW2,armL2);
  
  //go to 3rd joint
  translate(0,0,armL2/2-armW3/2);
  rotateY(radians(angle3));
  //go to center of 3rd link
  translate(0,0,armL3/2-armW2/2);
  fill(100);
  box(armW3,armW3,armL3);
  
  //go to 4th joint
  translate(0,0,armL3/2-5);
  translate(0,0,length4);
  //go to center of 4th link
  translate(0,0,5-armL4/2);
  fill(75);
  box(armW3-2,armW3-2,armL4);

}
