//////////////////////////////////////////////////////////////////////////////////////////////
void updatescenario() {
  println ("update Scenario");
    cnt     =   0;
    bgID    =   int(random(bgCollec.length));
    faceID  =   int(random(faceCollec.length));
    eyeID   =   int(random(eyeCollec.length));
    red     =   int(random(100))+155;
    green   =   int(random(100))+155;
    blue    =   int(random(100))+155;
    mosaicType = 0;//int(random(6));
    step = int(random(10)*10);
    mosaic = new String[0];
    mosaic = mosaicCollec[int(random(mosaicCollec.length-1))];
    println(mosaicCollec.length-1);
    println(mosaic);
      // get colors in a array
      // dcolorCollec = null;
      colorCollec = new color[0];
      println(colorCollec);
    getColorCollec(mosaic);
}
//////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
void keyPressed() {
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
void makeMosaic(PGraphics surface, PImage imgIn, int x, int y, int mosaicType){
  surface.translate(x,y);
  color prevCol = color(0,0,0);
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
void makeMosaicRound(PGraphics surface, PImage imgIn, int x, int y, int mosaicType){
  surface.translate(x,y);
float maxradius =imgIn.width/1;
int density=5  ;
int numcol=imgIn.height/5  ;
int intercol =1;


for(int j=1;j<numcol ;j++){
  float radius = (((maxradius /numcol)+intercol)*j);
  int numPoints = round(j*(density/1.5));
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
void getColorCollec(String[] arr){
  // get colors in a array
    for (int i=0; i<arr.length; i++) {//loop tru pics
    img = loadImage(arr[i]);
    colorCollec = append(colorCollec,extractColorFromImage(img));
    }
}
//////////////////////////////////////////////////////////////////////////////////////////////

int calculateCOlorDistance(color a, color b){
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
PImage chooseImgLookLike(color c){
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

color extractColorFromImage(PImage img) {
  img.loadPixels();
  int r = 0, g = 0, b = 0;
  for (int i=0; i<img.pixels.length; i++) {
    color c = img.pixels[i];
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

void captureEvent(Capture c) {
  c.read();
}



//void DrawShape(float angle)
//{
//MyShape aShape = new MyShape(0,0,angle,0,genBG);
////aShape.rotateMe(angle);
//}

void drawGrid()
{
  genBG.beginDraw();
   angle += 1;
     blue     =   int(random(200));
     green   =   int(random(255));
 // Save defaults
  for (int x = 0; x < 32; x++) {

   for (int y = 0; y < 24; y++) {
     randomAngle++;   //round(random(10));
     red    =   int(random(255)) +20;
  MyShape aShape = new MyShape(x,y,radians(90)*randomAngle,lib, genBG, pg, red, green, blue);
   }
   lib += floor(random(width)/10);
 }
 lib += floor(random(height)/10);
 genBG.endDraw();

}