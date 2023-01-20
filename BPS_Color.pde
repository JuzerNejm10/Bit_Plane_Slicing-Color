int w, h;
PImage img=null;
PGraphics pg;  

String imgPath;
String message;

File selection;
boolean imageSelected = false; 
boolean dialog = false;

int planeNum=0;

float W, H;
float diffPerW, diffPerH;

void setup() {
  fullScreen();
  PImage icon = loadImage("icon.png");
  surface.setIcon(icon);
  background(51);
  textAlign(CENTER, CENTER);
  drawUI();
}

void draw () {
  if (imageSelected) {
    //println(imgPath);
    noStroke();
    pg = createGraphics(w, h);
    pg.beginDraw();
    img = loadImage(imgPath);
    //img.loadPixels();
    for (int x=0; x < w; x++) {
      for (int y=0; y < h; y++) {
        int loc = x+y*w;

        int r = (img.pixels[loc]) >> 16 & 0xFF;
        int g = (img.pixels[loc]) >> 8 & 0xFF;
        int b = img.pixels[loc] & 0xFF;

        int Br=0, Bg=0, Bb=0;
        String BinaryBr="", BinaryBg="", BinaryBb="";
        char cR=0, cG=0, cB=0;
        int color1=0, color2=0, color3=0;

        color1=getChanPlane(r, Br, BinaryBr, cR, color1);
        color2=getChanPlane(g, Bg, BinaryBg, cG, color2);
        color3=getChanPlane(b, Bb, BinaryBb, cB, color3);

        //max 8 colors:black,white,red,green,blue,yellow,fuchsia,cyan
        img.pixels[loc]=color(color1, color2, color3);
      }
    }
    img.updatePixels();
    pg.copy(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);
    imageMode(CENTER);
    adapt();

    image(img, width/2, height/2, W, H);
    message = "Please wait while I obtain plane" + (planeNum+1) + " & save the image to your project folder...";
    infoMessage();
    pg.endDraw();
    pg.save("data/" + "plane" + (planeNum+1) + " " + random(0, 1000) + ".jpg");

    if (planeNum<7) {
      planeNum++;
    } else {
      background(51);
      dialog=false;
      message="";
      imageSelected = false;
      img=null;
      imgPath = null;
      planeNum = 0;
      stroke(0);
      //frameRate(-1);
    }
  } else {
    drawUI();
  }
}


int getChanPlane(int chan, int chanBright, String binChanBright, char binChar, color binCol) {
  chanBright = (int)brightness(chan);
  binChanBright = binary(chanBright, 8);
  binChar = binChanBright.charAt(planeNum);

  if (binChar=='1') {
    binCol=255;
  } else {
    binCol=0;
  }
  return binCol;
}

void fileSelected(File selection) {
  if (dialog==true) {
    if (selection != null) {
      //  background(51);
      //println("User selected " + selection.getAbsolutePath());
      imgPath = selection.getAbsolutePath(); 
      img = loadImage(imgPath);

      //println(selection);
      w  = img.width;
      h = img.height;
      //pg = createGraphics(w, h);
      imageMode(CENTER);
      adapt();
      image(img, width/2, height/2, W, H);
      message = "Copying the original image to your project folder...";
      infoMessage();
      //pg.copy(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);
      img.save("data/" + "original" + " " + random(0, 1000) + ".jpg");
      imageSelected = true;
      background(51);
    } else {
      println("Window was closed or the user hit cancel.");
    }
  }
}



void adapt() {
  W = img.width;
  H = img.height;
  if (W>width&&H<=height) {
    calcH();
  } else if (W<=width&&H>height) {
    calcW();
  } else if (W>width&&H>height) {
    if (W>H) {
      calcH();
      if (H>height) {
        calcW();
      }
    } else if (H>W) {
      calcW();
      if (W>width) {
        calcH();
      }
    } else {
      calcW();
    }
  }
}

void calcH() {
  diffPerW = (width/W)*100;
  H = (H/100)*diffPerW;
  W = width;
}
void calcW() {
  diffPerH = (height/H)*100;
  W = (W/100)*diffPerH;
  H = height;
}

void mousePressed() {
  if (mouseX>(width/2)-50&&mouseX<(width/2)+50) {
    if (mouseY>(height/2)-25&&mouseY<(height/2)+25) {
      noFill();
      dialog=true;
      selectInput("Select an image to process:", "fileSelected");
    }
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    background(51);
    dialog=false;
    message="";
    imageSelected = false;
    img=null;
    imgPath = null;
    planeNum = 0;
    stroke(0);
    //frameRate(-1);
  }
}

void infoMessage() {
  fill(0, 200);
  rect(width/2-250, height/2-20, 450, 40);
  fill(255);
  text(message, width/2, height/2);
}

void drawUI() {
  if (mouseX>(width/2)-50&&mouseX<(width/2)+50) {
    if (mouseY>(height/2)-24&&mouseY<(height/2)+24) {
      background(51);
      cursor(HAND);
      fill(0, 25);
      rect((width/2)-70, (height/2)-30, 140, 60);
    } else {
      background(51);
      cursor(ARROW);
      fill(0, 25);
      rect((width/2)-60, (height/2)-25, 120, 50);
    }
  } else {
    background(51);
    cursor(ARROW);
    fill(0, 25);
    rect((width/2)-60, (height/2)-25, 120, 50);
  }
  fill(255);
  text("SELECT IMAGE", (width/2)-3, (height/2));
}
