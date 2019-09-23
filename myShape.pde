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

void rotateMe(float angle,PGraphics surface) {
  // Displays the image at its actual size at point (0,0)

  surface.rotate(angle);
  print("angle", angle);
}

}