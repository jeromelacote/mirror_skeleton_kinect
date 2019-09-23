/**
//_global.collection_color = new Array(0xff0000,0xff6600,0xffff00);
//_global.collection_color=[0x4f7b7b,0x6f9999,0x8bb6ba,0xa2cbcf,0xcdd6c7,0xa4a893,0xcbc8a6,0xbeb893,0xd2c37a,0xc5b469,0xbda137];
//_global.collection_color=[0x507a7a,0x6a9696,0x86afb0,0x8dbcc3,0xa2cbcf,0xcac8a9,0xc2ba8e,0xb0ac8e,0xa49e85,0xb2c5b7,0x8ea697];
//_global.collection_color=[0x4f7b7b,0x6f9999,0x8bb6ba,0xa2cbcf,0xcdd6c7,0xa4a893,0xcbc8a6,0xbeb893,0xd2c37a,0xc5b469,0xbda137];
//_global.collection_color=[0x587b7c,0x719b9e,0x9fc1be,0xe0d9bb,0xdacb94,0xcaba88,0xdabd55,0xc49f32,0xa97409,0x885302,0x6f5017];
_global.collection_color=[0x425d5d,0x52797f,0x6f9aa0,0x7d4c02,0x966b11,0xc29c33,0xd8c273,0xd5ca98,0xb8a870,0x7a714b,0x554d29];

 */
import gab.opencv.*;
import processing.video.*;
import processing.pdf.*;
import java.awt.*;
import java.util.Date;
import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////////

String lastGesture = "";

PImage img;
PImage BG;


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

int red =int(random(255));
int green =int(random(255));
int blue =int(random(255));
// Scaling down the video
int scl = 1;

//grid stuff
float angle=1;
float randomAngle = 1;
int lib =0;
color averageScreenColor = color(255,255,255);

boolean showInfo =false;
//mosaic Stuff//////////////////////////////////////////////////////////////////////
final static int MT_img = 0;
final static int MT_rect = 1;
color[] colorCollec = {};
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
//////////////////////////////////////////////////////////////////////////////////////////////
Kinect kinect;
ArrayList <SkeletonData> bodies;



///////////////////////////////////////////////////////////////////////////////////////////////*
//********************************************************************************************
//////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
   //fullScreen(1);
   size(640, 480, P3D);
   
   //??????????????  kinect = new Kinect(this);
   smooth();
   bodies = new ArrayList<SkeletonData>();
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
//*******************************************************************************************
//////////////////////////////////////////////////////////////////////////////////////////////
void draw() {

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

 if(maskAlpha>255) { maskAlpha=255; }
 if(maskAlpha<0){ maskAlpha=255;}

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

  pg.endDraw();
  pushMatrix();
  
  //image(kinect.GetImage(), 320, 0, 320, 240);
  //image(kinect.GetDepth(), 320, 240, 320, 240);
  //image(kinect.GetMask(), 0, 240, 320, 240);
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(pg,bodies.get(i));
  }
  
  

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
//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////