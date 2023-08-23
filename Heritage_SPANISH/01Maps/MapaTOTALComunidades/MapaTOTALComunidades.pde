//Librerias
import processing.pdf.*;

PShape baseMap;
PImage img;
Table table;
String comunidadAutonoma[] = new String[0];
float monumento[] = new float[0];
float conjunto[] = new float[0];
float arqueologia[] = new float[0];
float posX[] = new float[0];
float posY[] = new float[0];
float total[] = new float[0];
PFont f;

void setup() {
  noLoop();
  size(1200, 850);
  f = createFont("Arial", 12);
  img = loadImage("mapaEspanya.png");
  //baseMap = loadShape("mapaEspanaOK.svg");
  table = loadTable("BIC-mapaESP.csv", "header");
  for (TableRow row : table.rows()) {
    comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
    monumento = append(monumento, row.getFloat("monumento"));
    conjunto = append(conjunto, row.getFloat("conjunto"));
    arqueologia = append(arqueologia, row.getFloat("arqueologia"));
    posX = append(posX, row.getFloat("centroX"));
    posY = append(posY, row.getFloat("centroY"));
    total = append(total, (row.getFloat("monumento")+row.getFloat("conjunto")+row.getFloat("arqueologia"))/3);
  }
}

void draw() {
  beginRecord(PDF, "mapaTOTALComunidades.pdf");

  //shape(baseMap, 0, 0, width, height);
  noStroke();
  image(img,0,0);

  for (int i=0; i<monumento.length; i++) {

    fill(39, 99, 72, 90);
    textMode(MODEL);
    noStroke();
    float diamTOT = total[i]*15;
    ellipse(posX[i], posY[i], diamTOT, diamTOT);

    fill(0);
    textAlign(CENTER);
    textFont(f);
    String[] totalJU = nfc(total, 1);
    text(totalJU[i], posX[i], posY[i]);
    textSize(10);
    text(comunidadAutonoma[i], posX[i], posY[i]+16);
  }
  endRecord();
  println("PDF Saved!");
}
