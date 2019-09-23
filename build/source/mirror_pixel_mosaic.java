import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import gab.opencv.*; 
import processing.video.*; 
import processing.pdf.*; 
import java.awt.*; 
import java.util.Date; 
import com.onformative.leap.LeapMotionP5; 
import com.leapmotion.leap.Gesture.State; 
import com.leapmotion.leap.Gesture.Type; 
import com.leapmotion.leap.Hand; 
import com.leapmotion.leap.KeyTapGesture; 
import com.leapmotion.leap.ScreenTapGesture; 
import com.leapmotion.leap.SwipeGesture; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class mirror_pixel_mosaic extends PApplet {

/**
//_global.collection_color = new Array(0xff0000,0xff6600,0xffff00);
//_global.collection_color=[0x4f7b7b,0x6f9999,0x8bb6ba,0xa2cbcf,0xcdd6c7,0xa4a893,0xcbc8a6,0xbeb893,0xd2c37a,0xc5b469,0xbda137];
//_global.collection_color=[0x507a7a,0x6a9696,0x86afb0,0x8dbcc3,0xa2cbcf,0xcac8a9,0xc2ba8e,0xb0ac8e,0xa49e85,0xb2c5b7,0x8ea697];
//_global.collection_color=[0x4f7b7b,0x6f9999,0x8bb6ba,0xa2cbcf,0xcdd6c7,0xa4a893,0xcbc8a6,0xbeb893,0xd2c37a,0xc5b469,0xbda137];
//_global.collection_color=[0x587b7c,0x719b9e,0x9fc1be,0xe0d9bb,0xdacb94,0xcaba88,0xdabd55,0xc49f32,0xa97409,0x885302,0x6f5017];
_global.collection_color=[0x425d5d,0x52797f,0x6f9aa0,0x7d4c02,0x966b11,0xc29c33,0xd8c273,0xd5ca98,0xb8a870,0x7a714b,0x554d29];

 */














LeapMotionP5 leap;
String lastGesture = "";

PImage img;
PImage BG;

String[] bgCollec = {
"bg_0.jpg",
"bg_1.jpg",
"bg_2.jpg",
"bg_3.jpg",
"bg_4.jpg"
};
String[] butterflyCollec = {
"butterfly-0.png",
"butterfly-1.png",
"butterfly-10.png",
"butterfly-11.png",
"butterfly-12.png",
"butterfly-13.png",
"butterfly-14.png",
"butterfly-15.png",
"butterfly-16.png",
"butterfly-17.png",
"butterfly-18.png",
"butterfly-19.png",
"butterfly-2.png",
"butterfly-20.png",
"butterfly-21.png",
"butterfly-22.png",
"butterfly-23.png",
"butterfly-24.png",
"butterfly-25.png",
"butterfly-26.png",
"butterfly-27.png",
"butterfly-28.png",
"butterfly-29.png",
"butterfly-3.png",
"butterfly-30.png",
"butterfly-31.png",
"butterfly-32.png",
"butterfly-33.png",
"butterfly-34.png",
"butterfly-35.png",
"butterfly-36.png",
"butterfly-37.png",
"butterfly-38.png",
"butterfly-39.png",
"butterfly-4.png",
"butterfly-40.png",
"butterfly-41.png",
"butterfly-42.png",
"butterfly-43.png",
"butterfly-44.png",
"butterfly-45.png",
"butterfly-46.png",
"butterfly-47.png",
"butterfly-48.png",
"butterfly-49.png",
"butterfly-5.png",
"butterfly-6.png",
"butterfly-7.png",
"butterfly-8.png",
"butterfly-9.png"
};
String[] emojis = {
"emoji_0.png",
"emoji_1.png",
"emoji_10.png",
"emoji_100.png",
"emoji_101.png",
"emoji_102.png",
"emoji_103.png",
"emoji_104.png",
"emoji_105.png",
"emoji_106.png",
"emoji_107.png",
"emoji_108.png",
"emoji_109.png",
"emoji_11.png",
"emoji_110.png",
"emoji_111.png",
"emoji_112.png",
"emoji_113.png",
"emoji_114.png",
"emoji_115.png",
"emoji_116.png",
"emoji_117.png",
"emoji_118.png",
"emoji_119.png",
"emoji_12.png",
"emoji_120.png",
"emoji_121.png",
"emoji_122.png",
"emoji_123.png",
"emoji_124.png",
"emoji_125.png",
"emoji_126.png",
"emoji_127.png",
"emoji_128.png",
"emoji_129.png",
"emoji_13.png",
"emoji_130.png",
"emoji_131.png",
"emoji_132.png",
"emoji_133.png",
"emoji_134.png",
"emoji_135.png",
"emoji_136.png",
"emoji_137.png",
"emoji_138.png",
"emoji_139.png",
"emoji_14.png",
"emoji_140.png",
"emoji_141.png",
"emoji_142.png",
"emoji_143.png",
"emoji_144.png",
"emoji_145.png",
"emoji_146.png",
"emoji_147.png",
"emoji_148.png",
"emoji_149.png",
"emoji_15.png",
"emoji_150.png",
"emoji_151.png",
"emoji_152.png",
"emoji_153.png",
"emoji_154.png",
"emoji_155.png",
"emoji_156.png",
"emoji_157.png",
"emoji_158.png",
"emoji_159.png",
"emoji_16.png",
"emoji_160.png",
"emoji_161.png",
"emoji_162.png",
"emoji_163.png",
"emoji_164.png",
"emoji_165.png",
"emoji_166.png",
"emoji_167.png",
"emoji_168.png",
"emoji_169.png",
"emoji_17.png",
"emoji_170.png",
"emoji_171.png",
"emoji_172.png",
"emoji_173.png",
"emoji_174.png",
"emoji_175.png",
"emoji_176.png",
"emoji_177.png",
"emoji_178.png",
"emoji_179.png",
"emoji_18.png",
"emoji_180.png",
"emoji_181.png",
"emoji_182.png",
"emoji_183.png",
"emoji_184.png",
"emoji_185.png",
"emoji_186.png",
"emoji_187.png",
"emoji_188.png",
"emoji_189.png",
"emoji_19.png",
"emoji_190.png",
"emoji_191.png",
"emoji_192.png",
"emoji_193.png",
"emoji_194.png",
"emoji_195.png",
"emoji_196.png",
"emoji_197.png",
"emoji_198.png",
"emoji_199.png",
"emoji_2.png",
"emoji_20.png",
"emoji_200.png",
"emoji_202.png",
"emoji_203.png",
"emoji_204.png",
"emoji_205.png",
"emoji_21.png",
"emoji_22.png",
"emoji_23.png",
"emoji_24.png",
"emoji_25.png",
"emoji_26.png",
"emoji_27.png",
"emoji_28.png",
"emoji_29.png",
"emoji_3.png",
"emoji_30.png",
"emoji_31.png",
"emoji_32.png",
"emoji_33.png",
"emoji_34.png",
"emoji_35.png",
"emoji_36.png",
"emoji_37.png",
"emoji_38.png",
"emoji_39.png",
"emoji_4.png",
"emoji_40.png",
"emoji_41.png",
"emoji_42.png",
"emoji_43.png",
"emoji_44.png",
"emoji_45.png",
"emoji_46.png",
"emoji_47.png",
"emoji_48.png",
"emoji_49.png",
"emoji_5.png",
"emoji_50.png",
"emoji_51.png",
"emoji_52.png",
"emoji_53.png",
"emoji_54.png",
"emoji_55.png",
"emoji_56.png",
"emoji_57.png",
"emoji_58.png",
"emoji_59.png",
"emoji_6.png",
"emoji_60.png",
"emoji_61.png",
"emoji_62.png",
"emoji_63.png",
"emoji_64.png",
"emoji_65.png",
"emoji_66.png",
"emoji_67.png",
"emoji_68.png",
"emoji_69.png",
"emoji_7.png",
"emoji_70.png",
"emoji_71.png",
"emoji_72.png",
"emoji_73.png",
"emoji_74.png",
"emoji_75.png",
"emoji_76.png",
"emoji_77.png",
"emoji_78.png",
"emoji_79.png",
"emoji_8.png",
"emoji_80.png",
"emoji_81.png",
"emoji_82.png",
"emoji_83.png",
"emoji_84.png",
"emoji_85.png",
"emoji_86.png",
"emoji_87.png",
"emoji_88.png",
"emoji_89.png",
"emoji_9.png",
"emoji_90.png",
"emoji_91.png",
"emoji_92.png",
"emoji_93.png",
"emoji_94.png",
"emoji_95.png",
"emoji_96.png",
"emoji_97.png",
"emoji_98.png",
"emoji_99.png"
};
String[] eyeCollec = {
"eye-01.png",
"eye-02.png",
"eye-03.png",
"eye-04.png",
"eye-05.png",
"eye-06.png",
"eye-07.png",
"eye-08.png",
"eye-09.png",
"eye-10.png",
"eye-11.png",
"eye-12.png",
"eye-13.png",
"eye-14.png",
"eye-15.png",
"eye-16.png",
"eye-17.png",
"eye-18.png",
"eye-19.png",
"eye-20.png",
"eye-21.png"
};
String[] shapeCollec = {
"shape-1.png",
"shape-2.png",
"shape-3.png",
"shape-4.png",
"shape-5.png",
"shape-6.png",
"shape-7.png",
"shape-8.png",
"shape-9.png",
"shape-10.png",
"shape-11.png",
"shape-12.png",
"shape-13.png",
"shape-14.png",
"shape-15.png",
"shape-16.png",
"shape-17.png",
"shape-18.png",
"shape-19.png",
"shape-20.png"
};
String[] picsCollec = {
"pics-1.JPG",
"pics-2.JPG",
"pics-3.JPG",
"pics-4.JPG",
"pics-5.JPG",
"pics-6.JPG",
"pics-7.JPG",
"pics-9.JPG",
"pics-10.JPG",
"pics-11.JPG",
"pics-12.JPG",
"pics-13.JPG",
"pics-14.JPG"
};
String[] faceCollec = {
"face-01.png",
"face-02.png",
"face-03.png",
"face-04.png",
"face-05.png",
"face-06.png",
"face-07.png",
"face-08.png",
"face-09.png",
"face-10.png",
"face-11.png",
"face-12.png",
"face-13.png",
"face-14.png",
"face-15.png",
"face-16.png",
"face-17.png",
"face-18.png",
"face-19.png",
"face-20.png",
"face-21.png",
"face-22.png"
};



int bgID=0;
int faceID=0;
int tempfaceID=0;
int eyeID=0;
int cnt=0;
int loopID=0;
int sequence=20;
int maskAlpha =0;

PGraphics genBG;
PGraphics pg;
Capture video;
Capture cam;
//OpenCV opencvEYE;
OpenCV opencvFACE;

// List of my Face objects (persistent)
ArrayList<Face> faceList;
ArrayList<Eye> eyeList;

// List of detected faces (every frame)
Rectangle[] faces;
Rectangle[] eyes;

// Number of faces detected over all time. Used to set IDs.
int faceCount = 0;
//int eyeCount = 0;

int myW = 640;
int myH = 480;

int red =PApplet.parseInt(random(255));
int green =PApplet.parseInt(random(255));
int blue =PApplet.parseInt(random(255));
// Scaling down the video
int scl = 1;

//grid stuff
float angle=1;
float randomAngle = 1;
int lib =0;

int averageScreenColor = color(255,255,255);

boolean showInfo =false;
//mosaic Stuff//////////////////////////////////////////////////////////////////////
final static int MT_img = 0;
final static int MT_rect = 1;
int[] colorCollec = {};
String[][] mosaicCollec = {eyeCollec, picsCollec, emojis,faceCollec, shapeCollec};
String[] mosaic = eyeCollec; //eyeCollec; //picsCollec; //emojis;//faceCollec; shapeCollec;
int step = 12;
int overlap = 1;
int mosaicType = 2;
boolean isVideo = false;
boolean isPattern = false;
boolean isMosaic = true;
boolean isMask = false;  // display a mask if face detect
boolean isMirror = false; //display reversed and cropped to fit the installation
boolean isFacedetect = true; // process if the face is detected

//////////////////////////////////////////////////////////////////////////////////////////////
boolean recording;
PGraphicsPDF pdf;
int pdfW =4000;
int pdfH =3000;
boolean saveFrame = false;

public void setup() {
   //fullScreen(1);
   
    //size(400, 400, PDF, "filename.pdf");
   pdf = (PGraphicsPDF) createGraphics(pdfW, pdfH, PDF, new Date().getTime()+"pause-resume.pdf");
   String[] cameras = Capture.list();

  // get colors in a array
    getColorCollec(mosaic);

  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(i, cameras[i]);
    }
  }

  leap = new LeapMotionP5(this);
  leap.enableGesture(Type.TYPE_SWIPE);

  video = new Capture(this, myW/scl, myH/scl,cameras[1]);//cameras[29])

  opencvFACE = new OpenCV(this, myW/scl, myH/scl);
  //opencvEYE = new OpenCV(this, myW/scl, myH/scl);
 // opencvEYE.loadCascade(OpenCV.CASCADE_EYE);
  opencvFACE.loadCascade(OpenCV.CASCADE_FRONTALFACE);

  faceList = new ArrayList<Face>();
  //eyeList = new ArrayList<Eye>();
  video.start();

  pg = createGraphics(myW, myH);
  genBG = createGraphics(myW, myH);
}
//////////////////////////////////////////////////////////////////////////////////////////////
public void updatescenario() {
  println ("update Scenario");
    cnt     =   0;
    bgID    =   PApplet.parseInt(random(bgCollec.length));
    faceID  =   PApplet.parseInt(random(faceCollec.length));
    eyeID   =   PApplet.parseInt(random(eyeCollec.length));
    red     =   PApplet.parseInt(random(100))+155;
    green   =   PApplet.parseInt(random(100))+155;
    blue    =   PApplet.parseInt(random(100))+155;
    mosaicType = 0;//int(random(6));
    step = PApplet.parseInt(random(10)*10);
    mosaic = new String[0];
    mosaic = mosaicCollec[PApplet.parseInt(random(mosaicCollec.length-1))];
    println(mosaicCollec.length-1);
    println(mosaic);
      // get colors in a array
      // dcolorCollec = null;
      colorCollec = new int[0];
      println(colorCollec);
    getColorCollec(mosaic);
}
//////////////////////////////////////////////////////////////////////////////////////////////
public void draw() {

  loopID++;
  cnt++;

  if(cnt>sequence)
  {
  //updatescenario();
  //drawGrid();
  //cnt = 0;
  }
  pg.beginDraw();
  pg.scale(scl);
  opencvFACE.loadImage(video);
  //opencvEYE.loadImage(video);

  //pg.background(int(random(255)),int(random(255)),int(random(255)));
  pg.tint(255,255,255,255);

  if(isVideo){
    pg.image(video, 0, 0 );
    pg.filter(GRAY); //pg.filter(THRESHOLD);//filter(INVERT);//filter(BLUR,4); //filter(POSTERIZE,5);
  }
  //drawing patterns
  if(isPattern){
  pg.tint(255,255,255,100);
  pg.image(genBG, 0, 0,myW,myH);
  }
  pg.tint(255,255,255,255);

   if(maskAlpha>255)
   {
     maskAlpha=255;
   }
      if(maskAlpha<0)
   {
     maskAlpha=255;
   }

  if (isFacedetect){
      if (isMosaic){
     makeMosaic(pg, video, 0, 0, mosaicType);
     //makeMosaicRound(pg, video, 0, 0, 2);
      }
      faces = opencvFACE.detect();
      for (int i = 0; i < faces.length ; i++) {
        if(faceID> faceCollec.length -2)
        {
        tempfaceID = faceID+i%(faceCollec.length-1)-1;
         }else{
        tempfaceID = faceID+i;
        }
        if(tempfaceID>faceCollec.length-1){tempfaceID=0;}

      //rect(eyes[i].x, eyes[i].y, eyes[i].width, eyes[i].height);
      int x =faces[i].x -(faces[i].width/4);
      int y=faces[i].y -(faces[i].height/3);
      int w=round(faces[i].width+ (faces[i].width/2));
      int h=round(faces[i].height+ (faces[i].height/2));
      PImage facePX = video.get(x, y,w,h);

      if (isMask){
      img = loadImage(faceCollec[tempfaceID]);
      pg.tint(red(averageScreenColor)+60,green(averageScreenColor)+60,blue(averageScreenColor)+60,maskAlpha);
      pg.image(img, x, y,w,h);
      }

      //pg.image(facePX, x, y,w,h);
      maskAlpha+=6;
    }
    if(faces.length==0){
      maskAlpha-=10;
    }
  } else {
      if (isMosaic){
      makeMosaic(pg, video, 0, 0, mosaicType);
      //makeMosaicRound(pg, video, 0, 0, 2);
      }
  }

  //PVector fingerPos = leap.getTip(leap.getFinger(0));
  //pg.ellipse(fingerPos.x, fingerPos.y, 20, 20);
  //pg.text(lastGesture, 30, 30);
  pg.endDraw();
  pushMatrix();

  if (isMirror) {
    translate(width,0);
    scale(-1,1);
    //370-30 -- 1230 899
    image(pg, 350, 20,1230-330,899-10);
  } else
  {
    image(pg, 0, 0,width,height);
  }
  popMatrix();

    if(loopID%20 == 0){
      averageScreenColor = extractColorFromImage(video);
    }

   if (saveFrame) { // Save a Pdf on key S
        pdf = (PGraphicsPDF) createGraphics(pdfW, pdfH, PDF, new Date().getTime()+"pause-resume.pdf");
        println("Recording started.");
        pdf.beginDraw();
        pdf.pushMatrix();
        pdf.scale(pdfW/width,pdfH/height);
        makeMosaic(pdf, video, 0, 0, mosaicType);
        pdf.popMatrix();
        pdf.dispose();
        pdf.endDraw();
        saveFrame=false;
  }

 if(showInfo){ // on key S
 fill(0,100);
 rect(0,0,width,height);
 String s =
" step ="+step
+"\n overlap ="+overlap
+"\n mosaicType ="+mosaicType
+"\n isVideo = "+isVideo
+"\n isPattern =" +isPattern
+"\n isMosaic =" +isMosaic
+"\n isMask = "+isMask
+"\n isMirror = "+isMirror
+"\n isFacedetect ="+isFacedetect
+"\n\n-Q: quit \n- I: info \n-R: record(toggle) \n-S: saveframe \n-U: update scenario \n-L: updateLibrary tbd"
 ;
fill(199);
text(s, 10, 10, 300, 300);  // Text wraps within text box
 }
}
////////////////////////////////////////////////////////////////////////////////
public void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }

  }
   else if (key == 'c') {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
       endRecord();
  }

     else if (key == 's') {
saveFrame =true;
  }
  else if (key == 'u') {
  updatescenario();
  }
    else if (key == 'l') {
  //updateLibrary();
  }
      else if (key == 'i') {
    showInfo = !showInfo;
  }
  else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////
