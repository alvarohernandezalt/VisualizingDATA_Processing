//Librerias
import processing.pdf.*;

PShape baseMap;
PImage img;
Table table;
String comunidadAutonoma[] = new String[0];
float monumento[] = new float[0];
float jardin[] = new float[0];
float arqueologia[] = new float[0];
float posX[] = new float[0];
float posY[] = new float[0];
float total[] = new float[0];
PFont f;

void setup() {
  noLoop();
  size(1200, 850);
  f = createFont("HelveticaLTStd-BoldCond", 12);
  img = loadImage("mapaEspanya.png");
  //baseMap = loadShape("mapaEspanya.svg");
  table = loadTable("BIC-mapaESP.csv", "header");
  for (TableRow row : table.rows()) {
    comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
    monumento = append(monumento, row.getFloat("monumento"));
    jardin = append(jardin, row.getFloat("jardin"));
    arqueologia = append(arqueologia, row.getFloat("arqueologia"));
    posX = append(posX, row.getFloat("centroX"));
    posY = append(posY, row.getFloat("centroY"));
    total = append(total, row.getFloat("monumento")+row.getFloat("jardin")+row.getFloat("arqueologia"));
  }
}

void draw() {
  beginRecord(PDF, "mapaJARComunidades.pdf");

  //shape(baseMap, 0, 0, width, height);
  noStroke();
  image(img,0,0);

  for (int i=0; i<monumento.length; i++) {

    fill(66, 130, 158, 150);
    textMode(MODEL);
    noStroke();
    float diamCON = jardin[i]*15;
    ellipse(posX[i], posY[i], diamCON, diamCON);

    fill(0);
    textAlign(CENTER);
    textFont(f);
    String[] conJU = nfc(jardin, 1);
    text(conJU[i], posX[i], posY[i]);
    textSize(10);
    text(comunidadAutonoma[i], posX[i], posY[i]+16);
  }
  endRecord();
  println("PDF Saved!");
}
