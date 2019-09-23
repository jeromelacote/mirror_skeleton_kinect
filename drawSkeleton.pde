PImage imgBody;
PImage imgArm;
String torsoFile ="skl_torso.png";
String armFile ="skl_arm.png";



void drawSkeleton(PGraphics surface, SkeletonData _s){

drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT,
  "skl_arm_top_left",   0,  0);
drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT,
  "skl_arm_bottom_left", 0.7,  0.3);

drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT,
  "skl_arm_top_right", 0,  0);
drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT,
  "skl_arm_bottom_right", 0.7,  0.3);

drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT,
  "skl_leg_top_left", 0.2,  0.2);
drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT,
  "skl_leg_bottom_left", 0.2,  0.2);

drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT,
  "skl_leg_top_right", 0.2,  0.2);
drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT,
  "skl_leg_bottom_right", 0.2,  0.2);

drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER,
  "skl_torso",-0.05,  0.5);
drawBoneKD(surface, _s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER,
  "skl_face", 0.2,  0); 

//drawBone("skl_arm_top_left",400, 150, 200, 150,   0,  0);
//drawBone("skl_arm_bottom_left",200, 150, 20, 180, 0.7,  0.3);

//drawBone("skl_arm_top_right",400, 150, 600, 150, 0,  0);
//drawBone("skl_arm_bottom_right",600, 150, 720, 180, 0.7,  0.3);

//drawBone("skl_leg_top_left",400, 400, 200, 600, 0.2,  0.2);
//drawBone("skl_leg_bottom_left",200, 600, 200, 750, 0.2,  0.2);

//drawBone("skl_leg_top_right",400, 400, 600, 600, 0.2,  0.2);
//drawBone("skl_leg_bottom_right",600, 600, 700, 750, 0.2,  0.2);

//drawBone("skl_torso",400, 100, 400, 400, -0.05,  0.5);
//drawBone("skl_face",400, 10, 400, 150, 0.2,  0); 
}


/////////////////////////////////////////////////////
void drawBoneKD(PGraphics surface, SkeletonData _s, int _j1, int _j2, String type, float offsetPos, float offsetLength){

  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    
    float a1 = _s.skeletonPositions[_j1].x;
    float a2 = _s.skeletonPositions[_j1].y;
    float b1 = _s.skeletonPositions[_j2].x;
    float b2 = _s.skeletonPositions[_j2].y;
   
   line(a1,a2,b1,b2);
  
        if(type == "skl_torso"){
          tint(random(255),random(255),random(255));
        } else{
          tint(255,255,255);
        }
        
        float distance = dist(a1,a2,b1,b2);
        
        imgArm = loadImage(type+".png");
        //println(imgArm.width);
        //println(imgArm.height);
        //println(distance);
        float armHeight = imgArm.width* distance / imgArm.height ;//int( (int(imgArm.width) / int(imgArm.height)) *distance);
        // println(armHeight);
        PVector a = new PVector(0, 300);
        PVector b = new PVector(b1-a1, b2-a2);
        float angle;
        
          surface.pushMatrix();
              angle = PVector.angleBetween(a, b);
              float agl = atan2(a.y, a.x) - atan2(b.y, b.x);
              surface.translate (a1,a2);
              surface.rotate(-agl);
              surface.image(imgArm,0-(armHeight/2),0- (offsetPos*armHeight),armHeight,distance + (distance* offsetLength));
          surface.popMatrix();
           
        surface.line (a1,a2,b1,b2);
        surface.ellipse(a1,a2,10,10);
        surface.ellipse(b1,b2,10,10);
       
     }
}



void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}