public void makeMosaic(PGraphics surface, PImage imgIn, int x, int y, int mosaicType){
  surface.translate(x,y);
  int prevCol = color(0,0,0);
  int cnt =0;
        // Loop through all pixels, skip every 10 pixels along the y-axis
    for (int yIMG = 0; yIMG < imgIn.height; yIMG+=step) {
    // skip every 5 pixels along the x-axis
    for (int xIMG = 0; xIMG < imgIn.width; xIMG+=step) {
      // Calculate the 1D location from a 2D grid
      int loc = xIMG + yIMG*imgIn.width;
       cnt++;
      // Color according to the image
       surface.tint(255,255,255,20);
       int rad1 = round(random(step+overlap));
      int rad2 = round(random(step+overlap));
      int rad3 = round(random(step+overlap));
      switch (mosaicType){
      case 0:
      PImage imgMosaic = chooseImgLookLike(imgIn.pixels[loc]);
      surface.image(imgMosaic,xIMG,yIMG, step+overlap,step+overlap);
      break;
      case 1:
      surface.noStroke();
      surface.fill(imgIn.pixels[loc]);
      surface.rect(xIMG,yIMG, step,step);
      break;
      case 2:
      surface.noStroke();
      surface.fill(imgIn.pixels[loc]);
      surface.ellipse(xIMG,yIMG, step,step);
      break;
      case 3:
      surface.noStroke();
      surface.fill(imgIn.pixels[loc]);
      surface.triangle(xIMG,yIMG,xIMG,yIMG+step,xIMG+step,yIMG+step);
      surface.fill(prevCol);
      surface.triangle(xIMG,yIMG,xIMG+step,yIMG,xIMG+step,yIMG+step);
      break;
      case 4:
      surface.noStroke();

      surface.fill(imgIn.pixels[loc]);
      surface.triangle(xIMG-rad1,yIMG-rad1,xIMG-rad2,yIMG+step+rad2,xIMG+step+rad3,yIMG+step+rad1);
      break;
      case 5:
      surface.noStroke();
      surface.fill(imgIn.pixels[loc]);
        int radshape = round(random(5));
        println(radshape);
        switch (radshape){
        case 0:
        surface.rect(xIMG,yIMG, step,step);
        break;
        case 1:
        surface.ellipse(xIMG,yIMG, step,step);
        break;
        case 2:
        surface.triangle(xIMG,yIMG,xIMG,yIMG+step,xIMG+step,yIMG+step);
        surface.fill(prevCol);
        surface.triangle(xIMG,yIMG,xIMG+step,yIMG,xIMG+step,yIMG+step);
        break;
        case 3:
        surface.triangle(xIMG-rad1,yIMG-rad1,xIMG-rad2,yIMG+step+rad2,xIMG+step+rad3,yIMG+step+rad1);
        break;
        case 4:
        surface.rect(xIMG+rad1,yIMG-rad2, step+rad1,step+rad3);
        break;
        case 5:
        surface.ellipse(xIMG+rad1,yIMG-rad2, step+rad1,step+rad3);
        break;
        }
      break;
      case 6:
      surface.noStroke();
      if(cnt%2 == 0) {surface.fill(imgIn.pixels[loc]);}else{surface.fill(prevCol);}
      surface.triangle(xIMG,yIMG,xIMG,yIMG+step,xIMG+step,yIMG+step);
      cnt++;
      if(cnt%2 == 0) {surface.fill(imgIn.pixels[loc]);}else{surface.fill(prevCol);}
      surface.triangle(xIMG,yIMG,xIMG+step,yIMG,xIMG+step,yIMG+step);
      break;
      }
      prevCol =imgIn.pixels[loc];
      //pg.rect(xIMG,yIMG, step,step);
    }
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////
public void makeMosaicRound(PGraphics surface, PImage imgIn, int x, int y, int mosaicType){
  surface.translate(x,y);
float maxradius =imgIn.width/1;
int density=5  ;
int numcol=imgIn.height/5  ;
int intercol =1;


for(int j=1;j<numcol ;j++){
  float radius = (((maxradius /numcol)+intercol)*j);
  int numPoints = round(j*(density/1.5f));
 float angle=TWO_PI/(float)numPoints;
for(int i=0;i<numPoints ;i++)
{
  int loc = i + j*imgIn.height;
    surface.noStroke();
    //surface.fill(round(random(255)),round(random(255)),round(random(255)),round(random(200)));
    int r = round(red(imgIn.pixels[loc])+ random(2));
    int g = round(green(imgIn.pixels[loc])+ random(2));
    int b = round(blue(imgIn.pixels[loc])+ random(2));
    surface.fill(r,g,b, 80);

      surface.pushMatrix();
      surface.translate (radius*sin(angle*i)+ imgIn.width/2, radius*cos(angle*i)+imgIn.height/2);
      surface.pushMatrix();
      surface.translate (10,10);
        surface.rotate(- angle*i);
        //rect(radius*sin(angle*i)+ width/2,radius*cos(angle*i)+height/2,20,20);

       int rad1 = round(random(step+overlap));
      int rad2 = round(random(step+overlap));
      int rad3 = round(random(step+overlap));
      switch (mosaicType){
      case 0:
        surface.rect(0,0,20,20);
      break;
      case 1:
        surface.triangle(0-rad1,0-rad1,0-rad2,0+step+rad2,0+step+rad3,0+step+rad1);
      break;
       case 2:
        surface.ellipse(0,0,20,20);
      break;
      }
       surface.popMatrix();
       surface.popMatrix();
      }
       // endDraw();
      }
      //fill(255,255,255,100);
      //rect(width/2-15, height/2 -15, 50, 50);

}
//////////////////////////////////////////////////////////////////////////////////////////////
public void getColorCollec(String[] arr){
  // get colors in a array
    for (int i=0; i<arr.length; i++) {//loop tru pics
    img = loadImage(arr[i]);
    colorCollec = append(colorCollec,extractColorFromImage(img));
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////

public int calculateCOlorDistance(int a, int b){
  //return round(random(1000));

      float redDiff = red(a) - red(b);
      float grnDiff = green(a) - green(b);
      float bluDiff = blue(a) - blue(b);
      float distance;

      //distance = (3 * redDiff) + (4 * grnDiff) + (3 * bluDiff);
      distance = sqrt( sq(redDiff) + sq(grnDiff) + sq(bluDiff) );
      return round(distance);
}
//////////////////////////////////////////////////////////////////////////////////////////////
public PImage chooseImgLookLike(int c){
  PImage  img;
  String[] imgCollec = {};
  imgCollec = mosaic;
  //int randomShape=round(random(faceCollec.length - 1));
  long minDist=100000000000L;
  int minImg=0;

  for (int i=0; i<colorCollec.length; i++) {//loop tru pics
    //img = loadImage(imgCollec[i]);
    //color imgColor = extractColorFromImage(img);

    int dist = calculateCOlorDistance(c,colorCollec[i] );
      if(dist<minDist){
        minDist =dist;
        minImg =i;
      }
  }

  PImage imgselect = loadImage(imgCollec[minImg]);

  //store distance
  // find shortest distance
  return imgselect;
}

//////////////////////////////////////////////////////////////////////////////////////////////

public int extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    int c = img.pixels[i];
    r += c>>16&0xFF;
    g += c>>8&0xFF;
    b += c&0xFF;
  }
  r /= img.pixels.length;
  g /= img.pixels.length;
  b /= img.pixels.length;

  return color(r, g, b);
}

//////////////////////////////////////////////////////////////////////////////////////////////

public void captureEvent(Capture c) {
  c.read();
}

public void swipeGestureRecognized(SwipeGesture gesture) {
  if (gesture.state() == State.STATE_STOP) {
    System.out.println("//////////////////////////////////////");
    System.out.println("Gesture type: " + gesture.type());
    System.out.println("ID: " + gesture.id());
    System.out.println("Position: " + leap.vectorToPVector(gesture.position()));
    System.out.println("Direction: " + gesture.direction());
    System.out.println("Duration: " + gesture.durationSeconds() + "s");
    System.out.println("Speed: " + gesture.speed());
    System.out.println("//////////////////////////////////////");
    //lastGesture = "Gesture type: " + gesture.type().toString() + "\n";
    //lastGesture += "ID: " + gesture.id() + "\n";
    //lastGesture += "Position: " + leap.vectorToPVector(gesture.position()) + "\n";
    //lastGesture += "Direction: " + gesture.direction() + "\n";
    //lastGesture += "Speed: " + gesture.speed() + "\n";
    //lastGesture += "Duration: " + gesture.durationSeconds() + "s" + "\n";
    updatescenario();
  }
  else if (gesture.state() == State.STATE_START) {
  }
  else if (gesture.state() == State.STATE_UPDATE) {
  }
}

//void DrawShape(float angle)
//{
//MyShape aShape = new MyShape(0,0,angle,0,genBG);
////aShape.rotateMe(angle);
//}

public void drawGrid()
{
  genBG.beginDraw();
   angle += 1;
     blue     =   PApplet.parseInt(random(200));
     green   =   PApplet.parseInt(random(255));
 // Save defaults
  for (int x = 0; x < 32; x++) {

   for (int y = 0; y < 24; y++) {
     randomAngle++;   //round(random(10));
     red    =   PApplet.parseInt(random(255)) +20;
  MyShape aShape = new MyShape(x,y,radians(90)*randomAngle,lib, genBG, pg, red, green, blue);
   }
   lib += floor(random(width)/10);
 }
 lib += floor(random(height)/10);
 genBG.endDraw();

}
/**
 * Which Eye Is Which
 * Daniel Shiffman
 * http://shiffman.net/2011/04/26/opencv-matching-Eyes-over-time/
 *
 * Modified by Jordi Tost (call the constructor specifying an ID)
 * @updated: 01/10/2014
 */

class Eye {
  
  // A Rectangle
  Rectangle r;
  
  // Am I available to be matched?
  boolean available;
  
  // Should I be deleted?
  boolean delete;
  
  // How long should I live if I have disappeared?
  int timer = 127;
  
  // Assign a number to each Eye
  int id;
  
  // Make me
  Eye(int newID, int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
    available = true;
    delete = false;
    id = newID;
  }

  // Show me
  public void display() {
    fill(0,0,255,timer);
    stroke(0,0,255);
    rect(r.x,r.y,r.width, r.height);
    //rect(r.x*scl,r.y*scl,r.width*scl, r.height*scl);
    fill(255,timer*2);
    text(""+id,r.x+10,r.y+30);
    //text(""+id,r.x*scl+10,r.y*scl+30);
    //text(""+id,r.x*scl+10,r.y*scl+30);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  public void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  public void countDown() {
    timer--;
  }

  // I am deed, delete me
  public boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}
/**
 * Which Face Is Which
 * Daniel Shiffman
 * http://shiffman.net/2011/04/26/opencv-matching-faces-over-time/
 *
 * Modified by Jordi Tost (call the constructor specifying an ID)
 * @updated: 01/10/2014
 */

class Face {
  
  // A Rectangle
  Rectangle r;
  
  // Am I available to be matched?
  boolean available;
  
  // Should I be deleted?
  boolean delete;
  
  // How long should I live if I have disappeared?
  int timer = 127;
  
  // Assign a number to each face
  int id;
  
  // Make me
  Face(int newID, int x, int y, int w, int h) {
    r = new Rectangle(x,y,w,h);
    available = true;
    delete = false;
    id = newID;
  }

  // Show me
  public void display() {
    fill(0,0,255,timer);
    stroke(0,0,255);
    rect(r.x,r.y,r.width, r.height);
    //rect(r.x*scl,r.y*scl,r.width*scl, r.height*scl);
    fill(255,timer*2);
    text(""+id,r.x+10,r.y+30);
    //text(""+id,r.x*scl+10,r.y*scl+30);
    //text(""+id,r.x*scl+10,r.y*scl+30);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  public void update(Rectangle newR) {
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  public void countDown() {
    timer--;
  }

  // I am deed, delete me
  public boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0,0.05f);
    velocity = new PVector(random(-1,1),random(-2,0));
    position = l.get();
    lifespan = 255.0f;
  }

  public void run() {
    update();
    display();
  }

  // Method to update position
  public void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0f;
  }

  // Method to display
  public void display() {
    pg.stroke(0,lifespan);
    pg.strokeWeight(2);
    pg.fill(127,lifespan);
    pg.ellipse(position.x,position.y,12,12);
  }
  
  // Is the particle still useful?
  public boolean isDead() {
    if (lifespan < 0.0f) {
      return true;
    } else {
      return false;
    }
  }
}
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.get();
    particles = new ArrayList<Particle>();
  }

  public void addParticle() {
    particles.add(new Particle(origin));
  }

  public void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x, y)));
  }

  public void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
class MyShape{
PImage img;  // Declare variable "a" of type PImage
float imgSize=40;
MyShape(float x,float y,float angle, int lib, PGraphics surface,PGraphics parent,int red, int green, int blue) {
  String[] imgCollec = {"monimage.png","monimage2.png","monimage3.png","monimage4.png","monimage5.png"};
  int randomShape=round(random(imgCollec.length - 1));
  randomShape =lib%5;
  //print("randomShape",randomShape,"\n");
  
  

    
surface.tint(red,green,blue,255);
img = loadImage(imgCollec[randomShape]);   
surface.pushMatrix();
surface.translate(x*imgSize, y*imgSize);
surface.pushMatrix();
surface.translate(imgSize/2, imgSize/2); 
//surface.rotate(angle);
surface.translate(-imgSize/2, -imgSize/2); 
surface.image(img, 0, 0,imgSize,imgSize);
surface.popMatrix();
surface.popMatrix();
  //translate(img.width/2, img.height/2); 
  
  //rotate(PI/angle);
  //rotate(PI/random(50));
}

public void rotateMe(float angle,PGraphics surface) {
  // Displays the image at its actual size at point (0,0)

  surface.rotate(angle);
  print("angle", angle);
}

}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "mirror_pixel_mosaic" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
